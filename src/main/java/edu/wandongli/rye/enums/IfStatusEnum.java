package edu.wandongli.rye.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum IfStatusEnum {
    GRATIS(1, "免费"), WIT(2, "智慧vip"), FAMILY(3, "家庭vip");
    private Integer id;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    IfStatusEnum(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public static IfStatusEnum getIfStatusEnum(Integer id) {
        for (IfStatusEnum ifStatusEnum : IfStatusEnum.values()) {
            if (ifStatusEnum.getId().equals(id)) {
                return ifStatusEnum;
            }
        }
        return null;
    }
}
