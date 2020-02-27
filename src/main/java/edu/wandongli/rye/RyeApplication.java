package edu.wandongli.rye;

import com.sun.org.apache.regexp.internal.RE;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Repository;

@SpringBootApplication
@MapperScan(
        basePackages = {"edu.wandongli.rye.dao"}
        , annotationClass = Repository.class
)
public class RyeApplication {

    public static void main(String[] args) {
        SpringApplication.run(RyeApplication.class, args);
    }

}
