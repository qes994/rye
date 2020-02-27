package edu.wandongli.rye.controller.admin;

import com.baomidou.mybatisplus.core.metadata.IPage;
import edu.wandongli.rye.enums.IfStatusEnum;
import edu.wandongli.rye.enums.TypeEnum;
import edu.wandongli.rye.pojo.Course;
import edu.wandongli.rye.pojo.CourseCatalog;
import edu.wandongli.rye.pojo.CourseImage;
import edu.wandongli.rye.pojo.CourseIntro;
import edu.wandongli.rye.service.CourseCatalogService;
import edu.wandongli.rye.service.CourseService;
import edu.wandongli.rye.util.ResultObject;
import edu.wandongli.rye.verify.ChapterVerify;
import edu.wandongli.rye.verify.IssueVeirfy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Validated
@RestController("/admin/issue")
@RequestMapping("/admin/issue")
public class IssueController {

    @Autowired
    CourseService courseService;

    private CourseCatalogService courseCatalogService;

    @Autowired
    public void setCourseCatalogService(CourseCatalogService courseCatalogService) {
        this.courseCatalogService = courseCatalogService;
    }

    //展示健谈智慧的所有信息
    @GetMapping("/wit")
    public ModelAndView wit(ModelAndView modelAndView) {
        System.out.println("条件里面");
        modelAndView.setViewName("/admin/issue/witIndex");
        return modelAndView;
    }

    @PostMapping("/wit")
    public ModelMap wit(@RequestParam(defaultValue = "1") Integer page, Integer limit,
                        @RequestParam(value = "title", required = false) String title,
                        @RequestParam(value = "sectionId", required = false) Integer sectionId) {
        ModelMap map = new ModelMap();
        System.out.println("接收到的版块" + sectionId);
        IPage<Course> info = courseService.info(page, limit, title, sectionId);
        List<Course> course = info.getRecords();
        long total = info.getTotal();
        if (info == null) {
            map.put("code", 1);
            map.put("msg", "无数据");
            return map;
        }
        map.put("code", 0);
        map.put("msg", "有数据");
        map.put("count", total);
        map.put("data", course);
        return map;
    }

    //修改优先级
    @PostMapping("/priority")
    public ResultObject priority(@RequestParam("id") Long id, @RequestParam("priority") Integer priority) {
        Course course = new Course();
        course.setId(id);
        course.setPriority(priority);
        int result = courseService.updatePriority(course);
        if (result == 0) {
            return new ResultObject(0, "修改失败");
        }
        return new ResultObject(1, "修改成功");
    }

    //添加大模块
    @GetMapping("/addWit")
    public ModelAndView addWit(ModelAndView modelAndView) {
        modelAndView.setViewName("/admin/issue/add");
        return modelAndView;
    }

    //健谈智慧
    @PostMapping("/addWit")
    public ResultObject issue(@RequestBody @Validated IssueVeirfy issueVeirfy,
                              @SessionAttribute("adminId") Long adminId) {
        System.out.println("获取到信息" + issueVeirfy);
        Course course = new Course();
        course.setAdminId(adminId);
        course.setPriority(1);
        course.setCover(issueVeirfy.getCover());
        course.setCreateTime(new Date());
        course.setDigest(issueVeirfy.getDigest());
        course.setIfStatus(IfStatusEnum.getIfStatusEnum(issueVeirfy.getIfStatus()));
        course.setSectionId(issueVeirfy.getSectionId());
        course.setTitle(issueVeirfy.getTitle());
        course.setType(TypeEnum.WIT);
        int result = courseService.add(course);
        if (result == 0) {
            return new ResultObject(0, "添加失败");
        }
        return new ResultObject(1, "添加成功");
    }

    //跳到章节里面
    @GetMapping("/section")
    public ModelAndView chapter(@RequestParam(value = "id", required = false) Long id, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        if (id != null) {
            session.setAttribute("courseId", id);
        }
        mv.setViewName("/admin/issue/chapterIndex");
        return mv;
    }

    //跳到章节里面,展示一系列章节
    @PostMapping("/section")
    public ModelMap chapter(@RequestParam(defaultValue = "1") Integer page,
                            Integer limit
            , @SessionAttribute("courseId") Long courseId) {
        ModelMap map = new ModelMap();
        System.out.println("我要的id------------------" + courseId);
        IPage<CourseCatalog> info = courseCatalogService.sectionList(page, limit, courseId);
        List<CourseCatalog> catalogs = info.getRecords();
        long total = info.getTotal();
        if (info == null) {
            map.put("code", 1);
            map.put("msg", "无数据");
            return map;
        }
        map.put("code", 0);
        map.put("msg", "有数据");
        map.put("count", total);
        map.put("data", catalogs);
        return map;
    }

    //添加章节课程
    @GetMapping("/addChapter")
    public ModelAndView add(ModelAndView modelAndView) {
        modelAndView.setViewName("/admin/issue/addChapter");
        return modelAndView;
    }

    @PostMapping("/addChapter")
    public ResultObject add(@RequestBody @Validated ChapterVerify chapterVerify) {
        CourseCatalog courseCatalog = new CourseCatalog();
        Date date = new Date();
        courseCatalog.setVideoUrl(chapterVerify.getVideoUrl());
        courseCatalog.setType(TypeEnum.getTypeEnum(chapterVerify.getType()));
        courseCatalog.setCreateTime(date);
        courseCatalog.setCatalog(chapterVerify.getCatalog());
        courseCatalog.setCourseId(chapterVerify.getCourseId());
        courseCatalog.setDuration(chapterVerify.getDuration());
        CourseIntro courseIntro = new CourseIntro();
        courseIntro.setIntro(chapterVerify.getIntro());
        courseIntro.setCover(chapterVerify.getCover());
        courseIntro.setCreateTime(date);
        CourseImage courseImage = new CourseImage();
        courseImage.setCreateTime(date);
        courseImage.setPriority(1);
        //多张图文
        List<String> images = new ArrayList<>();
        if (chapterVerify.getImage() != null) {
            images = Arrays.asList(chapterVerify.getImage().split(","));
        }
        int result = courseCatalogService.addChapter(courseCatalog, courseIntro, courseImage, images);
        if (result == 0) {
            return new ResultObject(0, "添加失败");
        }
        return new ResultObject(1, "添加成功");
    }


}
