package com.ssm.mapper;

import com.ssm.pojo.Access;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AccessMapper {
    public List getPage(@Param("hospital_id")int hospital_id,
                        @Param("pageIndex")int pageIndex,
                        @Param("pageSize")int pageSize);

    public int getCount(@Param("hospital_id")int hospital_id);
    public int add(Access a);
    public int update(@Param("id")int id);
}
