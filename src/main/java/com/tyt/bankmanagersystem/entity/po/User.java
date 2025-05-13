package com.tyt.bankmanagersystem.entity.po;


import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Zhuanz1
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @TableId
    private Long userId;
    @TableField
    private String name;
    @TableField
    private String gender;
    @TableField
    private String idCard;
    @TableField
    private String phone;
    @TableField
    private String email;
    @TableField
    private String passwordHash;
    @TableField
    private String address;
    @TableField
    private LocalDateTime createdAt;
    @TableField
    private LocalDateTime lastLoginTime;
    @TableField
    private Integer loginAttempts;
}
