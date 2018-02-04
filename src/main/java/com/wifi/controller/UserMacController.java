package com.wifi.controller;

import com.wifi.bean.Usermac;
import com.wifi.service.UsermacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by liyuan on 2018/1/30.
 */

@Controller
public class UserMacController {

    @Autowired
    UsermacService usermacService;

    @RequestMapping("/historymac")
    public ModelAndView getMacByUserName(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        String username = request.getParameter("username");
     //   String username = "xjtunic";
        List<Usermac> usermacs = usermacService.selectUsermacByUsername(username);
        modelAndView.addObject("usermacs",usermacs);
        modelAndView.addObject("username",username);
        modelAndView.setViewName("/historymac");
        return modelAndView;

    }
}
