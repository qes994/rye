package edu.wandongli.rye.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import edu.wandongli.rye.dao.UserAuthDao;
import edu.wandongli.rye.dao.UserDao;
import edu.wandongli.rye.enums.WayEnum;
import edu.wandongli.rye.exception.ServiceException;
import edu.wandongli.rye.pojo.User;
import edu.wandongli.rye.pojo.UserAuth;
import edu.wandongli.rye.service.UserAuthService;
import edu.wandongli.rye.util.EncryptUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

@Service
@Slf4j
public class UserAuthServiceImpl implements UserAuthService {

    private UserAuthDao userAuthDao;

    @Autowired
    public void setUserAuthDao(UserAuthDao userAuthDao) {
        this.userAuthDao = userAuthDao;
    }

    private UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public UserAuth findUserAuthByOpenId(String openId) {
        QueryWrapper<UserAuth> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(openId != null, UserAuth::getOpenId, openId);
        UserAuth userAuth = userAuthDao.selectOne(queryWrapper);
        return userAuth;
    }

    @Override
    public UserAuth findUserAuth(UserAuth userAuth) {
        Long userId = userAuth.getUserId();
        QueryWrapper<UserAuth> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(userId != null, UserAuth::getUserId, userId);
        UserAuth userAuth1 = userAuthDao.selectOne(queryWrapper);
        return userAuth1;
    }


    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public int addUserAndUserAuth(User user, String openId) {
        //先添加user
        String phone = user.getPhone();
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(User::getPhone, phone);
        User user1 = userDao.selectOne(queryWrapper);
        //查询该手机号是否问空,为空就注册,
        UserAuth userAuth = new UserAuth();
        if (user1 == null) {
            user.setInvitationCode(EncryptUtil.InvitationCode());
            userDao.insert(user);
            Long userId = user.getId();
            System.out.println("是否获取了id" + userId);
            //添加记录
            userAuth.setUserId(userId);
            userAuth.setOpenId(openId);
            userAuth.setWay(WayEnum.GITHUB);
            int result1 = userAuthDao.insert(userAuth);
            if (result1 == 0) {
                throw new ServiceException("系统繁忙");
            }
            return result1;
        }
        //该手机号已注册就只绑定
        userAuth.setUserId(user1.getId());
        userAuth.setOpenId(openId);
        userAuth.setWay(WayEnum.GITHUB);
        int result1 = userAuthDao.insert(userAuth);
        if (result1 == 0) {
            throw new ServiceException("系统繁忙");
        }
        return result1;
    }

    @Override
    public int addUserAuth(UserAuth userAuth) {
        int result = userAuthDao.insert(userAuth);
        if (result == 0) {
            throw new ServiceException("认证失败");
        }
        return result;
    }
}
