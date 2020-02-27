package edu.wandongli.rye.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.wandongli.rye.pojo.CourseIntro;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 简介
 */
@Repository
public interface CourseIntroDao extends BaseMapper<CourseIntro> {

    //根据目录id查看该目录的简介
    List<CourseIntro> getListById(Long catalogId);

}
