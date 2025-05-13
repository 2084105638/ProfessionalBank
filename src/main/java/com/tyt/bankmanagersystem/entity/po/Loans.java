package com.tyt.bankmanagersystem.entity.po;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Zhuanz1
 */
@TableName("loans")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Loans {

  @TableId("loan_id")
  private long loanId;
  private long borrowerId;
  private long lenderId;
  private double amount;
  private double interestRate;
  private long termMonths;
  private java.sql.Date startDate;
  private java.sql.Date endDate;
  private String status;
  private java.sql.Timestamp createdAt;
  private java.sql.Timestamp updatedAt;

}
