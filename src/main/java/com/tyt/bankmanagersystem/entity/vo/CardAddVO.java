package com.tyt.bankmanagersystem.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Sylphy
 * @Description
 * @create 2025/4/29
 * */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CardAddVO {
    private String cardNumber;
    private Long typeId;
    private Long status;
}
