package edu.wandongli.rye.pojo;

import edu.wandongli.rye.enums.ModeEnum;
import lombok.Data;

import java.util.Date;

@Data
public class UserVip {

    private Long id;
    private Long userId;
    private Long vipId;
    private ModeEnum mode;
    private String type;//会员类型
    private Double price;
    private Date openningTime;//开通时间
    private Double openningAmount;//开通金额
    private Date endTime;//到期时间
    private String head;

}
