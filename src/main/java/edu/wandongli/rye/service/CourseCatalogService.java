package edu.wandongli.rye.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import edu.wandongli.rye.pojo.CourseCatalog;
import edu.wandongli.rye.pojo.CourseImage;
import edu.wandongli.rye.pojo.CourseIntro;

import java.util.List;

public interface CourseCatalogService {

    //根据课程id查看所有目录
    IPage<CourseCatalog> sectionList(Integer page, Integer limit, Long courseId);

    //添加该目录
    int addChapter(CourseCatalog courseCatalog, CourseIntro courseIntro
            , CourseImage courseImage, List<String> images);


}
