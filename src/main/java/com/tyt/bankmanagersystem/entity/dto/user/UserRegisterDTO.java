package com.tyt.bankmanagersystem.entity.dto.user;

import com.tyt.bankmanagersystem.entity.constant.Constants;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.validation.annotation.Validated;


/**
 * @author Sylphy
 * @Description
 * @create 2025/5/4
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Validated
public class UserRegisterDTO {

    String phone;
    String idCard;
    String name;
    String checkCodeKeyByUUID;
    String checkCode;
    String registerPassword;
}
