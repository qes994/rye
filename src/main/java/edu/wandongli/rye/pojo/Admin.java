package edu.wandongli.rye.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import edu.wandongli.rye.enums.StatusEnum;
import lombok.Data;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
@Validated
@JsonIgnoreProperties(value = {"handler"})
public class Admin {

    private Long id;
    @NotNull(message = "请输入用户名")
    @NotBlank(message = "用户名不能为空")
    private String name;
    @NotNull(message = "请输入手机号")
    @NotBlank(message = "手机号不能为空")
    private String phone;
    @NotNull(message = "请输入密码")
    @NotBlank(message = "密码不能为空")
    private String password;
    @NotNull(message = "请上传头像")
    @NotBlank(message = "头像不能为空")
    private String head;
    private Date createTime;
    private StatusEnum status;

}
