package com.tyt.bankmanagersystem.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tyt.bankmanagersystem.entity.dto.admin.AddNewsDTO;
import com.tyt.bankmanagersystem.entity.dto.admin.AdminLoginDTO;

import com.tyt.bankmanagersystem.entity.dto.admin.AdminPageUserCardsDTO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminLoginVO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminUserCardsVO;
import com.tyt.bankmanagersystem.entity.vo.response.ResponseVO;
import com.tyt.bankmanagersystem.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;


/**
 * @author Zhuanz1
 *
 */
@SuppressWarnings("rawtypes")
@Slf4j
@RestController
@RequestMapping("/admin")
@CrossOrigin
public class AdminController extends BaseController{

    @Resource
    AdminService adminService;

    @PostMapping("/login")
    public ResponseVO login(@RequestBody AdminLoginDTO adminLoginDTO){
        log.info("管理员登陆");
        AdminLoginVO adminLoginVO =  adminService.login(adminLoginDTO);
        return getSuccessResponseVO(adminLoginVO);
    }

    @PostMapping("/UserCards")
    public ResponseVO getUserCards(@RequestBody AdminPageUserCardsDTO adminUserCardsDTO){
        log.info("管理员获得用户银行卡信息");
        Page<AdminUserCardsVO> users = adminService.getUserCards(adminUserCardsDTO);
        return getSuccessResponseVO(users);
    }

    @PostMapping("/freezeUserCard")
    public ResponseVO freezeUserCard(@RequestParam String cardNumber){
        log.info("管理员冻结用户");
        String ret = adminService.freezeUserCard(cardNumber);
        return getSuccessResponseVO(ret);
    }

    @PostMapping("/unfreezeUserCard")
    public ResponseVO unfreezeUserCard(@RequestParam String userName){
        log.info("管理员解冻用户");
        adminService.unfreezeUserCard(userName);
        return getSuccessResponseVO(null);
    }

    @PostMapping("/addNews")
    public ResponseVO addNews(@RequestPart AddNewsDTO addNewsDTO,@RequestParam MultipartFile newsPhoto){
        log.info("管理员添加新闻");
        String ret = adminService.addNews(addNewsDTO,newsPhoto);
        return getSuccessResponseVO(ret);
    }

}
