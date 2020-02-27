package edu.wandongli.rye.enums;

import com.fasterxml.jackson.annotation.JsonFormat;


@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum PinlessEnum {
    WECHAT(1, "微信"), PENGUIN(2, "企鹅");

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

    PinlessEnum(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public static PinlessEnum getPinlessEnum(Integer id) {
        for (PinlessEnum pinlessEnum : PinlessEnum.values()) {
            if (pinlessEnum.getId().equals(id)) {
                return pinlessEnum;
            }
        }
        return null;
    }

}
