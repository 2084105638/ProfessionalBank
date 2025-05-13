package com.tyt.bankmanagersystem.entity.vo.response;


import lombok.Data;

/**
 * @author Zhuanz1
 */
@Data
public class ResponseVO<T> {
    private String status;
    private Integer code;
    private String message;
    private T data;
}
