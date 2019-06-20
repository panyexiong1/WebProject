package com.shu.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author panyexiong
 * @date 2019/4/12 - 10:36
 */
public class MyStringUtils {
    public static String getMD5Value(String value){
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            byte[] md5ValueByteArray = messageDigest.digest(value.getBytes());

            BigInteger bigInteger = new BigInteger(1,md5ValueByteArray);

            return bigInteger.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
