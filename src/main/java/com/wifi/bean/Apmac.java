package com.wifi.bean;

public class Apmac {
    private Integer apId;

    private String apMac;

    private String apAddress;

    private Double apLongitude;

    private Double apLatitude;

    private Boolean apIndoor;

    public Integer getApId() {
        return apId;
    }

    public void setApId(Integer apId) {
        this.apId = apId;
    }

    public String getApMac() {
        return apMac;
    }

    public void setApMac(String apMac) {
        this.apMac = apMac;
    }

    public String getApAddress() {
        return apAddress;
    }

    public void setApAddress(String apAddress) {
        this.apAddress = apAddress;
    }

    public Double getApLongitude() {
        return apLongitude;
    }

    public void setApLongitude(Double apLongitude) {
        this.apLongitude = apLongitude;
    }

    public Double getApLatitude() {
        return apLatitude;
    }

    public void setApLatitude(Double apLatitude) {
        this.apLatitude = apLatitude;
    }

    public Boolean getApIndoor() {
        return apIndoor;
    }

    public void setApIndoor(Boolean apIndoor) {
        this.apIndoor = apIndoor;
    }
}