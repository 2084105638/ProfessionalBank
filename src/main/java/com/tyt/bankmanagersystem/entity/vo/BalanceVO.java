package com.tyt.bankmanagersystem.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Sylphy
 * @Description
 * @create 2025/4/29
 * */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BalanceVO {
    private BigDecimal balance;
    private String cardNumber;
}
