package com.tyt.bankmanagersystem.config.aspect;

import com.tyt.bankmanagersystem.config.aspect.annotation.AutoFill;
import com.tyt.bankmanagersystem.config.aspect.annotation.constants.OperationType;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.annotation.Annotation;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/4
 */
@Component
@Aspect
public class AutoFillAspect {
    @Pointcut(value = "@annotation(com.tyt.bankmanagersystem.config.aspect.annotation.AutoFill)")
    public void aspectPointcut(){
    }

    @Before(value = "aspectPointcut()")
    public void autoFile(JoinPoint joinPoint){
        Object[] args = joinPoint.getArgs();
        OperationType value = ((MethodSignature) joinPoint.getSignature()).getMethod().getAnnotation(AutoFill.class).value();



    }
}
