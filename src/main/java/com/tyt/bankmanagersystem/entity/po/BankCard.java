package com.tyt.bankmanagersystem.entity.po;


import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * @author Zhuanz1
 */
@Data
@TableName("bank_card")
public class BankCard {

  @TableId
  private Long cardId;
  @TableField
  private Long userId;
  @TableField
  private String cardNumber;
  @TableField
  private String payPassword;
  @TableField
  private long typeId;
  @TableField
  private long status;
  @TableField
  private LocalDateTime createdAt;
  @TableField(fill = FieldFill.UPDATE)
  private LocalDateTime updatedAt;
  @TableField
  private BigDecimal balance;




}
