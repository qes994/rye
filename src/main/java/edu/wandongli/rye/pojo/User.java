package edu.wandongli.rye.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import edu.wandongli.rye.enums.PinlessEnum;
import edu.wandongli.rye.enums.StatusEnum;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class User {

    private Long id;
    private String address;//住址
    private Long billRecordId;//账单记录
    private String userName;//用户名
    private String password;//密码
    private String invitationCode;//邀请码
    private String phone;
    private String alipayName;//支付宝姓名
    private String alipayAccount;//支付宝账户
    private Float balance;//余额
    private String head;//头像
    private String name;//真实姓名
    private String sex;//性别
    private String birthday;
    private StatusEnum status;
    private PinlessEnum pinless;//是否绑定
    private String withdrawPassword;//提现密码
    private Date createTime;
    @TableField(exist = false)
    private List<UserVip> userVip;


}
