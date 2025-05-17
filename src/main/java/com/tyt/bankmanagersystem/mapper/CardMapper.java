package com.tyt.bankmanagersystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tyt.bankmanagersystem.entity.dto.admin.AdminPageUserCardsDTO;
import com.tyt.bankmanagersystem.entity.po.BankCard;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminUserCardsVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/7
 */
public interface CardMapper extends BaseMapper<BankCard> {


    Page<AdminUserCardsVO> getUserCards(Page<AdminUserCardsVO> page , @Param("dto") AdminPageUserCardsDTO adminPageUserCardsDTO);
}
