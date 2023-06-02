package cn.jia.dto;

import lombok.Data;

@Data
public class GradeDto {
    private Integer id;

    private Float score;

    private String classify;

    private String origQuest;

    private String scoreDetail;

}
