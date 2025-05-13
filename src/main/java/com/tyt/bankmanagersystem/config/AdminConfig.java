package com.tyt.bankmanagersystem.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/13
 */
@ConfigurationProperties(prefix = "bank-admin")
@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminConfig {
    private String adminUsername;
    private String password;

    @Bean
    public AdminConfig myService() {
        return new AdminConfig(adminUsername,password);
    }
}
