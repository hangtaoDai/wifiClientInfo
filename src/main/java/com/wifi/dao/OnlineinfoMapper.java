package com.wifi.dao;

import com.wifi.bean.Onlineinfo;

import java.util.HashMap;
import java.util.List;

public interface OnlineinfoMapper {
    int deleteByPrimaryKey(Integer onlineinfoId);

    int insert(Onlineinfo record);

    int insertSelective(Onlineinfo record);

    Onlineinfo selectByPrimaryKey(Integer onlineinfoId);

    int updateByPrimaryKeySelective(Onlineinfo record);

    int updateByPrimaryKey(Onlineinfo record);

    List<HashMap> getHotAPByday(String date);


}