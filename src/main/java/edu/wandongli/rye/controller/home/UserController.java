package edu.wandongli.rye.controller.home;

import com.baomidou.mybatisplus.extension.api.R;
import edu.wandongli.rye.enums.WayEnum;
import edu.wandongli.rye.pojo.User;
import edu.wandongli.rye.pojo.UserAuth;
import edu.wandongli.rye.pojo.UserVip;
import edu.wandongli.rye.service.UserAuthService;
import edu.wandongli.rye.service.UserService;
import edu.wandongli.rye.util.EncryptUtil;
import edu.wandongli.rye.util.Md5;
import edu.wandongli.rye.util.ResultObject;
import edu.wandongli.rye.util.ValidatorUtil;
import edu.wandongli.rye.verify.UserVerify;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import sun.plugin2.os.windows.SECURITY_ATTRIBUTES;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Validated
@RestController("homeUser")
@RequestMapping("/home/user")
@Slf4j
public class UserController {

    @Autowired
    UserService userService;
    private UserAuthService userAuthService;

    @Autowired
    public void setUserAuthService(UserAuthService userAuthService) {
        this.userAuthService = userAuthService;
    }

    //注册
    @GetMapping("/register")
    public ModelAndView register() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/home/login/register");
        return mv;
    }

    @PostMapping("/code")
    public ResultObject code(@RequestParam("phone")
                             @NotBlank(message = "手机号不能为空") @NotNull(message = "请输入手机号")
                             @Pattern(regexp = "^[1][3,4,5,6,7,8,9][0-9]{9}$", message = "手机号格式有误") String phone,
                             HttpSession session) {
        String code = EncryptUtil.randomCode();
        if (code != null) {
            session.setAttribute("code", code);

            return new ResultObject(1, "验证码", code);
        }
        return new ResultObject(0, "手机号有误");
    }

    @PostMapping("/code1")
    public ResultObject code1(@RequestParam("phone")
                              @NotBlank(message = "手机号不能为空") @NotNull(message = "请输入手机号")
                              @Pattern(regexp = "^[1][3,4,5,6,7,8,9][0-9]{9}$", message = "手机号格式有误") String phone,
                              HttpSession session) {
        User user = new User();
        user.setPhone(phone);
        User MysqlUser = userService.findUser(user);
        System.out.println(MysqlUser);
        if (MysqlUser == null) {
            return new ResultObject(0, "该手机号未注册");
        }
        String code = EncryptUtil.randomCode();
        if (code != null) {
            session.setAttribute("code", code);
            return new ResultObject(1, "验证码:" + code, code);
        }
        return new ResultObject(0, "手机号有误");
    }

    @PostMapping("/register")
    public ResultObject register(@RequestBody @Validated UserVerify userVerify, HttpSession session) {
        User user = new User();
        user.setPhone(userVerify.getPhone());

        user.setPassword(Md5.string2MD5(userVerify.getPassword()));
        String code = (String) session.getAttribute("code");
        if (!StringUtils.equals(code, userVerify.getCode())) {
            return new ResultObject(0, "验证码错误");
        }
        user.setInvitationCode(userVerify.getInvitationCode());
        int add = userService.add(user);
        if (add == 0) {
            return new ResultObject(0, "注册失败");
        }
        session.setAttribute("userId", user.getId());
        return new ResultObject(1, "注册成功");
    }

    //登录
    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/home/login/login");
        return modelAndView;
    }

    //忘记密码
    @GetMapping("/find")
    public ModelAndView find(ModelAndView modelAndView) {
        modelAndView.setViewName("/home/login/find_password");
        return modelAndView;
    }

    @PostMapping("/find")
    public ResultObject find(@RequestBody @Validated UserVerify userVerify
            , @SessionAttribute("code") String SessionCode) {
        String password = userVerify.getPassword();
        String password1 = userVerify.getPassword1();
        if (!StringUtils.equals(password1, password)) {
            return new ResultObject(0, "俩次密码不一样");
        }
        String code = userVerify.getCode();
        if (!StringUtils.equals(code, SessionCode)) {
            return new ResultObject(0, "验证码错误");
        }

        User user = new User();
        user.setPhone(userVerify.getPhone());
        user.setPassword(Md5.string2MD5(password));
        int update = userService.update(user);
        if (update == 0) {
            return new ResultObject(0, "修改失败");
        }
        return new ResultObject(1, "修改成功");
    }

    @PostMapping("/login")
    public ResultObject login(@RequestBody UserVerify userVerify, HttpSession session) throws NoSuchAlgorithmException {
        String phone = userVerify.getPhone();
        String code = userVerify.getCode();
        String numeber = userVerify.getNumber();//手机号登录
        String password = userVerify.getPassword();
        System.out.println(phone + "验证码=" + code + "手机号=" + numeber + "密码=" + password);
        User user = new User();
        if (StringUtils.isBlank(code)) {//手机号密码登录
            if (!ValidatorUtil.checkPhone(phone)) {
                return new ResultObject(0, "手机号不符合规则");
            }
            user.setPassword(Md5.string2MD5(password));
            user.setPhone(phone);
            User user1 = userService.findUser(user);
            if (user1 == null) {
                return new ResultObject(1, "账户或密码错误");
            }
            session.setAttribute("userId", user1.getId());
            System.out.println(user1.getId());
            return new ResultObject(1, "登录成功");
        }
        if (StringUtils.isBlank(password)) {
            String code1 = (String) session.getAttribute("code");
            if (!ValidatorUtil.checkNumber(numeber)) {
                return new ResultObject(0, "手机号不符合规则");
            }
            if (StringUtils.isBlank(code)) {
                return new ResultObject(0, "验证码不能为空");
            }
            if (StringUtils.equals(code, code1)) {
                user.setPhone(numeber);
                User user1 = userService.findUser(user);
                session.setAttribute("userId", user1.getId());
                return new ResultObject(1, "登录成功");
            }
        }
        return new ResultObject(0, "登录失败");
    }

    //我的
    @GetMapping("/home")
    public ModelAndView home(@SessionAttribute(value = "userId") Long userId) {
        User user = userService.findUserByUserId(userId);
        ModelAndView modelAndView = new ModelAndView();
        List<UserVip> userVip = user.getUserVip();
        modelAndView.addObject("userVip", userVip);
        modelAndView.addObject("user", user);
        modelAndView.setViewName("/home/page/home");
        return modelAndView;
    }

    //跳到个人中心
    @GetMapping("/personage")
    public ModelAndView personage(ModelAndView modelAndView, @SessionAttribute("userId") Long userId) {
        User user = new User();
        user.setId(userId);
        User user1 = userService.findUser(user);
        modelAndView.addObject("user", user1);
        UserAuth userAuth = new UserAuth();
        modelAndView.setViewName("home/user/personage");
        return modelAndView;
    }

    @PostMapping("/head")
    public ResultObject setHead(@RequestParam("id") Long id,
                                @RequestParam("head") String head) {
        User user = new User();
        user.setId(id);
        user.setHead(head);
        int result = userService.updateById(user);
        if (result == 0) {
            return new ResultObject(0, "修改失败");
        }
        return new ResultObject(1, "修改成功");
    }

    @PostMapping("/userName")
    public ResultObject setUserName(@RequestParam("id") Long id,
                                    @RequestParam("userName") String userName) {
        User user = new User();
        user.setId(id);
        user.setUserName(userName);
        int result = userService.updateById(user);
        if (result == 0) {
            return new ResultObject(0, "修改失败");
        }
        return new ResultObject(1, "修改成功");
    }

    @PostMapping("/sex")
    public ResultObject setSex(@RequestParam("id") Long id,
                               @RequestParam("sex") String sex) {
        User user = new User();
        user.setId(id);
        user.setSex(sex);
        int result = userService.updateById(user);
        if (result == 0) {
            return new ResultObject(0, "修改失败");
        }
        return new ResultObject(1, "修改成功");
    }

    @PostMapping("/birthDay")
    public ResultObject SetbirthDay(@RequestParam("id") Long id,
                                    @RequestParam("birthday") String birthday) throws ParseException {
        System.out.println("生日" + birthday);
        User user = new User();
        user.setId(id);
        user.setBirthday(birthday);
        int result = userService.updateById(user);
        if (result == 0) {
            return new ResultObject(0, "修改失败");
        }
        return new ResultObject(1, "修改成功");
    }

    @PostMapping("/adress")
    public ResultObject SetAdress(@RequestParam("id") Long id,
                                  @RequestParam("address") String address) throws ParseException {
        User user = new User();
        user.setId(id);
        user.setAddress(address);
        int result = userService.updateById(user);
        if (result == 0) {
            return new ResultObject(0, "修改失败");
        }
        return new ResultObject(1, "修改成功");
    }

    //是否认证
    @GetMapping("/auth")
    public ResultObject auth(@SessionAttribute("userId") Long userId) {
        System.out.println("该用户是否存在" + userId);
        UserAuth userAuth = new UserAuth();
        userAuth.setUserId(userId);
        UserAuth mysqlUserAuth = userAuthService.findUserAuth(userAuth);
        if (mysqlUserAuth == null) {
            return new ResultObject(0, "未认证");
        }
        WayEnum way = mysqlUserAuth.getWay();
        Integer id = way.getId();
        if (id == 1) {
            //git认证
            return new ResultObject(1, "已认证");
        }
        if (id == 2) {
            //微信
            return new ResultObject(2, "已认证");
        }
        return new ResultObject();
    }

    //设置
    @GetMapping("/set")
    public ModelAndView set(@SessionAttribute("userId") Long id) {
        ModelAndView modelAndView = new ModelAndView();
        User user = new User();
        user.setId(id);
        User user1 = userService.findUser(user);
        String password = user1.getPassword();
        System.out.println("加密后" + password);
        String s = Md5.convertMD5(password);
        System.out.println("加密的" + s);
        String s1 = Md5.convertMD5(s);
        System.out.println("解密的" + s1);
        modelAndView.addObject("user", user1);
        modelAndView.addObject("password", s1);
        modelAndView.setViewName("/home/user/set");
        return modelAndView;
    }

    //修改手机号
    @GetMapping("/setPhone")
    public ModelAndView setPhone(ModelAndView modelAndView) {
        modelAndView.setViewName("/home/user/set_phone");
        return modelAndView;
    }

    @PostMapping("/setPhone")
    public ResultObject setPhone(@RequestParam("phone") @NotNull(message = "请输入手机号") @NotBlank(message = "手机号不能为空") String phone,
                                 @NotNull(message = "请输入验证码") @NotBlank(message = "验证码不能为空") @RequestParam("code") String code,
                                 @SessionAttribute("code") String sessionCode) {
        User user = new User();
        user.setPhone(phone);
        User user1 = userService.findUser(user);
        if (user1 == null) {
            return new ResultObject(0, "该手机号不存在");
        }
        if (!StringUtils.equals(sessionCode, code)) {
            return new ResultObject(0, "验证码错误");
        }
        return new ResultObject(1, "验证成功");
    }

    //更换手机号
    @GetMapping("/renewalPhone")
    public ModelAndView renewalPhone(ModelAndView modelAndView) {
        modelAndView.setViewName("/home/user/set_phone1");
        return modelAndView;
    }

    @PostMapping("/renewalPhone")
    public ResultObject renewalPhone(@RequestParam("phone") String phone,
                                     @RequestParam("code") String code,
                                     @SessionAttribute("userId") Long userId,
                                     @SessionAttribute("code") String sessionCode) {
        User user = new User();
        user.setPhone(phone);
        User user1 = userService.findUser(user);
        if (user1 != null) {
            return new ResultObject(0, "该手机号已注册");
        }
        if (!StringUtils.equals(sessionCode, code)) {
            return new ResultObject(0, "验证码错误");
        }
        user.setId(userId);
        int result = userService.updateById(user);
        if (result == 0) {
            return new ResultObject(0, "修改失败");
        }
        return new ResultObject(1, "修改成功");
    }

    //修改密码
    @GetMapping("/setPassword")
    public ModelAndView password(ModelAndView modelAndView) {
        modelAndView.setViewName("/home/user/set_password");
        return modelAndView;
    }

    @PostMapping("/setPassword")
    public ResultObject password(@RequestBody @Validated UserVerify userVerify,
                                 @SessionAttribute("code") String sessionCode) {
        String code = userVerify.getCode();
        String phone = userVerify.getPhone();
        String password = userVerify.getPassword();
        String password1 = userVerify.getPassword1();
        if (!StringUtils.equals(password1, password)) {
            return new ResultObject(0, "俩次密码不一致");
        }
        User user = new User();
        user.setPhone(phone);
        user.setPassword(Md5.string2MD5(password));
        int result = userService.update(user);
        if (result == 0) {
            return new ResultObject(0, "修改失败");
        }
        return new ResultObject(1, "修改成功");
    }

    //退出登录
    @GetMapping("/exit")
    public ModelAndView quit(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        session.removeAttribute("userId");
        modelAndView.setViewName("/home/login/login");
        return modelAndView;
    }

    //设置提现密码
    @GetMapping("/withdraw")
    public ModelAndView withdraw() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/home/user/withdraw_password");
        return modelAndView;
    }

    @PostMapping("/withdraw")
    public ResultObject withdraw(@RequestParam("phone") @NotBlank(message = "手机号不能为空") @NotNull(message = "请输入手机号") String phone,
                                 @RequestParam("code") @NotBlank(message = "验证码不能为空") @NotNull(message = "请输入验证码") String code,
                                 @RequestParam("withdrawPassword") @NotNull(message = "请输入提现密码") @Pattern(regexp = "^[0-9]{6}$", message = "请输入六位数字") String withdrawPassword,
                                 @RequestParam("withdrawPassword") @NotNull(message = "请再次输入提现密码") String withdrawPassword1,
                                 @SessionAttribute("code") String sessionCode) {
        if (!StringUtils.equals(sessionCode, code)) {
            return new ResultObject(0, "验证码错误");
        }
        if (!StringUtils.equals(withdrawPassword1, withdrawPassword)) {
            return new ResultObject(0, "俩次密码不一致");
        }
        User user = new User();
        user.setWithdrawPassword(withdrawPassword);
        user.setPhone(phone);
        int result = userService.update(user);
        if (result == 0) {
            return new ResultObject(0, "修改失败");
        }
        return new ResultObject(1, "修改成功");
    }

    //跳到关于我们界面
    @GetMapping("/relation")
    public ModelAndView relation(ModelAndView modelAndView) {
        modelAndView.setViewName("/home/user/aboutus");
        return modelAndView;
    }

    //跳到联系我们界面
    @GetMapping("/contact")
    public ModelAndView contact(ModelAndView modelAndView) {
        modelAndView.setViewName("/home/user/contact");
        return modelAndView;
    }

    //升级vip
    @GetMapping("/pay")
    public ModelAndView pay(@SessionAttribute("userId") Long userId) {
        User user = userService.findUserByUserId(userId);
        List<UserVip> userVip = user.getUserVip();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", user);
        modelAndView.addObject("userVip", userVip);
        modelAndView.setViewName("/home/user/pay_vip");
        return modelAndView;
    }


}
