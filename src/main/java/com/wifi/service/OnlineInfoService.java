package com.wifi.service;

import com.wifi.bean.VO.Track;

import java.util.ArrayList;

/**
 * Created by liyuan on 2018/1/29.
 */
public interface OnlineInfoService {

    String getHotAP(String date);

    ArrayList<Track> getTrackByUName(String date ,String username);

    ArrayList<Track> getTrackByUMac(String date, String usermac);
}
