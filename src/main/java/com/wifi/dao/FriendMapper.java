package com.wifi.dao;

import com.wifi.bean.Friend;

public interface FriendMapper {
    int deleteByPrimaryKey(Integer friendId);

    int insert(Friend record);

    int insertSelective(Friend record);

    Friend selectByPrimaryKey(Integer friendId);

    int updateByPrimaryKeySelective(Friend record);

    int updateByPrimaryKeyWithBLOBs(Friend record);

    int updateByPrimaryKey(Friend record);
}