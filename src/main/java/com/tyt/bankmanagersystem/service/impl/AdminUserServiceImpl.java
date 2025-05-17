package com.tyt.bankmanagersystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tyt.bankmanagersystem.config.AdminConfig;
import com.tyt.bankmanagersystem.config.exception.BusinessException;
import com.tyt.bankmanagersystem.entity.dto.admin.AddNewsDTO;
import com.tyt.bankmanagersystem.entity.dto.admin.AdminLoginDTO;

import com.tyt.bankmanagersystem.entity.dto.admin.AdminPageUserCardsDTO;
import com.tyt.bankmanagersystem.entity.po.BankCard;
import com.tyt.bankmanagersystem.entity.po.News;
import com.tyt.bankmanagersystem.entity.po.User;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminLoginVO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminUserCardsVO;
import com.tyt.bankmanagersystem.mapper.CardMapper;
import com.tyt.bankmanagersystem.mapper.NewsMapper;
import com.tyt.bankmanagersystem.mapper.UserMapper;
import com.tyt.bankmanagersystem.service.AdminService;
import com.tyt.bankmanagersystem.utils.JwtUtil;
import io.jsonwebtoken.lang.Maps;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.smartcardio.Card;
import java.time.LocalDateTime;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

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

    @Override
    public Page<AdminUserCardsVO> getUserCards(AdminPageUserCardsDTO adminPageUserCardsDTO) {
        Page<AdminUserCardsVO> page = new Page<>(adminPageUserCardsDTO.getCurrent(),adminPageUserCardsDTO.getSize());
        cardMapper.getUserCards(page, adminPageUserCardsDTO);
        System.out.println(page);
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
    public void unfreezeUserCard(String userName) {

    }

    @Override
    public String addNews(AddNewsDTO addNewsDTO) {
        News news = new News();
        BeanUtils.copyProperties(addNewsDTO,news);
        news.setTime(LocalDateTime.now());
        newsMapper.insert(news);

        return "上传成功";
    }
}
