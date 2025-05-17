package com.tyt.bankmanagersystem.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.tyt.bankmanagersystem.entity.dto.admin.AddNewsDTO;
import com.tyt.bankmanagersystem.entity.dto.admin.AdminLoginDTO;
import com.tyt.bankmanagersystem.entity.dto.admin.AdminPageUserCardsDTO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminLoginVO;
import com.tyt.bankmanagersystem.entity.vo.admin.AdminUserCardsVO;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author Sylphy
 * @Description
 * @create 2025/5/3
 * */
public interface AdminService {
    Page<AdminUserCardsVO> getUserCards(AdminPageUserCardsDTO adminPageUserCardsDTO);

    AdminLoginVO login(AdminLoginDTO adminLoginVO);

    String freezeUserCard(String cardNumber);

    String unfreezeUserCard(String userName);

    String addNews(AddNewsDTO addNewsDTO, MultipartFile newsPhoto);

    String deleteNews(String newsId);
}
