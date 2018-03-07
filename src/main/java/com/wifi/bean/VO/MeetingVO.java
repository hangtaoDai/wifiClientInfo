package com.wifi.bean.VO;

import com.wifi.bean.Meeting;

/**
 * Created by Daihangtao on 2018/2/28.
 */
public class MeetingVO {
    // ap.ap_mac,ap.ap_address,ap.ap_longitude,ap.ap_latitude,ap.ap_indoor,m.start_time,m.last_time
    private Meeting meeting;
    private String username;
    private String usermac;
    private String usermac_type;
    private String partnernae;
    private String partnermac;
    private String partnermac_type;
    private String ap_mac;
    private String ap_address;
    private String ap_longitude;
    private String ap_latitude;
    private String ap_indoor;

    public Meeting getMeeting() {
        return meeting;
    }

    public void setMeeting(Meeting meeting) {
        this.meeting = meeting;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsermac() {
        return usermac;
    }

    public void setUsermac(String usermac) {
        this.usermac = usermac;
    }

    public String getUsermac_type() {
        return usermac_type;
    }

    public void setUsermac_type(String usermac_type) {
        this.usermac_type = usermac_type;
    }

    public String getPartnernae() {
        return partnernae;
    }

    public void setPartnernae(String partnernae) {
        this.partnernae = partnernae;
    }

    public String getPartnermac() {
        return partnermac;
    }

    public void setPartnermac(String partnermac) {
        this.partnermac = partnermac;
    }

    public String getPartnermac_type() {
        return partnermac_type;
    }

    public void setPartnermac_type(String partnermac_type) {
        this.partnermac_type = partnermac_type;
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

    public String getAp_longitude() {
        return ap_longitude;
    }

    public void setAp_longitude(String ap_longitude) {
        this.ap_longitude = ap_longitude;
    }

    public String getAp_latitude() {
        return ap_latitude;
    }

    public void setAp_latitude(String ap_latitude) {
        this.ap_latitude = ap_latitude;
    }

    public String getAp_indoor() {
        return ap_indoor;
    }

    public void setAp_indoor(String ap_indoor) {
        this.ap_indoor = ap_indoor;
    }

    @Override
    public String toString() {
        return "{" +
                "meeting=" + meeting +
                ", username='" + username + '\'' +
                ", usermac='" + usermac + '\'' +
                ", usermac_type='" + usermac_type + '\'' +
                ", partnernae='" + partnernae + '\'' +
                ", partnermac='" + partnermac + '\'' +
                ", partnermac_type='" + partnermac_type + '\'' +
                ", ap_mac='" + ap_mac + '\'' +
                ", ap_address='" + ap_address + '\'' +
                ", ap_longitude='" + ap_longitude + '\'' +
                ", ap_latitude='" + ap_latitude + '\'' +
                ", ap_indoor='" + ap_indoor + '\'' +
                '}';
    }
}
