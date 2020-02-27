package edu.wandongli.rye.enums;

import com.fasterxml.jackson.annotation.JsonFormat;


@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum WayEnum {
    GITHUB(1, "git"), WINXIN(2, "微信");
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

    WayEnum(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public static WayEnum getWayEnum(Integer id) {
        for (WayEnum wayEnum : WayEnum.values()) {
            if (wayEnum.getId().equals(id)) {
                return wayEnum;
            }

        }
        return null;
    }
}
