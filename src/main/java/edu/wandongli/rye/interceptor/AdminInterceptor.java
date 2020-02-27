package edu.wandongli.rye.interceptor;

import edu.wandongli.rye.pojo.Admin;
import edu.wandongli.rye.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class AdminInterceptor implements HandlerInterceptor {

    private AdminService adminService;

    @Autowired
    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Long adminId = (Long) session.getAttribute("adminId");
        if (adminId != null) {
            session.setAttribute("adminId", adminId);
            return true;
        }
        response.sendRedirect("/admin/admin/login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession();
        Long adminId = (Long) session.getAttribute("adminId");
        Admin admin = new Admin();
        admin.setId(adminId);
        Admin admin1 = adminService.findAdmin(admin);
        if (modelAndView != null) {
            modelAndView.addObject("admin", admin1);
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
