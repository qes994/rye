package edu.wandongli.rye.pojo;

import edu.wandongli.rye.enums.WayEnum;
import lombok.Data;

@Data
public class UserAuth {
    private Long id;
    private Long userId;
    private WayEnum way;
    private String openId;

}
