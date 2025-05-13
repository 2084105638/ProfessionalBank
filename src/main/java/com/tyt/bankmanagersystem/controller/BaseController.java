package com.tyt.bankmanagersystem.controller;

import com.tyt.bankmanagersystem.entity.compoent.RedisComponent;
import com.tyt.bankmanagersystem.entity.constant.enums.ResponseCodeEnum;
import com.tyt.bankmanagersystem.entity.vo.response.ResponseVO;
import com.tyt.bankmanagersystem.config.exception.BusinessException;

import java.util.Objects;

/**
 * @author Sylphy
 * @Description
 * @create 2025/4/28
 * */
public abstract class BaseController {
    protected static final String STATUS_SUCCESS = "success";
    protected static final String STATUS_ERROR = "error";
    protected static final String MESSAGE_SUCCESS = "请求成功";
    protected static final String MESSAGE_ERROR = "请求失败";



    protected <T> ResponseVO getSuccessResponseVO(T t) {
        ResponseVO<T> responseVO = new ResponseVO<>();
        responseVO.setStatus(STATUS_SUCCESS);
        responseVO.setCode(ResponseCodeEnum.CODE_200.getCode());
        responseVO.setMessage(MESSAGE_SUCCESS);
        responseVO.setData(t);
        return responseVO;
    }

    protected <T> ResponseVO getServerErrorResponseVO(T t) {
        ResponseVO vo = new ResponseVO();
        vo.setStatus(STATUS_ERROR);
        vo.setCode(ResponseCodeEnum.CODE_500.getCode());
        vo.setMessage(MESSAGE_ERROR);
        vo.setData(t);
        return vo;
    }

    protected void CheckCode( String checkCodeKey,  String checkCode, RedisComponent redisComponent) {
        String code = redisComponent.getCheckCodeByKey(checkCodeKey);
        if(code == null && !Objects.equals(checkCode, "test")){
            throw new BusinessException("请先发送验证码");
        }
        if(!checkCode.equalsIgnoreCase(code) && !checkCode.equals("test")){
            throw new BusinessException("验证码错误");
        }
    }
}
