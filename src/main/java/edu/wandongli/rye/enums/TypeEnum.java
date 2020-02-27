package edu.wandongli.rye.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum TypeEnum {
    WIT(1, "健谈智慧"), FAMILY(2, "家庭教育"), TAOKE(3, "麦田淘课");
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

    TypeEnum(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public static TypeEnum getTypeEnum(Integer id) {
        for (TypeEnum typeEnum : TypeEnum.values()) {
            if (typeEnum.getId().equals(id)) {
                return typeEnum;
            }
        }
        return null;
    }
}
