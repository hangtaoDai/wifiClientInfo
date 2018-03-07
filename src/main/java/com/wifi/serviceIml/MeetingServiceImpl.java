package com.wifi.serviceIml;

import com.google.gson.Gson;
import com.wifi.bean.VO.Link;
import com.wifi.bean.VO.MeetingGraph;
import com.wifi.bean.VO.Node;
import com.wifi.dao.MeetingMapper;
import com.wifi.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Daihangtao on 2018/2/26.
 */
@Service
public class MeetingServiceImpl implements MeetingService {

    @Autowired
    MeetingMapper meetingMapper;

    public String getMeetingsByUName(String date, String username) {
        List<HashMap> meetings = meetingMapper.selectByUName(date, username);
        System.out.println(meetings.get(0).get("meeting_id"));
        MeetingGraph meetingGraph = new MeetingGraph();

        ArrayList<Node> nodes = new ArrayList<Node>();
        Node user = new Node();
        user.setName(username);
        user.setGroup(1);
        nodes.add(user);

        ArrayList<Link> links = new ArrayList<Link>();
        int i = 1;
        for (HashMap m : meetings){
            Node partner = new Node();
            partner.setName((String) m.get("pname"));
            partner.setAp_address((String) m.get("ap_address"));
            partner.setStart_time((String) m.get("start_time"));
            partner.setLast_time((String) m.get("last_time"));
            partner.setGroup(1);
            nodes.add(partner);

            Link link = new Link();
            link.setSource(i);
            link.setTarget(0);
            link.setValue(1.0);
            i++;
            links.add(link);

        }

        meetingGraph.setNodes(nodes);
        meetingGraph.setLinks(links);

        String str = new Gson().toJson(meetingGraph);
        System.out.println(str);
        return str;
    }
}
