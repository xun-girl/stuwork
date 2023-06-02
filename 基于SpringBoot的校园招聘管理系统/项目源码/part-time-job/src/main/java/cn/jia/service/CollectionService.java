package cn.jia.service;

import cn.jia.common.ServerResponse;

public interface CollectionService {
    ServerResponse show(int userId, int pageIndex, int pageSize);
    ServerResponse cancelCollection(int id);
}
