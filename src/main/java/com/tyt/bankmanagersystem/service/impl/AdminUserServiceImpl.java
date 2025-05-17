package com.tyt.bankmanagersystem.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tyt.bankmanagersystem.MinioConfig;
import com.tyt.bankmanagersystem.config.AdminConfig;
import com.tyt.bankmanagersystem.config.exception.BusinessException;
import com.tyt.bankmanagersystem.entity.dto.admin.AddNewsDTO;
import com.tyt.bankmanagersystem.entity.dto.admin.AdminLoginDTO;

import com.tyt.bankmanagersystem.entity.dto.admin.AdminPageUserCardsDTO;
import com.tyt.bankmanagersystem.entity.po.BankCard;
import com.tyt.bankmanagersystem.entity.po.News;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminLoginVO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminUserCardsVO;
import com.tyt.bankmanagersystem.mapper.CardMapper;
import com.tyt.bankmanagersystem.mapper.NewsMapper;
import com.tyt.bankmanagersystem.mapper.UserMapper;
import com.tyt.bankmanagersystem.service.AdminService;
import com.tyt.bankmanagersystem.utils.JwtUtil;
import io.jsonwebtoken.lang.Maps;
import io.minio.*;
import io.minio.errors.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.UUID;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/3
 * */
@Service
@Slf4j
public class AdminUserServiceImpl implements AdminService {

    @Resource
    private AdminConfig adminConfig;
    @Resource
    private JwtUtil jwtUtil;
    @Resource
    private UserMapper userMapper;
    @Resource
    private CardMapper cardMapper;
    @Resource
    private NewsMapper newsMapper;
    @Resource
    private MinioConfig minioConfig;
    @Resource
    private MinioClient minioClient;

    @Override
    public Page<AdminUserCardsVO> getUserCards(AdminPageUserCardsDTO adminPageUserCardsDTO) {
        Page<AdminUserCardsVO> page = new Page<>(adminPageUserCardsDTO.getCurrent(),adminPageUserCardsDTO.getSize());
        Page<AdminUserCardsVO> userCards = cardMapper.getUserCards(page, adminPageUserCardsDTO);
        System.out.println(userCards.getRecords());
        Page<AdminUserCardsVO> adminUserCardsVOPage = new Page<>();
        BeanUtils.copyProperties(page,adminUserCardsVOPage);
        return adminUserCardsVOPage;
    }

    @Override
    public AdminLoginVO login(AdminLoginDTO adminLoginDTO) {
        if(!adminLoginDTO.getUserName().equals(adminConfig.getAdminUsername()) && !adminLoginDTO.getPassword().equalsIgnoreCase(adminConfig.getPassword())){
            throw new BusinessException("登陆失败");
        }
        String jwt = jwtUtil.generateToken(adminLoginDTO.getUserName());

        return AdminLoginVO.builder()
                .role("admin")
                .jwtToken(jwt)
                .username(adminLoginDTO.getUserName())
                .build();
    }

    @Override
    public String freezeUserCard(String cardNumber) {
        BankCard card = cardMapper.selectByMap(Maps.of("card_number", (Object) cardNumber).build())
                .stream()
                .findFirst()
                .orElse(null);
        if(card == null){
            throw new BusinessException("未找到银行卡");
        }
        card.setStatus(0);
        cardMapper.updateById(card);
        return "冻结成功";
    }

    @Override
    public String unfreezeUserCard(String cardNumber) {
        BankCard card = cardMapper.selectByMap(Maps.of("card_number", (Object) cardNumber).build())
                .stream()
                .findFirst()
                .orElse(null);
        if(card == null){
            throw new BusinessException("未找到银行卡");
        }
        card.setStatus(1);
        cardMapper.updateById(card);
        return "解冻成功";
    }

    @Override
    public String addNews(AddNewsDTO addNewsDTO, MultipartFile newsPhoto) {
        String bucket = minioConfig.getBucketName();
        String photoName = UUID.randomUUID() + "_" + newsPhoto.getOriginalFilename();
        System.out.println(photoName);

        News news = new News();
        BeanUtils.copyProperties(addNewsDTO,news);

        news.setNewsPhoto(photoName);
        news.setTime(LocalDateTime.now());
        newsMapper.insert(news);


        // 如果桶不存在则创建
        try {
            if (!minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucket).build())) {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucket).build());
            }
            // 上传文件
            minioClient.putObject(
                    PutObjectArgs.builder()
                            .bucket(bucket)
                            .object(photoName)
                            .stream(newsPhoto.getInputStream(), newsPhoto.getSize(), -1)
                            .contentType(newsPhoto.getContentType())
                            .build()
            );
        } catch (ErrorResponseException | InsufficientDataException | InternalException | InvalidKeyException |
                 InvalidResponseException | IOException | NoSuchAlgorithmException | ServerException |
                 XmlParserException e) {
            throw new RuntimeException(e);
        }


        return "上传成功";
    }

    @Override
    public String deleteNews(String newsId) {
        String bucket = minioConfig.getBucketName();
        News news = newsMapper.selectById(newsId);
        if(news == null){
            throw new BusinessException("未查到对应新闻");
        }
        newsMapper.deleteById(newsId);


        try {
            minioClient.removeObject(
                    RemoveObjectArgs.builder()
                            .bucket(bucket)
                            .object(news.getNewsPhoto())
                            .build()
            );
        } catch (ErrorResponseException | InsufficientDataException | InternalException | InvalidKeyException |
                 InvalidResponseException | IOException | NoSuchAlgorithmException | ServerException |
                 XmlParserException e) {
            throw new RuntimeException(e);
        }

        return "删除成功";
    }
}
