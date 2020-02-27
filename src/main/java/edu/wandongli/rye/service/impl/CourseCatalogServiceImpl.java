package edu.wandongli.rye.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import edu.wandongli.rye.dao.CourseCatalogDao;
import edu.wandongli.rye.dao.CourseImageDao;
import edu.wandongli.rye.dao.CourseIntroDao;
import edu.wandongli.rye.exception.ServiceException;
import edu.wandongli.rye.pojo.CourseCatalog;
import edu.wandongli.rye.pojo.CourseImage;
import edu.wandongli.rye.pojo.CourseIntro;
import edu.wandongli.rye.service.CourseCatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CourseCatalogServiceImpl implements CourseCatalogService {
    @Autowired
    CourseCatalogDao courseCatalogDao;
    @Autowired
    CourseIntroDao courseIntroDao;
    @Autowired
    CourseImageDao courseImageDao;

    @Override
    public IPage<CourseCatalog> sectionList(Integer page, Integer limit, Long courseId) {
        IPage<CourseCatalog> iPage = new Page<>(page, limit);
        IPage<CourseCatalog> chapter = courseCatalogDao.getListById(iPage, courseId);
        return chapter;
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public int addChapter(CourseCatalog courseCatalog, CourseIntro courseIntro, CourseImage courseImage, List<String> images) {
        int result = courseCatalogDao.insert(courseCatalog);
        if (result == 0) {
            throw new ServiceException("添加失败");
        }
        Long courseId = courseCatalog.getCourseId();
        courseIntro.setCatalogId(courseId);
        int result1 = courseIntroDao.insert(courseIntro);
        if (result1 == 0) {
            throw new ServiceException("添加失败");
        }
        courseImage.setCatalogId(courseId);
        for (String image : images) {
            courseImage.setImage(image);
            int result2 = courseImageDao.insert(courseImage);
            if (result2 == 0) {
                throw new ServiceException("添加失败");
            }
        }
        return result;
    }
}
