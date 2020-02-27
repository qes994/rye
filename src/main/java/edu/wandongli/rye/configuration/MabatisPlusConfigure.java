package edu.wandongli.rye.configuration;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;

@EnableTransactionManagement
@Configuration
@MapperScan("edu.wandongli.car.dao.*")
public class MabatisPlusConfigure {

    public PaginationInterceptor getPaginationInterceptor() {
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        return paginationInterceptor;
    }


}
