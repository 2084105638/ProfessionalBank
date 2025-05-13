package com.tyt.bankmanagersystem.config.aspect.annotation;

import com.tyt.bankmanagersystem.config.aspect.annotation.constants.OperationType;

import java.lang.annotation.*;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/4
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AutoFill {
    OperationType value();
}
