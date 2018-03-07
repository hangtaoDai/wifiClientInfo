package com.wifi.bean.VO;

/**
 * Created by Daihangtao on 2018/2/28.
 */
public class Node {
    private String name;
    private String ap_address;
    private String start_time;
    private String last_time;
    private Integer group;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAp_address() {
        return ap_address;
    }

    public void setAp_address(String ap_address) {
        this.ap_address = ap_address;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getLast_time() {
        return last_time;
    }

    public void setLast_time(String last_time) {
        this.last_time = last_time;
    }

    public Integer getGroup() {
        return group;
    }

    public void setGroup(Integer group) {
        this.group = group;
    }

    @Override
    public String toString() {
        return "{" +
                "name='" + name + '\'' +
                ", ap_address='" + ap_address + '\'' +
                ", start_time='" + start_time + '\'' +
                ", last_time='" + last_time + '\'' +
                ", group=" + group +
                '}';
    }
}
