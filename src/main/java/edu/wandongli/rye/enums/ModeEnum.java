package edu.wandongli.rye.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ModeEnum {
    ALIPAY(1, "支付宝支付"), WECHAT(2, "微信支付"), VISA(3, "信用卡支付");
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

    ModeEnum(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public static ModeEnum getModeEnum(Integer id) {
        for (ModeEnum modeEnum : ModeEnum.values()) {
            if (modeEnum.getId().equals(id)) {
                return modeEnum;
            }
        }
        return null;
    }
}
