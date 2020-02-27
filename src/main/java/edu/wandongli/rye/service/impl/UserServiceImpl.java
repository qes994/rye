package edu.wandongli.rye.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import edu.wandongli.rye.enums.StatusEnum;
import edu.wandongli.rye.dao.UserDao;
import edu.wandongli.rye.exception.ServiceException;
import edu.wandongli.rye.pojo.User;
import edu.wandongli.rye.service.UserService;
import edu.wandongli.rye.util.EncryptUtil;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public User findUser(User user) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        String phone = user.getPhone();
        Long id = user.getId();
        StatusEnum status = user.getStatus();
        String password = user.getPassword();
        queryWrapper.lambda().eq(phone != null, User::getPhone, phone)
                .eq(id != null, User::getId, id)
                .eq(password != null, User::getPassword, password)
                .eq(status != null, User::getStatus, 1);
        User user1 = userDao.selectOne(queryWrapper);
        return user1;
    }

    @Override
    public int add(User user) {
        String phone = user.getPhone();
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(phone != null, User::getPhone, phone);
        User user1 = userDao.selectOne(queryWrapper);
        if (user1 != null) {
            throw new ServiceException("该手机号已注册");
        }
        user.setInvitationCode(EncryptUtil.InvitationCode());
        int result = userDao.insert(user);
        if (result == 0) {
            throw new ServiceException("注册失败");
        }
        return result;
    }

    @Override
    public int update(User user) {

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(User::getPhone, user.getPhone());
        User user1 = userDao.selectOne(queryWrapper);
        if (user1 == null) {
            throw new ServiceException("该手机号没注册");
        }
        int update = userDao.update(user, queryWrapper);
        if (update == 0) {
            throw new ServiceException("修改失败");
        }
        return update;
    }

    @Override
    public int updateById(User user) {
        /*QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(User::getId,user.getId());*/
        int result = userDao.updateById(user);
        if (result == 0) {
            throw new ServiceException("修改失败");
        }
        return result;
    }

    @Override
    public User findUserByUserId(Long id) {
        User user = userDao.findUserByUserId(id);
        return user;
    }

    @Override
    public List<User> findUsersByCreateTime() {
        List<User> list = userDao.findUsersByCreateTime();
        return list;
    }

    @Override
    public IPage<User> getList(Integer page, Integer limit, String name) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().like(name != null, User::getUserName, name);
        IPage<User> iPage = new Page<>(page, limit);
        IPage<User> list = userDao.selectPage(iPage, queryWrapper);
        return list;
    }
}
