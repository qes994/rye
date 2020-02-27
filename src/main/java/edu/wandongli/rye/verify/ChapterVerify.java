package edu.wandongli.rye.verify;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public class ChapterVerify {

    @NotBlank(message = "目录不能为空")
    @NotNull(message = "请输入目录")
    private String catalog;
    @NotNull(message = "请选择类型")
    private Integer type;
    @NotBlank(message = "视频不能为空")
    @NotNull(message = "请上传视频")
    private String videoUrl;
    @NotBlank(message = "简介不能为空")
    @NotNull(message = "请输入简介")
    private String intro;
    @NotBlank(message = "封面图片不能为空")
    @NotNull(message = "请上传图片")
    private String cover;
    @NotBlank(message = "图文不能为空")
    @NotNull(message = "请上传图问")
    private String image;
    @NotNull(message = "属于哪个课程")
    private Long courseId;
    @NotNull(message = "视频时长不能为空")
    private String duration;


}
