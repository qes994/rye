package edu.wandongli.rye.pojo;

import edu.wandongli.rye.enums.TypeEnum;
import lombok.Data;

import java.util.Date;

@Data
public class Section {

    private Long id;
    private String name;
    private int priority;
    private TypeEnum type;
    private Date createTime;
    private Date updateTime;


}
