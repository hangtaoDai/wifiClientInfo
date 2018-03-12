package com.wifi.bean.VO;

import java.util.List;

/**
 * Created by Daihangtao on 2018/2/28.
 */
public class MeetingGraph {
    private List<Node> nodes;
    private List<Link> links;
    private boolean code;

    public MeetingGraph() {
        this.code = false;
    }

    public void setCode(boolean code) {
        this.code = code;
    }

    public boolean isCode() {
        return code;
    }

    public List<Node> getNodes() {
        return nodes;
    }

    public void setNodes(List<Node> nodes) {
        this.nodes = nodes;
    }

    public List<Link> getLinks() {
        return links;
    }

    public void setLinks(List<Link> links) {
        this.links = links;
    }

    @Override
    public String toString() {
        return "{" +
                "nodes=" + nodes +
                ", links=" + links +
                ", code=" + code +
                '}';
    }
}
