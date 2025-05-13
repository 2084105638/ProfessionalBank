package com.tyt.bankmanagersystem.entity.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/3
 * */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminLoginDTO {
    private String userName;
    private String password;
}
