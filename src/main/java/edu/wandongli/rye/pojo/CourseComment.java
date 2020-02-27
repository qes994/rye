package edu.wandongli.rye.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class CourseComment {

    private Long id;
    private Long userId;
    private Long courseId;
    private String content;
    private Date createTime;


}
