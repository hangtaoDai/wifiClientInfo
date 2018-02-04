package com.wifi.service;

import com.wifi.bean.Usermac;

import java.util.List;

/**
 * Created by liyuan on 2018/1/29.
 */
public interface UsermacService {

    List<Usermac> selectUsermacByUsername(String username);
}
