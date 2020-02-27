package edu.wandongli.rye.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import edu.wandongli.rye.pojo.CourseCatalog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseCatalogDao extends BaseMapper<CourseCatalog> {

    //根据课程id查看所有目录
    IPage<CourseCatalog> getListById(@Param("ipage") IPage<CourseCatalog> iPage,
                                     @Param("courseId") Long courseId);

}
