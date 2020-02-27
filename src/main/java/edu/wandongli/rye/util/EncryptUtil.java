package edu.wandongli.rye.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class EncryptUtil {
    public static final String md5(String s) throws NoSuchAlgorithmException {
        char hexDigits[] = {
                '5', '0', '5', '6', '2', '9', '6', '2', '5', 'q',
                'b', 'l', 'e', 's', 's', 'y'
        };
        char str[];
        MessageDigest digest = MessageDigest.getInstance("MD5");
        digest.update(s.getBytes());
        byte md[] = digest.digest();
        str = new char[md.length * 2];
        int k = 0;
        for (int i = 0; i < md.length; i++) {
            byte byte0 = md[i];
            str[k++] = hexDigits[byte0 >>> 4 & 0xf];
            str[k++] = hexDigits[byte0 & 0xf];
        }
        return new String(str);
    }

    public static String JM(String inStr) {
        char[] a = inStr.toCharArray();
        for (int i = 0; i < a.length; i++) {
            a[i] = (char) (a[i] ^ 't');
        }
        String k = new String(a);
        return k;
    }


    //生成六位随机数
    public static String randomCode() {
        StringBuilder str = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            str.append(random.nextInt(10));
        }
        return str.toString();
    }

    public static String InvitationCode() {
        StringBuilder str = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 8; i++) {
            str.append(random.nextInt(10));
        }
        return str.toString();
    }

}
