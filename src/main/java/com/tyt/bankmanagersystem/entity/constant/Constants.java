package com.tyt.bankmanagersystem.entity.constant;

/*
 * @author Sylphy
 * @Description
 * @create 2025/4/23
 * */
public class Constants {
    public static final String REGEX_PASSWORD="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{8,}$";

    public static final Integer CHECK_CODE_EXTINCT_ONE_MIN=60000;
    public static final Integer CHECK_CODE_EXTINCT_ONE_DAY=60000*60*24;
    public static final Integer TOKEN_CODE_EXTINCT_ONE_DAY=60000*60*24;
    public static final Integer ZERO = 0;
    public static final Integer ONE = 1;

    public static final String CODE_PREFIX="PROFESSIONALBank:";

    public static final String CHECK_CODE_AHEAD=CODE_PREFIX+"checkcode:";
    public static final String TOKEN_CODE_AHEAD=CODE_PREFIX+"tokencode:";

    public static final int MAX_ID_LENGTH = 10;

    public static final String TOKEN_WEB="token";
    public static final String LOGOUT_JWT_TOKEN = CODE_PREFIX+"logoutjwttoken:";
    public static final String BLACKLIST_HEAD = CODE_PREFIX+"logoutjwttoken:";
}
