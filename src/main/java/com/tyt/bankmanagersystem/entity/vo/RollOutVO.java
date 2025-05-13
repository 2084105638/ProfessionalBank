package com.tyt.bankmanagersystem.entity.vo;

import com.tyt.bankmanagersystem.entity.TransactionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author Sylphy
 * @Description
 * @create 2025/4/29
 * */
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class RollOutVO {
    private TransactionType transactionType;
    private BigDecimal amount;
    private Integer relatedCardId;
    private String description;
    private LocalDateTime createAt;
}
