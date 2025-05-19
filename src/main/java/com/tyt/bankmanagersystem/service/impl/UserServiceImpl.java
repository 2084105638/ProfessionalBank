package com.tyt.bankmanagersystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tyt.bankmanagersystem.MinioConfig;
import com.tyt.bankmanagersystem.config.ThreadLocalHolder;
import com.tyt.bankmanagersystem.config.exception.BusinessException;
import com.tyt.bankmanagersystem.entity.TransactionType;
import com.tyt.bankmanagersystem.entity.dto.WealthManagementProductsDTO;
import com.tyt.bankmanagersystem.entity.dto.user.*;
import com.tyt.bankmanagersystem.entity.po.BankCard;
import com.tyt.bankmanagersystem.entity.po.News;
import com.tyt.bankmanagersystem.entity.po.TransactionRecord;
import com.tyt.bankmanagersystem.entity.po.User;
import com.tyt.bankmanagersystem.entity.vo.*;
import com.tyt.bankmanagersystem.entity.vo.user.UserInformationVO;
import com.tyt.bankmanagersystem.entity.vo.user.UserLoginVO;
import com.tyt.bankmanagersystem.mapper.CardMapper;
import com.tyt.bankmanagersystem.mapper.NewsMapper;
import com.tyt.bankmanagersystem.mapper.TransactionRecordMapper;
import com.tyt.bankmanagersystem.mapper.UserMapper;
import com.tyt.bankmanagersystem.service.UserService;
import com.tyt.bankmanagersystem.utils.JwtUtil;
import com.tyt.bankmanagersystem.utils.MD5Util;
import io.jsonwebtoken.lang.Maps;
import io.minio.GetPresignedObjectUrlArgs;
import io.minio.MinioClient;
import io.minio.errors.*;
import io.minio.http.Method;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author Sylphy
 * @Description
 * @create 2025/4/9
 * */
@Service
@Slf4j
@Transactional(
        propagation = Propagation.REQUIRED,
        isolation = Isolation.READ_COMMITTED,
        timeout = 30,
        rollbackFor = Exception.class
)


public class UserServiceImpl implements UserService{

    @Resource
    private UserMapper userMapper;
    @Resource
    private JwtUtil jwtUtil;
    @Resource
    private NewsMapper newsMapper;
    @Resource
    private CardMapper cardMapper;
    @Resource
    private TransactionRecordMapper transactionRecordMapper;
    @Resource
    ThreadLocalHolder threadLocalHolder;
    @Resource
    MinioClient minioClient;
    @Resource
    MinioConfig minioConfig;

    @Override
    public UserLoginVO login(UserLoginDTO userLoginDTO) {
        String token = jwtUtil.generateToken(userLoginDTO.getPhone());
        HashMap<String, Object> map = new HashMap<>(10);
        map.put("phone",userLoginDTO.getPhone());
        map.put("password_hash",MD5Util.md5(userLoginDTO.getPassword()));
        User user = userMapper.selectByMap(map).stream().findAny().orElse(null);
        if (user == null) {
            throw new BusinessException("登陆失败，手机号或密码错误");
        }

        UpdateWrapper<User> wrapper = new UpdateWrapper<>();
        wrapper.eq(true,"phone",userLoginDTO.getPhone()).set(true,"last_login_time",LocalDateTime.now());
        userMapper.update(null,wrapper);

        return UserLoginVO.builder()
                .jwtToken(token)
                .phone(user.getPhone())
                .name(user.getName())
                .build();

    }

    @Override
    public void register(UserRegisterDTO userRegisterDTO) {
        Map<String,Object> map = new HashMap<>(1);
        map.put("phone", userRegisterDTO.getPhone());
        List<User> users = userMapper.selectByMap(map);
        if(!users.isEmpty()){
            throw new BusinessException("此手机号已注册");
        }
        User build = User.builder()
                .idCard(userRegisterDTO.getIdCard())
                .phone(userRegisterDTO.getPhone())
                .name(userRegisterDTO.getName())
                .passwordHash(MD5Util.md5(userRegisterDTO.getRegisterPassword()))
                .createdAt(LocalDateTime.now())
                .build();
        userMapper.insert(build);
    }

