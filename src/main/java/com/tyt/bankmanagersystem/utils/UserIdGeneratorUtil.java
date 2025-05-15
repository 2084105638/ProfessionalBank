package com.tyt.bankmanagersystem.utils;


import com.tyt.bankmanagersystem.entity.constant.Constants;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author Sylphy
 * @Description
 * @create 2025/4/24
 * */
public class UserIdGeneratorUtil {
    // 假设机器ID为1
    private static final int MACHINE_ID = 1;
    // 用于保证同一秒内生成的ID唯一
    private static final AtomicInteger SEQUENCE = new AtomicInteger(0);
    // 每秒最多生成100个ID
    private static final int MAX_SEQUENCE = 100;

    /**
     * 生成与时间相关的用户ID
     * @return 生成的用户ID
     */
    public static Integer generateUserId() {
        // 获取当前时间的秒级时间戳
        long timestamp = System.currentTimeMillis() / 1000;

        // 获取当前秒内的序列号，最多支持生成MAX_SEQUENCE个ID
        int sequence = SEQUENCE.getAndIncrement();
        if (sequence >= MAX_SEQUENCE) {
            SEQUENCE.set(0);
            sequence = SEQUENCE.getAndIncrement();
        }

        // 使用位移操作将各个部分拼接成一个32位的int
        int userId = (int) (timestamp & 0xFFFF) << 16 | (MACHINE_ID & 0xFF) << 8 | (sequence & 0xFF);

        // 将生成的ID转换为字符串，并截取最大长度（确保ID长度不超过指定值）
        String userIdStr = String.valueOf(userId);

        // 如果ID超出最大长度，进行截取
        if (userIdStr.length() > Constants.MAX_ID_LENGTH) {
            // 截取ID的低位部分
            userIdStr = userIdStr.substring(userIdStr.length() - Constants.MAX_ID_LENGTH);
        }

        // 将截取后的ID转换为Integer类型
        return Integer.valueOf(userIdStr);
    }


}
