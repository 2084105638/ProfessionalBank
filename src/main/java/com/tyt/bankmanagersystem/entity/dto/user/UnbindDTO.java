package com.tyt.bankmanagersystem.entity.dto.user;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/13
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UnbindDTO {
    private String cardNumber;
    private String payPassword;
}
