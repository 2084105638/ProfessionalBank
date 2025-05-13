package com.tyt.bankmanagersystem;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Zhuanz1
 */
@SpringBootApplication
@MapperScan("com.tyt.bankmanagersystem.mapper")
public class BankManagerSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(BankManagerSystemApplication.class, args);
    }

}