    @Override
    public IPage<NewsVO> getIndex() {
        Page<News> objectPage = new Page<>(1,100);
//        if(size != null && current != null){
//            objectPage.setCurrent(current);
//            objectPage.setSize(size);
//        }
        Page<News> newsPage = newsMapper.selectPage(objectPage, null);
        List<NewsVO> newsVOList = newsPage.getRecords().stream().map(news -> {
            NewsVO newsVO = new NewsVO();
            BeanUtils.copyProperties(news, newsVO);
            System.out.println(news.getTime());
            // 生成预签名访问 URL（有效期1小时）
            try {
                String url = minioClient.getPresignedObjectUrl(
                        GetPresignedObjectUrlArgs.builder()
                                .bucket(minioConfig.getBucketName())
                                .object(news.getNewsPhoto())
                                .method(Method.GET)
                                .expiry(60 * 60)  // 秒数
                                .build()
                );
                newsVO.setNewsPhoto(url);
                return newsVO;
            } catch (ErrorResponseException | ServerException | XmlParserException | NoSuchAlgorithmException |
                     IOException | InvalidResponseException | InvalidKeyException | InternalException |
                     InsufficientDataException e) {
                throw new RuntimeException(e);
            }
        }).collect(Collectors.toList());
        Page<NewsVO> newsVOPage = new Page<>();
        BeanUtils.copyProperties(newsPage,newsVOPage);
        newsVOPage.setRecords(newsVOList);
        return newsVOPage;
    }

    @Override
    public CardAddVO addCard(CardAddDTO cardAddDTO) {
        if(cardAddDTO.getPayPassword() == null || cardAddDTO.getTypeId() == null){
            throw new BusinessException("添加失败，银行卡信息有误");
        }

        BankCard bankCard = new BankCard();
        BeanUtils.copyProperties(cardAddDTO,bankCard);
        bankCard.setPayPassword(MD5Util.md5( bankCard.getPayPassword()));
        bankCard.setCardNumber(String.valueOf(RandomUtils.nextLong(1000000000L, 9999999999L)));


        User user = getCurrentUser();
        if(user == null){
            throw new BusinessException("参数错误,无法添加到用户上");
        }
        bankCard.setUserId(user.getUserId());
        //默认有1000元
        bankCard.setBalance(BigDecimal.valueOf(1000));

        cardMapper.insert(bankCard);
        CardAddVO cardAddVO = new CardAddVO();
        BeanUtils.copyProperties(bankCard,cardAddVO);
        return cardAddVO;
    }

    @Override
    public UserInformationVO getUserInformation() {
        User user = getCurrentUser();
        if (user == null) {
            throw new BusinessException("查询错误");
        }
        List<UserInformationVO.UserInformationCardVO> cards = new ArrayList<>(cardMapper.selectByMap(Maps.of("user_id", (Object) user.getUserId()).build()))
                .stream()
                .map(bankCard -> {
                    UserInformationVO.UserInformationCardVO userInformationCardVO = new UserInformationVO.UserInformationCardVO();
                    BeanUtils.copyProperties(bankCard, userInformationCardVO);
                    return userInformationCardVO;
                })
                .collect(Collectors.toList());
        UserInformationVO userInformationVO = new UserInformationVO();

        BeanUtils.copyProperties(user,userInformationVO);
        userInformationVO.setBankCards(cards);
        return userInformationVO;
    }

    @Override
    public BalanceVO getBalance(BalanceDTO balanceDTO) {
        BankCard bankCard = getCurrentBankCard(balanceDTO.getCardNumber(),balanceDTO.getPayPassword());

        return BalanceVO.builder()
                .balance(bankCard.getBalance())
                .cardNumber(balanceDTO.getCardNumber())
                .build();
    }

