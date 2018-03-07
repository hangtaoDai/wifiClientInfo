package com.wifi.bean.VO;

/**
 * Created by Daihangtao on 2018/2/28.
 */
public class UserMacWithName {

    private Integer id;

    private Integer usermacId;

    private Integer userId;

    private String userMac;

    private String macType;

    private String username;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "{" +
                "id=" + id +
                ", usermacId=" + usermacId +
                ", userId=" + userId +
                ", userMac='" + userMac + '\'' +
                ", macType='" + macType + '\'' +
                ", username='" + username + '\'' +
                '}';
    }
}
