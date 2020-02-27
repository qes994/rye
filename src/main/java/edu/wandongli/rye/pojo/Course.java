package edu.wandongli.rye.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import edu.wandongli.rye.enums.IfStatusEnum;
import edu.wandongli.rye.enums.TypeEnum;
import lombok.Data;

import java.util.Date;
import java.util.List;

//发布
@JsonIgnoreProperties(value = {"handler"})
@Data
public class Course {

    private Long id;
    private Long adminId;
    private Long sectionId;
    private String title;
    private int priority;
    private TypeEnum type;
    private IfStatusEnum ifStatus;//1免费 2健谈会员 3家庭会员
    private String digest;
    private Date createTime;
    private Date updateTime;
    private String cover;//封面图片
    @TableField(exist = false)
    private Admin admin;
    @TableField(exist = false)
    private Section section;
    @TableField(exist = false)
    private List<CourseCatalog> courseCatalogs;//章节


}
