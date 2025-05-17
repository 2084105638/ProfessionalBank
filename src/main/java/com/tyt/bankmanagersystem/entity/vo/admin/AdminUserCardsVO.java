package com.tyt.bankmanagersystem.entity.vo.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/3
 * */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminUserCardsVO {
    private String name;
    private String phone;

    private String cardNumber;
    private Long status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private BigDecimal balance;

}
