package com.wifi.dao;

import com.wifi.bean.Apmac;

public interface ApmacMapper {
    int deleteByPrimaryKey(Integer apId);

    int insert(Apmac record);

    int insertSelective(Apmac record);

    Apmac selectByPrimaryKey(Integer apId);

    int updateByPrimaryKeySelective(Apmac record);

    int updateByPrimaryKey(Apmac record);


}