package com.tyt.bankmanagersystem.controller;

import com.tyt.bankmanagersystem.entity.dto.admin.AdminLoginDTO;
import com.tyt.bankmanagersystem.entity.dto.admin.AdminUserDTO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminLoginVO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminUserVO;
import com.tyt.bankmanagersystem.entity.vo.response.ResponseVO;
import com.tyt.bankmanagersystem.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/users")
    public ResponseVO getUsers(@RequestBody AdminUserDTO adminUserDTO){
        log.info("管理员获得用户信息");
        Page<AdminUserVO> users = adminService.getUsers(adminUserDTO);
        return getSuccessResponseVO(users);
    }

    @PostMapping("/freezeUser")
    public ResponseVO freezeUser(@RequestParam String userName){
        log.info("管理员冻结用户");
        adminService.freezeUser(userName);
        return getSuccessResponseVO(null);
    }

    @PostMapping("/unfrezeUser")
    public ResponseVO unfreezeUser(@RequestParam String UserName){
        log.info("管理员解冻用户");
        adminService.unfreezeUser(UserName);
        return getSuccessResponseVO(null);
    }

}
