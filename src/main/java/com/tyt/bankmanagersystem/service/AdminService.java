package com.tyt.bankmanagersystem.service;

import com.tyt.bankmanagersystem.entity.dto.admin.AdminLoginDTO;
import com.tyt.bankmanagersystem.entity.dto.admin.AdminUserDTO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminLoginVO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminUserVO;
import org.springframework.data.domain.Page;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/3
 * */
public interface AdminService {
    Page<AdminUserVO> getUsers(AdminUserDTO adminUserDTO);

    AdminLoginVO login(AdminLoginDTO adminLoginVO);

    void freezeUser(String userName);

    void unfreezeUser(String userName);
}
