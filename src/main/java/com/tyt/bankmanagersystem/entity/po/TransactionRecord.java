package com.tyt.bankmanagersystem.entity.po;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tyt.bankmanagersystem.entity.TransactionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author Zhuanz1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@TableName("transaction_record")
public class TransactionRecord {

  @TableId
  private Long transactionId;
  private long cardId;
  private TransactionType transactionType;
  private double amount;
  private BigDecimal balanceAfter;
  private long relatedCardId;
  private String description;
  private LocalDateTime createdAt;
}
