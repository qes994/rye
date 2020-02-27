package edu.wandongli.rye.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.wandongli.rye.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UserDao extends BaseMapper<User> {

    //查用户和用户的vip信息
    User findUserByUserId(Long id);

    List<User> findUsersByCreateTime();


}
