package edu.wandongli.rye.controller.admin;

import com.baomidou.mybatisplus.core.metadata.IPage;
import edu.wandongli.rye.pojo.Admin;
import edu.wandongli.rye.pojo.User;
import edu.wandongli.rye.service.AdminService;
import edu.wandongli.rye.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/admin/user")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    AdminService adminServic;

    //展示所有列表
    @GetMapping("/index")
    public ModelAndView index(@SessionAttribute("adminId") Long id) {
        ModelAndView modelAndView = new ModelAndView();
        /*Admin admin = new Admin();
        admin.setId(id);
        Admin admin1 = adminServic.findAdmin(admin);

        modelAndView.addObject("admin",admin1);*/
        modelAndView.setViewName("/admin/user/index");
        return modelAndView;
    }

    @PostMapping("/index")
    public ModelMap index(@RequestParam(defaultValue = "1") Integer page, Integer limit
            , @RequestParam(value = "name", required = false) String name
            , HttpSession session) {
        ModelMap map = new ModelMap();
        IPage<User> info = userService.getList(page, limit, name);
        System.out.println("info" + info.getRecords());
        List<User> list = info.getRecords();
        long total = info.getTotal();
        if (list == null) {
            map.put("code", 1);
            map.put("msg", "没数据");
        }
        map.put("code", 0);
        map.put("msg", "有数据");
        map.put("count", total);
        map.put("data", list);


        return map;
    }


}
