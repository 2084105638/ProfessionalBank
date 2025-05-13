package com.tyt.bankmanagersystem.utils;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author Sylphy
 * @Description
 * @create 2025/4/9
 * */
@Component
public class JwtUtil {
    private final String SECRET_KET = "aP8zB9qLrD1fX6yJmT0kW2uHvNcRgShV ";
    private final long EXPIRATION_TIME = 1000*60*60;


    //生成Token
    public String generateToken(String phone){

        return Jwts.builder()
                .setSubject(phone)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(Keys.hmacShaKeyFor(SECRET_KET.getBytes()), SignatureAlgorithm.HS256)
                .compact();
    }

    //解析Token获得用户名
    public String extractUsername(String token){
        return Jwts.parserBuilder()
                .setSigningKey(SECRET_KET.getBytes())
                .build()
                .parseClaimsJws(token)
                .getBody()
                .getSubject();
    }

    //验证Token(正常解析，超时)
    public String isTokenValid(String token){
        try {

            return extractUsername(token);
        }catch (Exception e){
            return null;
        }
    }
}
