package com.tyt.bankmanagersystem.entity.vo.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/3
 * */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminLoginVO {
    private String username;
    private String role;
}
