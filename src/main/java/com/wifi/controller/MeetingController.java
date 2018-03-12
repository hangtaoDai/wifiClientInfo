package com.wifi.controller;

import com.wifi.bean.VO.MeetingGraph;
import com.wifi.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

/**
 * Created by liyuan on 2018/2/2.
 */
@Controller
public class MeetingController {
    @Autowired
    MeetingService meetingService;

    @RequestMapping("/meetings")
    public ModelAndView meetings(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        return modelAndView;
    }

    @RequestMapping(value="/meets",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getMovingTrace(HttpServletRequest request) throws UnsupportedEncodingException {
        System.out.println("coding:"+request.getCharacterEncoding());
        String date = new String(request.getParameter("date").getBytes("ISO-8859-1"),"UTF-8");
        String querystr = new String(request.getParameter("querystr").getBytes("ISO-8859-1"),"UTF-8");
        String type= new String(request.getParameter("type").getBytes("ISO-8859-1"),"UTF-8");
        System.out.println(date+" "+querystr+" "+type);
        String str=null;
        MeetingGraph meetingGraph = new MeetingGraph();
        if (type.equals("mac")){
            str = meetingService.getMeetingsByUName(date, querystr);
            System.out.println(str);
        }else{
            str = meetingService.getMeetingsByUName(date, querystr);
            System.out.println(str);
        }
        System.out.println(meetingGraph==null);
        return str;

    }

}
