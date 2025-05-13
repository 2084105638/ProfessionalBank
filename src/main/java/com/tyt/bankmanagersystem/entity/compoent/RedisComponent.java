package com.tyt.bankmanagersystem.entity.compoent;

import com.tyt.bankmanagersystem.config.ThreadLocalHolder;
import com.tyt.bankmanagersystem.entity.constant.Constants;
import com.tyt.bankmanagersystem.utils.RedisUtil;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.UUID;

/**
 * @author Sylphy
 * @Description
 * @create 2025/4/23
 * */
@Component
public class RedisComponent {

    @Resource
    RedisUtil redisUtil;
    @Resource
    ThreadLocalHolder threadLocalHolder;

    public String saveCheckCode(String code){
        String key = UUID.randomUUID().toString();
        redisUtil.setex(Constants.CHECK_CODE_AHEAD+key,code,Constants.CHECK_CODE_EXTINCT_ONE_MIN* 5L);
        return key;
    }

    public String getCheckCodeByKey(String key){
        return (String) redisUtil.get(Constants.CHECK_CODE_AHEAD+key);
    }

    public void cleanCheckCodeByKey( String checkCodeKey) {
        redisUtil.delete(Constants.CHECK_CODE_AHEAD+checkCodeKey);
    }


//    public void saveUserInfoByToken(TokenUserInfoDto tokenUserInfoDto) {
//        String token = UUID.randomUUID().toString();
//        tokenUserInfoDto.setExpireAt(System.currentTimeMillis()+Constants.TOKEN_CODE_EXTINCT_ONE_DAY* 7L);
//        tokenUserInfoDto.setToken(token);
//        boolean setex = redisUtil.setex(Constants.TOKEN_CODE_AHEAD + token ,tokenUserInfoDto, Constants.CHECK_CODE_EXTINCT_ONE_DAY * 7L);
//
//    }

//    public TokenUserInfoDto getUserInfoByToken() {
//        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
//        String token = request.getHeader("token");
//
//
//        TokenUserInfoDto o = (TokenUserInfoDto) redisUtil.get(Constants.TOKEN_CODE_AHEAD + token);
//        if(o == null){
//            return null;
//        }
//        //重置时间
//        boolean setex = redisUtil.setex(Constants.TOKEN_CODE_AHEAD + token ,o, Constants.CHECK_CODE_EXTINCT_ONE_DAY * 7L);
//        return o;
//    }

    public void cleanUserInfoByToken() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String token = request.getHeader("token");

        redisUtil.delete(Constants.TOKEN_CODE_AHEAD + token);
    }

    public boolean addLogoutJwtToken() {
        return redisUtil.setex(Constants.BLACKLIST_HEAD + threadLocalHolder.get("jwtToken"),"" , 1000 * 60 * 60);

    }

    public boolean isLogoutToken(String jwtToken) {
        return redisUtil.keyExists(Constants.BLACKLIST_HEAD + jwtToken);
    }
}
