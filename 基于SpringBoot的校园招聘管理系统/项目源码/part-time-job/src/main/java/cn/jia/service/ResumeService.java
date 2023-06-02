package cn.jia.service;

import cn.jia.common.ServerResponse;

public interface ResumeService {
    ServerResponse show(int userId);
    ServerResponse showAll(int pageIndex,int pageSize);
    ServerResponse judge(int userId,String pName);
    ServerResponse query(String positionName,int pageIndex,int pageSize);

    ServerResponse delete(Integer userId);

}
