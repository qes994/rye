package edu.wandongli.rye.interceptor;

import edu.wandongli.rye.pojo.User;
import edu.wandongli.rye.pojo.UserAuth;
import edu.wandongli.rye.service.UserAuthService;
import edu.wandongli.rye.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class HomeInterceptor implements HandlerInterceptor {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    private UserAuthService userAuthService;

    @Autowired
    public void setUserAuthService(UserAuthService userAuthService) {
        this.userAuthService = userAuthService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("进到拦截器");
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");
        if (userId != null) {
            session.setAttribute("userId", userId);
            return true;
        } else {
            response.sendRedirect("/home/user/login");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");
        //System.out.println("获取到的userId"+userId);
        User user = new User();
        user.setId(userId);
        //User mysqlUser = userService.findUser(user);
        //System.out.println("拦截到的user"+mysqlUser);
        // session.setAttribute("user",mysqlUser);
        if (modelAndView != null) {
            // modelAndView.addObject("user",mysqlUser);
            String controller = ((HandlerMethod) handler).getBeanType().getSimpleName();
            String method = ((HandlerMethod) handler).getMethod().getName();
            modelAndView.addObject("controller", controller);
            modelAndView.addObject("method", method);
        }

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
