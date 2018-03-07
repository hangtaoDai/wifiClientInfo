package com.wifi.service;

/**
 * Created by liyuan on 2018/1/29.
 */
public interface OnlineInfoService {

    String getHotAP(String date);

    String getTrackByUName(String date ,String username);

    String getTrackByUMac(String date, String usermac);
}
