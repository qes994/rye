package edu.wandongli.rye.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.wandongli.rye.pojo.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDao extends BaseMapper<Admin> {

    //根据主键id查看用户信息
    Admin findAdminById(Long id);

}
