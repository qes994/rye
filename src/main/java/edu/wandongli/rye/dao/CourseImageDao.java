package edu.wandongli.rye.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import edu.wandongli.rye.pojo.CourseImage;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 添加图文
 */
@Repository
public interface CourseImageDao extends BaseMapper<CourseImage> {

    //根据目录id查看该目录的图片
    List<CourseImage> getListById(Long catalogId);
}
