package com.wifi.dao;

import com.wifi.bean.Usermac;
import org.springframework.stereotype.Component;

import java.util.List;
public interface UsermacMapper {
    int deleteByPrimaryKey(Integer usermacId);

    int insert(Usermac record);

    int insertSelective(Usermac record);

    Usermac selectByPrimaryKey(Integer usermacId);

    int updateByPrimaryKeySelective(Usermac record);

    int updateByPrimaryKey(Usermac record);

    List<Usermac> selectByuserId(Integer user_id);
}