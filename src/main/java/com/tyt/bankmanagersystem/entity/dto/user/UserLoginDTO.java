package com.tyt.bankmanagersystem.entity.dto.user;

import com.tyt.bankmanagersystem.entity.constant.Constants;
import lombok.Data;


/**
 * @author Sylphy
 * @Description
 * @create 2025/4/29
 * */
@Data
public class UserLoginDTO {
    private String phone;

    private String checkCodeKeyByUUID;

    private String checkCode;

    private String password;
}
