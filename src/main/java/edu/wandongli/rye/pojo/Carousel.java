package edu.wandongli.rye.pojo;

import edu.wandongli.rye.enums.TypeEnum;
import lombok.Data;

import java.util.Date;

//轮播广告
@Data
public class Carousel {

    private Long id;
    private String head;
    private TypeEnum type;//1.健谈智慧轮播广告 2.家庭教育 3淘课
    private Date createTime;
    private Date updateTime;

}
