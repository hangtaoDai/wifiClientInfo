package com.wifi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by liyuan on 2018/1/27.
 */

@Controller
public class IndexController {

    @RequestMapping(value="/index")
    public String index(){
        return "index";

    }



    @RequestMapping(value="/maps")
    public String maps(){
        return "maps";

    }

    @RequestMapping(value="/communities")
    public String communities(){
        return "communities";

    }

    @RequestMapping(value="/meetings")
    public String meetings(){
        return "meetings";

    }

    @RequestMapping(value="/login")
    public String login(){
        return "login";

    }


}
