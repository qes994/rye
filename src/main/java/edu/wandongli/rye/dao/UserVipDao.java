package edu.wandongli.rye.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserVipDao {

    //根据用户id查询该账户是否购买会员
    List<UserVipDao> findUserVipByUserId(Integer userId);


}
