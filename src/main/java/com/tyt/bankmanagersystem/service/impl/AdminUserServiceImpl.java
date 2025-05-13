package com.tyt.bankmanagersystem.service.impl;

import com.tyt.bankmanagersystem.config.AdminConfig;
import com.tyt.bankmanagersystem.config.exception.BusinessException;
import com.tyt.bankmanagersystem.entity.dto.admin.AdminLoginDTO;
import com.tyt.bankmanagersystem.entity.dto.admin.AdminUserDTO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminLoginVO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminUserVO;
import com.tyt.bankmanagersystem.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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

    @Override
    public Page<AdminUserVO> getUsers(AdminUserDTO adminUserDTO) {
        return null;
    }

    @Override
    public AdminLoginVO login(AdminLoginDTO adminLoginDTO) {
        if(!adminLoginDTO.getUserName().equals(adminConfig.getAdminUsername()) && !adminLoginDTO.getPassword().equalsIgnoreCase(adminConfig.getPassword())){
            throw new BusinessException("登陆失败");
        }



        return AdminLoginVO.builder()
                .role("root")
                .username(adminLoginDTO.getUserName())
                .build();
    }

    @Override
    public void freezeUser(String userName) {

    }

    @Override
    public void unfreezeUser(String userName) {

    }
}
