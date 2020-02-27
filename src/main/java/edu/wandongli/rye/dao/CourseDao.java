package edu.wandongli.rye.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import edu.wandongli.rye.pojo.Course;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 发布
 */
@Repository
public interface CourseDao extends BaseMapper<Course> {

    //查看所有,根据标题
    IPage<Course> getList(@Param("ipage") IPage<Course> iPage, @Param("title") String title, @Param("sectionId") Integer sectionId);

    //根据主键id查看该课程的所有目录
    IPage<Course> getListById(@Param("ipage") IPage<Course> iPage, Long id);


}
