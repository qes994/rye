package edu.wandongli.rye.configuration;

import edu.wandongli.rye.interceptor.AdminInterceptor;
import edu.wandongli.rye.interceptor.HomeInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebInterceptors implements WebMvcConfigurer {

    private HomeInterceptor homeInterceptor;

    @Autowired
    public void setHomeInterceptor(HomeInterceptor homeInterceptor) {
        this.homeInterceptor = homeInterceptor;
    }

    private AdminInterceptor adminInterceptor;

    @Autowired
    public void setAdminInterceptor(AdminInterceptor adminInterceptor) {
        this.adminInterceptor = adminInterceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(homeInterceptor)
                .excludePathPatterns("/home/user/login")
                .excludePathPatterns("/home/user/code")
                .excludePathPatterns("/home/user/register")
                //.excludePathPatterns("/oauth/gitHub")
                .excludePathPatterns("/home/user/find")
                .addPathPatterns("/home/user/**", "/");//,"/oauth/**"
        registry.addInterceptor(adminInterceptor)
                .excludePathPatterns("/admin/admin/login")
                .addPathPatterns("/admin/admin/**")
                .addPathPatterns("/admin/user/**")
                .addPathPatterns("/admin/issue/**");
    }
}
