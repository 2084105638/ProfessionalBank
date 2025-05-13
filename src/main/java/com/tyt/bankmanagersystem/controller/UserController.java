package com.tyt.bankmanagersystem.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.tyt.bankmanagersystem.config.exception.BusinessException;
import com.tyt.bankmanagersystem.entity.dto.WealthManagementProductsDTO;
import com.tyt.bankmanagersystem.entity.dto.user.*;
import com.tyt.bankmanagersystem.entity.vo.*;
import com.tyt.bankmanagersystem.entity.vo.user.UserInformationVO;
import com.tyt.bankmanagersystem.entity.vo.user.UserLoginVO;
import com.tyt.bankmanagersystem.entity.compoent.RedisComponent;
import com.tyt.bankmanagersystem.entity.vo.response.ResponseVO;
import com.tyt.bankmanagersystem.service.UserService;
import com.wf.captcha.ArithmeticCaptcha;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/*
 * @author Sylphy
 * @Description
 * @create 2025/4/9
 * */
@SuppressWarnings("ALL")
@Slf4j
@RestController
@RequestMapping("/user")
@CrossOrigin
@Validated
public class UserController extends BaseController{

    @Resource
    private UserService userService;
    @Resource
    private RedisComponent redisComponent;


    // 登录接口
    @PostMapping("/login")
    public ResponseVO login(@RequestBody UserLoginDTO userLoginDTO) {
        CheckCode(userLoginDTO.getCheckCodeKeyByUUID(), userLoginDTO.getCheckCode(), redisComponent);

        try {
            //登陆
            UserLoginVO userVO = userService.login(userLoginDTO);
            return getSuccessResponseVO(userVO);
        }finally {
            redisComponent.cleanCheckCodeByKey(userLoginDTO.getCheckCodeKeyByUUID());
        }
    }

    //登出
    @PostMapping("/logout")
    public ResponseVO logout(){
        log.info("登出成功");
        if(redisComponent.addLogoutJwtToken()){
            return getSuccessResponseVO("登出成功");
        }else throw new BusinessException("登出失败,未知错误");
    }

    //注册接口
    @PostMapping("/register")
    public ResponseVO register(@RequestBody UserRegisterDTO userRegistDTO){
        log.info("注册");
        CheckCode(userRegistDTO.getCheckCodeKeyByUUID(), userRegistDTO.getCheckCode(), redisComponent);

        try {
            userService.register(userRegistDTO);
            return getSuccessResponseVO(null);
        } finally {
            redisComponent.cleanCheckCodeByKey(userRegistDTO.getCheckCodeKeyByUUID());
        }
    }

    //获得人机验证码
    @GetMapping("/checkCode")
    public ResponseVO checkCode(){
        log.info("获得验证码");
        ArithmeticCaptcha arithmeticCaptcha = new ArithmeticCaptcha(100,42);
        String code = arithmeticCaptcha.text();
        String checkCodeKeyByUUID = redisComponent.saveCheckCode(code);
        String checkCodeImage = arithmeticCaptcha.toBase64();

        Map<String,String> map = new HashMap<>();
        map.put("checkCodeKeyByUUID",checkCodeKeyByUUID);
        map.put("checkCodeImage",checkCodeImage);
        return getSuccessResponseVO(map);
    }

    //返回主页
    @GetMapping("/index")
    public ResponseVO getIndex(){
        log.info("返回主页");
        IPage<NewsVO> index = userService.getIndex();
        return getSuccessResponseVO(index);
    }

    //添加银行卡
    @PutMapping("/addCard")
    public ResponseVO addCard(@RequestBody CardAddDTO cardAddDTO){
        log.info("添加银行卡");
        CardAddVO cardAddVO = userService.addCard(cardAddDTO);
        return getSuccessResponseVO(cardAddVO);
    }

    //获得账户信息
    @GetMapping("/getUserInformation")
    public ResponseVO getUserInformation(){
        log.info("获得账户信息");
        UserInformationVO userInformationVO = userService.getUserInformation();
        return getSuccessResponseVO(userInformationVO);
    }

    //余额查询
    @PostMapping("/getBalance")
    public ResponseVO getBalance(@RequestBody BalanceDTO balanceDTO){
        log.info("余额查询");
        BalanceVO balanceVO = userService.getBalance(balanceDTO);
        return getSuccessResponseVO(balanceVO);
    }

    //转账
    @PostMapping("/rollOut")
    public ResponseVO rollOut(@RequestBody RollOutDTO rollOutDTO){
        log.info("转账");
        RollOutVO rollOutVO = userService.rollOut(rollOutDTO);
        return getSuccessResponseVO(rollOutDTO);
    }

    //解绑银行卡
    @DeleteMapping("/unbinding")
    public ResponseVO unbinding(@RequestBody UnbindDTO unbindDTO){
        log.info("解绑银行卡");
        UnbindVO unbindVO = userService.unbinding(unbindDTO);
        return getSuccessResponseVO(unbindVO);
    }

    //理财产品
    @GetMapping("/wealthManagementProducts")
    public ResponseVO getWealthManagementProducts(){
        log.info("理财产品");
        WealthManagementProductsDTO wealthManagementProducts = userService.getWealthManagementProducts();
        return getSuccessResponseVO(wealthManagementProducts);
    }
}
