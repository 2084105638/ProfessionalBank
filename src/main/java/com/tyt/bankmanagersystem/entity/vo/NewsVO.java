package com.tyt.bankmanagersystem.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    private Integer id;
    private String title;
    private String pressPhoto;
//    private String content;
    private Date time;
}
