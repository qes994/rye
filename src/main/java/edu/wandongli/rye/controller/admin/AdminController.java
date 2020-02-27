package edu.wandongli.rye.controller.admin;

import edu.wandongli.rye.enums.StatusEnum;
import edu.wandongli.rye.pojo.Admin;
import edu.wandongli.rye.pojo.User;
import edu.wandongli.rye.service.AdminService;
import edu.wandongli.rye.service.UserService;
import edu.wandongli.rye.util.ResultObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Validated
@RestController
@RequestMapping("/admin/admin")
public class AdminController {
    @Autowired
    AdminService adminService;
    @Autowired
    UserService userService;

    //登录
    @GetMapping("/login")
    public ModelAndView login(ModelAndView modelAndView) {
        modelAndView.setViewName("/admin/login");
        return modelAndView;
    }

    //登录
    @PostMapping("/login")
    public ResultObject login(@RequestParam("phone") @NotBlank(message = "手机号不能为空") @NotNull(message = "请输入手机号") String phone,
                              @RequestParam("password") @NotBlank(message = "密码不能为空") @NotNull(message = "请输入密码") String password,
                              @RequestParam("code") @NotNull(message = "请输入验证码") @NotBlank(message = "验证码为空") String code,
                              HttpSession session) {
        String code1 = (String) session.getAttribute("code");
        if (!StringUtils.equals(code1, code)) {
            return new ResultObject(0, "验证码错误");
        }
        Admin login = adminService.login(phone, password);
        if (login == null) {
            return new ResultObject(0, "账户,密码错误");
        }
        StatusEnum status = login.getStatus();
        if (status == StatusEnum.FROST) {
            return new ResultObject(0, "该账户已被冻结");
        }
        session.setAttribute("adminId", login.getId());
        return new ResultObject(1, "登录成功", "admin");
    }

    @GetMapping("/index")
    public ModelAndView index(ModelAndView modelAndView) {
        modelAndView.setViewName("/admin/index");
        return modelAndView;
    }

    //图表
    @PostMapping("/chart")
    public ResultObject chart() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Date date = new Date();
        String format = sdf.format(date);
        System.out.println("当前年份:" + format);
        List<User> list = userService.findUsersByCreateTime();
        return new ResultObject(1, "2020年各月份注册用户量", list);
    }

    //退出登录
    @GetMapping("/quit")
    public ModelAndView quit(HttpSession session) {
        session.removeAttribute("userId");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/login");
        return modelAndView;
    }

    //添加管理员
    @GetMapping("/add")
    public ModelAndView add(ModelAndView modelAndView) {
        modelAndView.setViewName("/admin/admin/add");
        return modelAndView;
    }

    //添加管理员
    @PostMapping("/add")
    public ResultObject add(@RequestBody @Validated Admin admin) {
        int result = adminService.add(admin);
        if (result == 0) {
            return new ResultObject(0, "添加失败");
        }
        return new ResultObject(1, "添加成功");
    }


}
