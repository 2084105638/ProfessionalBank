package com.tyt.bankmanagersystem.entity.dto.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/4
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CardAddDTO {
    private Long typeId;
    private String payPassword;
}
