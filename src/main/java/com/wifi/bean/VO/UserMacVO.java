package com.wifi.bean.VO;

import java.util.List;

/**
 * Created by Daihangtao on 2018/2/27.
 */
public class UserMacVO {
    int code;
    String msg;
    int count;
    List<UserMacWithName> data;

    public List<UserMacWithName> getData() {
        return data;
    }

    public void setData(List<UserMacWithName> data) {
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public UserMacVO() {
        this.code = 0;
        this.msg="";
        this.count=0;
    }

    @Override
    public String toString() {
        return "{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", count=" + count +
                ", data=" + data +
                '}';
    }
}
