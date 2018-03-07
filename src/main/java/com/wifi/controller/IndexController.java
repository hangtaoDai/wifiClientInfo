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

    @RequestMapping(value="/login")
    public String login(){
        return "login";

    }

    @RequestMapping(value="/main")
    public String main(){
        return "main";

    }

    @RequestMapping(value="/mac")
    public String getMac(){
        return "mac";

    }
    @RequestMapping(value="/relationships")
    public String getRelationships(){
        return "relationship";

    }

    @RequestMapping(value="/routes")
    public String routes(){
        return "routes";

    }


}
