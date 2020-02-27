package edu.wandongli.rye.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import edu.wandongli.rye.dao.AdminDao;
import edu.wandongli.rye.exception.ServiceException;
import edu.wandongli.rye.pojo.Admin;
import edu.wandongli.rye.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    private AdminDao adminDao;

    @Autowired
    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    @Override
    public Admin login(String phone, String password) {
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Admin::getPassword, password).
                eq(Admin::getPhone, phone);
        Admin admin = adminDao.selectOne(queryWrapper);

        return admin;
    }

    @Override
    public Admin findAdmin(Admin admin) {
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Admin::getId, admin.getId());
        Admin admin1 = adminDao.selectOne(queryWrapper);
        return admin1;
    }

    @Override
    public int add(Admin admin) {
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(Admin::getPhone, admin.getPhone());
        Admin admin1 = adminDao.selectOne(queryWrapper);
        if (admin1 != null) {
            throw new ServiceException("该手机号已经注册");
        }
        int insert = adminDao.insert(admin);
        if (insert == 0) {
            throw new ServiceException("添加失败");
        }
        return insert;
    }
}
