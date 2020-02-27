package edu.wandongli.rye.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class CourseCollect {

    private Long id;
    private Long userId;
    private Long courseId;
    private Date createTime;


}
