package com.wifi.bean;

public class Onlineinfo {
    private Integer onlineinfoId;

    private Integer userId;

    private Integer apId;

    private Integer usermacId;

    private String date;

    private String startTime;

    private String endTime;

    public Integer getOnlineinfoId() {
        return onlineinfoId;
    }

    public void setOnlineinfoId(Integer onlineinfoId) {
        this.onlineinfoId = onlineinfoId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getApId() {
        return apId;
    }

    public void setApId(Integer apId) {
        this.apId = apId;
    }

    public Integer getUsermacId() {
        return usermacId;
    }

    public void setUsermacId(Integer usermacId) {
        this.usermacId = usermacId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}