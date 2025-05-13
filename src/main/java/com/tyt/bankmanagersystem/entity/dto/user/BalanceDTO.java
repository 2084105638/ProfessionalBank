package com.tyt.bankmanagersystem.entity.dto.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/8
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BalanceDTO {
    private String cardNumber;
    private String payPassword;
}
