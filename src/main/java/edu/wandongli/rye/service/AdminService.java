package edu.wandongli.rye.service;


import edu.wandongli.rye.pojo.Admin;

public interface AdminService {

    //登录
    Admin login(String phone, String password);

    //查看admin
    Admin findAdmin(Admin admin);

    //添加管理员
    int add(Admin admin);
}
