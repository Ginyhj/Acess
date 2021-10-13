package com.ssm.mapper;

import com.ssm.pojo.Buiding;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BuidingMapper {
    public List<Buiding> getAll();



}
