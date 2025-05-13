package com.tyt.bankmanagersystem.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/*
 * @author Sylphy
 * @Description
 * @create 2025/4/24
 * */
public class MD5Util {
    public static String md5(String input) {
        try {
            // 创建MD5的MessageDigest实例
            MessageDigest md = MessageDigest.getInstance("MD5");
            // 执行MD5算法
            byte[] hashBytes = md.digest(input.getBytes());

            // 转换为16进制字符串
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            // 如果没有MD5算法，抛出运行时异常
            throw new RuntimeException("MD5算法不存在", e);
        }
    }
}
