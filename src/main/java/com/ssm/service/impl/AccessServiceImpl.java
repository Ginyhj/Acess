package com.ssm.service.impl;

import com.ssm.mapper.AccessMapper;
import com.ssm.pojo.Access;
import com.ssm.service.AccessService;
import com.ssm.util.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AccessServiceImpl implements AccessService {
    @Resource
    AccessMapper mapper;

    @Override
    public Page<Access> getPage(int hospital_id, int pageIndex, int pageSize) {
        Page<Access> page=new Page<Access>();
        page.setPageSize(pageSize);
        page.setPageIndex(pageIndex);
        page.setTotalCount(mapper.getCount(hospital_id));
        page.setList(mapper.getPage(hospital_id,(pageIndex-1)*pageSize,pageSize));
        return page;
    }

    @Override
    public int add(Access a) {
        return mapper.add(a);
    }

    @Override
    public int update(int id) {
        return mapper.update(id);
    }
}
