package edu.wandongli.rye.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import edu.wandongli.rye.dao.CourseCatalogDao;
import edu.wandongli.rye.dao.CourseDao;
import edu.wandongli.rye.dao.CourseImageDao;
import edu.wandongli.rye.dao.CourseIntroDao;
import edu.wandongli.rye.exception.ServiceException;
import edu.wandongli.rye.pojo.Course;
import edu.wandongli.rye.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    CourseDao courseDao;
    @Autowired
    CourseIntroDao courseIntroDao;
    @Autowired
    CourseCatalogDao courseCatalogDao;
    @Autowired
    CourseImageDao courseImageDao;

    @Override
    public int add(Course course) {
        int result = courseDao.insert(course);
        if (result == 0) {
            throw new ServiceException("发布失败");
        }
        return result;
    }

    @Override
    public IPage<Course> info(Integer page, Integer limit, String title, Integer sectionId) {
        IPage iPage = new Page(page, limit);
        IPage<Course> courseIPage = courseDao.getList(iPage, title, sectionId);
        return courseIPage;
    }

    @Override
    public int updatePriority(Course course) {
        int result = courseDao.updateById(course);
        if (result == 0) {
            throw new ServiceException("修改失败");
        }
        return result;
    }
}