    @Override
    public RollOutVO rollOut(RollOutDTO rollOutDTO) {
        BankCard bankCard = getCurrentBankCard(rollOutDTO.getCardNumber(),rollOutDTO.getPayPassword());

        BankCard relateBankCard = cardMapper.selectByMap(Maps.of("card_number", (Object) rollOutDTO.getRelatedCardNumber()).build())
                .stream()
                .findAny()
                .orElse(null);

        if(relateBankCard == null){
            throw new BusinessException("找不到对应银行卡");
        }
        if(bankCard.getStatus() == 0){
            throw new BusinessException("银行卡被冻结");
        }
        if(relateBankCard.getStatus() == 0){
            throw new BusinessException("对方银行卡被冻结");
        }

        relateBankCard.setBalance(relateBankCard.getBalance().add(rollOutDTO.getAmount()));
        bankCard.setBalance(bankCard.getBalance().subtract(rollOutDTO.getAmount()));

        if(bankCard.getBalance().compareTo(BigDecimal.ZERO) < 0){
            throw new BusinessException("余额不足");
        }
        //转出记录
        TransactionRecord rollOutRecord = TransactionRecord.builder()
                .transactionType(TransactionType.transfer_out)
                .balanceAfter(bankCard.getBalance())
                .description(rollOutDTO.getDescription())
                .cardId(bankCard.getCardId())
                .relatedCardId(relateBankCard.getCardId())
                .build();
        //转入记录
        TransactionRecord rollInRecord = TransactionRecord.builder()
                .transactionType(TransactionType.transfer_in)
                .balanceAfter(relateBankCard.getBalance())
                .description(rollOutDTO.getDescription())
                .cardId(relateBankCard.getCardId())
                .relatedCardId(bankCard.getCardId())
                .build();
        transactionRecordMapper.insert(rollOutRecord);
        transactionRecordMapper.insert(rollInRecord);
        cardMapper.updateById(bankCard);
        cardMapper.updateById(relateBankCard);

        RollOutVO rollOutVO = new RollOutVO();
        BeanUtils.copyProperties(rollOutRecord,rollOutVO);
        return rollOutVO;
    }

    @Override
    public UnbindVO unbinding(UnbindDTO unbindDTO) {
        BankCard card = getCurrentBankCard(unbindDTO.getCardNumber(),unbindDTO.getPayPassword());
        System.out.println(card.getBalance());
        System.out.println(BigDecimal.valueOf(0.000));
        if (!Objects.equals(card.getBalance(), BigDecimal.ZERO.setScale(2, RoundingMode.HALF_UP))) {
            throw new BusinessException("删除失败,卡内有余额");
        }
        //todo 检查一些其他和银行卡有关的联系，如果有必要则禁止删除银行卡(使用策略模式)
        cardMapper.deleteById(card.getCardId());
        return UnbindVO.builder()
                .status("删除成功")
                .cardNumber(card.getCardNumber())
                .build();
    }

    @Override
    public WealthManagementProductsDTO getWealthManagementProducts() {
        return null;
    }

    private BankCard getCurrentBankCard(String cardNumber,String payPassword) {
        User user = getCurrentUser();
        if (user == null) {
            throw new BusinessException("查询错误");
        }

        BankCard bankCard = cardMapper.selectByMap(Maps.of("user_id", (Object) user.getUserId()).and("card_number", cardNumber).build())
                .stream()
                .findAny()
                .orElse(null);

        if(bankCard == null){
            throw new BusinessException("找不到对应银行卡");
        }
        if(!MD5Util.md5(payPassword).equals( bankCard.getPayPassword())){
            throw new BusinessException("密码错误");
        }

        return bankCard;
    }
    private User getCurrentUser(){
        return userMapper.selectByMap(Maps.of("phone", threadLocalHolder.get("phone")).build()).stream()
                .findAny()
                .orElse(null);

    }
}
