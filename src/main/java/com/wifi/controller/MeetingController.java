package com.wifi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by liyuan on 2018/2/2.
 */
@Controller
public class MeetingController {

    @RequestMapping("/meetings")
    public ModelAndView meetings(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();


        return modelAndView;
    }
}
