package com.wifi.dao;

import com.wifi.bean.Weight;

public interface WeightMapper {
    int deleteByPrimaryKey(Integer weightId);

    int insert(Weight record);

    int insertSelective(Weight record);

    Weight selectByPrimaryKey(Integer weightId);

    int updateByPrimaryKeySelective(Weight record);

    int updateByPrimaryKey(Weight record);
}