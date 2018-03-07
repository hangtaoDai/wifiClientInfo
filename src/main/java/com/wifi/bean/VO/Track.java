package com.wifi.bean.VO;

import java.util.Arrays;

/**
 * Created by Daihangtao on 2018/2/26.
 */
public class Track {
    private String name;
    private Double[][] path;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double[][] getPath() {
        return path;
    }

    public void setPath(Double[][] path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "Track{" +
                "name='" + name + '\'' +
                ", path=" + Arrays.toString(path) +
                '}';
    }
}
