package com.tyt.bankmanagersystem.entity.vo.user;

/*
 * @author Sylphy
 * @Description
 * @create 2025/4/11
 * */

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Zhuanz1
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserLoginVO {

    private String jwtToken;
    private String phone;
    private String name;

}
