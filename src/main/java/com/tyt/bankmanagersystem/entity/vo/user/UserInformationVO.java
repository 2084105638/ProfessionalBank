package com.tyt.bankmanagersystem.entity.vo.user;

import com.tyt.bankmanagersystem.entity.po.BankCard;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * @author Sylphy
 * @Description
 * @create 2025/4/29
 * */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserInformationVO {
    private String name;
    private String gender;
    private String idCard;
    private String phone;
    private String email;
    private String address;
    private LocalDateTime createdAt;
    private List<UserInformationCardVO> bankCards;


    @Data
    public static class UserInformationCardVO{
        private String cardNumber;
        private Long typeId;
        private Long status;
        private Date createdAt;
        private Date updatedAt;
        private BigDecimal balance;
    }
}
