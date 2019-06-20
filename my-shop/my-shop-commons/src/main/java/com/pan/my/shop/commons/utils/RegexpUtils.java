package com.pan.my.shop.commons.utils;

/**
 * @author panyexiong
 * @date 2019/6/8 - 17:08
 */
public class RegexpUtils {

    public static final String EMAIL = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";

    public static final String PHONE = "[1][3578]\\\\d{9}";

    public static boolean checkPhone(String phone) {
        return phone.matches(PHONE);
    }
    public static boolean checkEmail(String email) {
        return email.matches(EMAIL);
    }

}
