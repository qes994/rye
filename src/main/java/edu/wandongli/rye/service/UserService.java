package edu.wandongli.rye.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import edu.wandongli.rye.pojo.User;

import java.util.Date;
import java.util.List;

public interface UserService {

    //查看该手机号是否已经存在
    User findUser(User user);

    //注册
    int add(User user);

    //根据手机号修改用户信息
    int update(User user);

    //根据主键修改用户信息
    int updateById(User user);

    //查看用户信息并查出用户的会员信息
    User findUserByUserId(Long id);

    //根据月份分组,并查看该月有多少人注册
    List<User> findUsersByCreateTime();

    //查看用户列表根据名称模糊查询
    IPage<User> getList(Integer page, Integer limit, String name);

}
