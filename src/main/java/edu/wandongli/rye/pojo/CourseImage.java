package edu.wandongli.rye.pojo;

import lombok.Data;

import java.util.Date;

@Data

public class CourseImage {

    private Long id;
    private Long catalogId;
    private String image;
    private int priority;
    private Date createTime;
    private Date updateTime;


}
