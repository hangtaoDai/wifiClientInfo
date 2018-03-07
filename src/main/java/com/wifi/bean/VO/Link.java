package com.wifi.bean.VO;

/**
 * Created by Daihangtao on 2018/2/28.
 */
public class Link {
    private Integer source;
    private Integer target;
    private Double value;

    public Integer getSource() {
        return source;
    }

    public void setSource(Integer source) {
        this.source = source;
    }

    public Integer getTarget() {
        return target;
    }

    public void setTarget(Integer target) {
        this.target = target;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "{" +
                "source=" + source +
                ", target=" + target +
                ", value=" + value +
                '}';
    }
}
