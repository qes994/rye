package edu.wandongli.rye.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum StatusEnum {
    NORMAL(1, "正常"), FROST(2, "冻结");
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

    StatusEnum(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public static StatusEnum getStatusEnum(Integer id) {
        for (StatusEnum statusEnum : StatusEnum.values()) {
            if (statusEnum.id.equals(id)) {
                return statusEnum;
            }
        }
        return null;
    }
}
