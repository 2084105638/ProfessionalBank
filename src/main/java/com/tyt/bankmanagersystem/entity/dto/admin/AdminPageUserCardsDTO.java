package com.tyt.bankmanagersystem.entity.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/3
 * */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminPageUserCardsDTO {
    private Integer current;
    private Integer size;
    private String sort;
    private String name;
}
