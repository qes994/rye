package edu.wandongli.rye.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import edu.wandongli.rye.pojo.Course;

public interface CourseService {

    //添加课程
    int add(Course course);

    //查看所有健谈智慧
    IPage<Course> info(Integer page, Integer limit, String title, Integer sectionId);

    //修改优先级
    int updatePriority(Course course);

}
