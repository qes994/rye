package edu.wandongli.rye.pojo;

import lombok.Data;

@Data
public class CourseLike {

    private Long id;
    private Long userId;
    private Long courseId;
    private Long createTime;


}
