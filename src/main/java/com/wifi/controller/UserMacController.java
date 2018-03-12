package com.wifi.controller;

import com.google.gson.Gson;
import com.wifi.bean.VO.Track;
import com.wifi.service.OnlineInfoService;
import com.wifi.service.UsermacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

/**
 * Created by liyuan on 2018/1/30.
 */

@Controller
public class UserMacController {

    @Autowired
    UsermacService usermacService;

    @Autowired
    OnlineInfoService onlineInfoService;

/*    @RequestMapping("/historymac")
    public ModelAndView getMacByUserName(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        String username = request.getParameter("username");
     //   String username = "xjtunic";
        List<Usermac> usermacs = usermacService.selectUsermacByUsername(username);
        modelAndView.addObject("usermacs",usermacs);
        modelAndView.addObject("username",username);
        modelAndView.setViewName("/historymac");
        return modelAndView;

    }*/

    @RequestMapping("/macs")
    @ResponseBody
    public String getMacByUserNameInfo(HttpServletRequest request){

        String username = request.getParameter("username");

        String str = usermacService.selectUsermacByUsername(username);

        return str;

    }

    @RequestMapping("/movings")
    @ResponseBody
    public boolean getMovingTrace(HttpServletRequest request){

        String date = request.getParameter("date");
        String querystr = request.getParameter("querystr");
        String type= request.getParameter("type");
        System.out.println(date+" "+querystr+" "+type);
        String str=null;
        ArrayList<Track> tracks = new ArrayList<Track>();
        if (type.equals("mac")){
            tracks = onlineInfoService.getTrackByUMac(date, querystr);
            System.out.println(str);
        }else{
            tracks = onlineInfoService.getTrackByUName(date,querystr);
            System.out.println(str);
        }
        System.out.println("tracks.size"+tracks.size());
        if (tracks.size()==0)
            return false;
        else
            return true;

    }


    @RequestMapping("/traces")
    public ModelAndView toTracePage(HttpServletRequest request){

        String date = request.getParameter("date");
        String querystr = request.getParameter("querystr");
        String type= request.getParameter("type");
        System.out.println(date+" "+querystr+" "+type);
        String str=null;
        ArrayList<Track> tracks;
        ModelAndView mv =new ModelAndView();
        if (type.equals("mac")){
            tracks = onlineInfoService.getTrackByUMac(date, querystr);


        }else{
            tracks = onlineInfoService.getTrackByUName(date,querystr);

        }

        if (tracks.size()==0) {
            mv.setViewName("routes");
            mv.addObject("code",-1);
        }
        else {
            str = new Gson().toJson(tracks);
            mv.setViewName("traces");
            mv.addObject("code",200);
            mv.addObject("data",str);
            System.out.println(str);
        }

        return mv;

    }


    @RequestMapping(value="/hotmap", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getHotAP(HttpServletRequest request) {

        String date = request.getParameter("date");
        String str=  onlineInfoService.getHotAP(date);
        return str;

    }

}
