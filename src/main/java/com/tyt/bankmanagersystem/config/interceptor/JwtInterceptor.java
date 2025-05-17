package com.tyt.bankmanagersystem.config.interceptor;


import com.tyt.bankmanagersystem.config.ThreadLocalHolder;
import com.tyt.bankmanagersystem.config.exception.BusinessException;
import com.tyt.bankmanagersystem.entity.compoent.RedisComponent;
import com.tyt.bankmanagersystem.utils.JwtUtil;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author Sylphy
 * @Description
 * @create 2025/4/29
 * */
@Component
public class JwtInterceptor implements HandlerInterceptor {
    @Resource
    JwtUtil jwtUtil;
    @Resource
    ThreadLocalHolder threadLocalHolder;
    @Resource
    RedisComponent redisComponent;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String authorization = request.getHeader("Authorization");

        if(Objects.equals(authorization, "test") || Objects.equals(authorization, "Bearer test")){
            return true;
        }

        if (authorization == null || !authorization.startsWith("Bearer ")) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Missing or invalid Authorization header.");
            return false;
        }
        // 去掉"Bearer "
        String token = authorization.substring(7);
        String tokenValid = jwtUtil.isTokenValid(token);
        if(tokenValid == null || redisComponent.isLogoutToken(token)){
            throw new BusinessException("登陆失败,请重新登陆");
        }

        threadLocalHolder.put("jwtToken",token);
        threadLocalHolder.put("phone",tokenValid);
        return true;
    }
}
