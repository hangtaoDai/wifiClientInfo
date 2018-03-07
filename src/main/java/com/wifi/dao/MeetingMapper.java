package com.wifi.dao;

import com.wifi.bean.Meeting;

import java.util.HashMap;
import java.util.List;

public interface MeetingMapper {
    int deleteByPrimaryKey(Integer meetingId);

    int insert(Meeting record);

    int insertSelective(Meeting record);

    Meeting selectByPrimaryKey(Integer meetingId);

    int updateByPrimaryKeySelective(Meeting record);

    int updateByPrimaryKey(Meeting record);

    //new add
    List<HashMap> selectByUName(String date,String username);
}