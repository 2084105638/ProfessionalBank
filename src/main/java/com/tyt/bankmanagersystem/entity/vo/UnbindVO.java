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
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class UnbindVO {
    private String status;
    private String cardNumber;
}
