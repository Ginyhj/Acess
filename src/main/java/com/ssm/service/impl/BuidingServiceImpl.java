package com.ssm.service.impl;

import com.ssm.mapper.BuidingMapper;
import com.ssm.pojo.Buiding;
import com.ssm.service.BuidingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class BuidingServiceImpl implements BuidingService {
    @Resource
    BuidingMapper mapper;

    @Override
    public List<Buiding> getAll() {
        return mapper.getAll();
    }
}
