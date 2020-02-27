package edu.wandongli.rye.service;


import edu.wandongli.rye.pojo.User;
import edu.wandongli.rye.pojo.UserAuth;

public interface UserAuthService {

    //根据唯一openId查是否已存在
    UserAuth findUserAuthByOpenId(String openId);

    UserAuth findUserAuth(UserAuth userAuth);

    //添加auth表和user表
    int addUserAndUserAuth(User user, String openId);

    //添加一条记录
    int addUserAuth(UserAuth userAuth);


}
