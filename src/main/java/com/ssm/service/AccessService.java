package com.ssm.service;

import com.ssm.pojo.Access;
import com.ssm.util.Page;
import org.apache.ibatis.annotations.Param;

public interface AccessService {
    public Page<Access> getPage(@Param("hospital_id")int hospital_id,
                                @Param("pageIndex")int pageIndex,
                                @Param("pageSize")int pageSize);
    public int add(Access a);
    public int update(@Param("id")int id);
}
