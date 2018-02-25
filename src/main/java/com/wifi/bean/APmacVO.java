package com.wifi.bean;

/**
 * Created by Daihangtao on 2018/2/21.
 */
public class APmacVO {

    private Apmac apmac;
    private Long times;

    public Apmac getApmac() {
        return apmac;
    }

    public void setApmac(Apmac apmac) {
        this.apmac = apmac;
    }

    public Long getTimes() {
        return times;
    }

    public void setTimes(Long times) {
        this.times = times;
    }

    @Override
    public String toString() {
        return "APmacVO{" +
                "apmac=" + apmac +
                ", times=" + times +
                '}';
    }
}
