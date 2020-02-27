package edu.wandongli.rye.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import edu.wandongli.rye.enums.TypeEnum;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
@JsonIgnoreProperties(value = {"handler"})
public class CourseCatalog {

    private Long id;
    private Long courseId;
    private String catalog;//目录
    private Date createTime;
    private String duration;//时长
    private int statusNum;//学习人数
    private TypeEnum type;
    private String videoUrl;
    @TableField(exist = false)
    private List<CourseImage> images;//多张图文
    @TableField(exist = false)
    private List<CourseIntro> intros;//多个简介


}
