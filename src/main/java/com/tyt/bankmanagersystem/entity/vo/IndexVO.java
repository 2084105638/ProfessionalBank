package com.tyt.bankmanagersystem.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/*
 * @author Sylphy
 * @Description 主页返回视图
 * @create 2025/4/28
 * */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class IndexVO {
    public List<NewsVO> title;
}
