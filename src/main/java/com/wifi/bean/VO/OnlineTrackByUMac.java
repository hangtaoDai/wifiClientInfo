package com.wifi.bean.VO;

import com.wifi.bean.Onlineinfo;

/**
 * Created by Daihangtao on 2018/2/26.
 */
public class OnlineTrackByUMac {

    private Onlineinfo onlineInfo;
    private String user_mac;
    private String mac_type;
    private String ap_mac;
    private String ap_address;
    private Double ap_longitude;
    private Double ap_latitude;
    private boolean ap_indoor;

    public Onlineinfo getOnlineInfo() {
        return onlineInfo;
    }

    public void setOnlineInfo(Onlineinfo onlineInfo) {
        this.onlineInfo = onlineInfo;
    }

    public String getUser_mac() {
        return user_mac;
    }

    public void setUser_mac(String user_mac) {
        this.user_mac = user_mac;
    }

    public String getMac_type() {
        return mac_type;
    }

    public void setMac_type(String mac_type) {
        this.mac_type = mac_type;
    }

    public String getAp_mac() {
        return ap_mac;
    }

    public void setAp_mac(String ap_mac) {
        this.ap_mac = ap_mac;
    }

    public String getAp_address() {
        return ap_address;
    }

    public void setAp_address(String ap_address) {
        this.ap_address = ap_address;
    }

    public Double getAp_longitude() {
        return ap_longitude;
    }

    public void setAp_longitude(Double ap_longitude) {
        this.ap_longitude = ap_longitude;
    }

    public Double getAp_latitude() {
        return ap_latitude;
    }

    public void setAp_latitude(Double ap_latitude) {
        this.ap_latitude = ap_latitude;
    }

    public boolean isAp_indoor() {
        return ap_indoor;
    }

    public void setAp_indoor(boolean ap_indoor) {
        this.ap_indoor = ap_indoor;
    }

    @Override
    public String toString() {
        return "OnlineTrackByUMac{" +
                "onlineInfo=" + onlineInfo +
                ", user_mac='" + user_mac + '\'' +
                ", mac_type='" + mac_type + '\'' +
                ", ap_mac='" + ap_mac + '\'' +
                ", ap_address='" + ap_address + '\'' +
                ", ap_longitude=" + ap_longitude +
                ", ap_latitude=" + ap_latitude +
                ", ap_indoor=" + ap_indoor +
                '}';
    }
}
