package edu.wandongli.rye.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidatorUtil {

    /**
     * 校验身份证
     *
     * @param idCard 是否是十八位
     * @return boolean
     */
    public static boolean isIDCard(String idCard) {
        String REGEX_ID_CARD = "(^\\d{18}$)|(^\\d{15}$)";
        Pattern regex = Pattern.compile(REGEX_ID_CARD);
        Matcher matcher = regex.matcher(idCard);
        boolean flag = matcher.matches();
        return flag;
    }

    /**
     * @param email 邮箱
     * @return boolean
     */
    public static boolean checkEmail(String email) {
        String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern regex = Pattern.compile(check);
        Matcher matcher = regex.matcher(email);
        boolean flag = matcher.matches();
        return flag;
    }

    public static boolean checkPhone(String phone) {
        String check = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
        Pattern regex = Pattern.compile(check);
        Matcher matcher = regex.matcher(phone);
        boolean flag = matcher.matches();
        return flag;
    }

    public static boolean checkNumber(String number) {
        String check = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
        Pattern regex = Pattern.compile(check);
        Matcher matcher = regex.matcher(number);
        boolean flag = matcher.matches();
        return flag;
    }

    /**
     * @param password       输入密码
     * @param passwordRepeat 确认密码
     * @return boolean
     */
    public static boolean checkPassword(String password, String passwordRepeat) {
        if (!(password != null && passwordRepeat != null)) {
            return false;
        }
        if (!passwordRepeat.equals(password)) {
            return false;
        }
        return true;
    }


    /**
     * @param mobile 手机号
     * @return boolean
     */
    public static boolean checkMobile(String mobile) {
        //String check = "^(13[0-9])$";
        String check = "^((13[0-9])|(14[5,7,9])|(15([0-3]|[5-9]))|(166)|(17[0,1,3,5,6,7,8])|(18[0-9])|(19[8|9]))\\d{8}$";
        Pattern regex = Pattern.compile(check);
        Matcher matcher = regex.matcher(mobile);
        boolean flag = matcher.matches();
        return flag;
    }
}
