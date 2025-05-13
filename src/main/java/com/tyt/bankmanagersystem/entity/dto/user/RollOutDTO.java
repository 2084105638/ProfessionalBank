package com.tyt.bankmanagersystem.entity.dto.user;

import com.tyt.bankmanagersystem.entity.TransactionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/8
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RollOutDTO {
    private String cardNumber;
    private String payPassword;

    private String relatedCardNumber;
    private BigDecimal amount;

    private String description;
}
