package com.tyt.bankmanagersystem.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.tyt.bankmanagersystem.entity.dto.WealthManagementProductsDTO;
import com.tyt.bankmanagersystem.entity.dto.user.*;
import com.tyt.bankmanagersystem.entity.vo.*;
import com.tyt.bankmanagersystem.entity.vo.user.UserInformationVO;
import com.tyt.bankmanagersystem.entity.vo.user.UserLoginVO;


/**
 * @author Sylphy
 * @Description
 * @create 2025/4/9
 * */
public interface UserService {

    UserLoginVO login(UserLoginDTO userLoginDTO);

    void register(UserRegisterDTO userRegisterDTO);

    IPage<NewsVO>  getIndex();

    CardAddVO addCard(CardAddDTO cardAddDTO);

    UserInformationVO getUserInformation();

    BalanceVO getBalance(BalanceDTO balanceDTO);

    RollOutVO rollOut(RollOutDTO rollOutDTO);

    UnbindVO unbinding(UnbindDTO unbindDTO);

    WealthManagementProductsDTO getWealthManagementProducts();

}
