package edu.wandongli.rye.verify;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

//发布
@Data
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public class IssueVeirfy {

    @NotBlank(message = "标题不能为空")
    @NotNull(message = "请输入标题")
    private String title;
    @NotNull(message = "请选择类型")
    private Integer ifStatus;
    @NotNull(message = "请选择版块")
    private Long sectionId;
    @NotBlank(message = "摘要不能为空")
    @NotNull(message = "请输入摘要")
    private String digest;
    @NotBlank(message = "封面图片不能为空")
    @NotNull(message = "请上传封面图片")
    private String cover;


}
