package com.tyt.bankmanagersystem.entity.po;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @author Zhuanz1
 */
@Data
@TableName("news")
public class News {
    @TableId
    private Integer id;
    private String title;
    private String content;
    private Date time;
    private String newsPhoto;
}
