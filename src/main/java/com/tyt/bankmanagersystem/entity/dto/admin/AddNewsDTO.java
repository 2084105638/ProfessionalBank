package com.tyt.bankmanagersystem.entity.dto.admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AddNewsDTO {
    private String title;
    private String context;
    private String newsPhoto;
    private String author;
}
