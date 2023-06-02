package cn.jia.service;

import cn.jia.common.ServerResponse;
import cn.jia.domain.Education;
import cn.jia.dto.EducationDto;

public interface EducationService {
    ServerResponse addOrUpdate(Education education, Integer userId);
    ServerResponse findByUserId(Integer userId);
    EducationDto entityToDto(Education education);
}
