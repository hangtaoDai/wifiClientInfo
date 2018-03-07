package com.wifi.bean;

public class Usermac {
    private Integer usermacId;

    private Integer userId;

    private String userMac;

    private String macType;

    public Integer getUsermacId() {
        return usermacId;
    }

    public void setUsermacId(Integer usermacId) {
        this.usermacId = usermacId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "{" +
                "usermacId=" + usermacId +
                ", userId=" + userId +
                ", userMac='" + userMac + '\'' +
                ", macType='" + macType + '\'' +
                '}';
    }

    public String getUserMac() {
        return userMac;
    }

    public void setUserMac(String userMac) {
        this.userMac = userMac;
    }

    public String getMacType() {
        return macType;
    }

    public void setMacType(String macType) {
        this.macType = macType;
    }
}