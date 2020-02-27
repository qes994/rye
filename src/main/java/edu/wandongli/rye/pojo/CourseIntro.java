package edu.wandongli.rye.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class CourseIntro {

    private Long id;
    private Long catalogId;
    private String intro;
    private String cover;
    private Date createTime;
    private Date updateTime;


}
