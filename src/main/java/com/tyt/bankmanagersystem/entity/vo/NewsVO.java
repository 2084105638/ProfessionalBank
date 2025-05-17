package com.tyt.bankmanagersystem.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * @author Sylphy
 * @Description 新闻视图
 * @create 2025/4/28
 * */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NewsVO {
    private Long id;
    private String title;
    private String newsPhoto;
    private String content;
    private LocalDateTime time;
    private String author;
}
