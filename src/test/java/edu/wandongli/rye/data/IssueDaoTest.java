package edu.wandongli.rye.data;


import edu.wandongli.rye.RyeApplicationTests;
import edu.wandongli.rye.dao.UserDao;
import edu.wandongli.rye.pojo.User;
import edu.wandongli.rye.util.EncryptUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class IssueDaoTest extends RyeApplicationTests {

    private UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Test
    public void createtime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Date date = new Date();
        String format = sdf.format(date);
        System.out.println("当前年份:" + format);
        List<User> list = userDao.findUsersByCreateTime();
        System.out.println("数据:" + list);
    }
}
