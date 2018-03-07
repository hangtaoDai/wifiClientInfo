package com.wifi.serviceIml;

import com.google.gson.Gson;
import com.wifi.bean.Usermac;
import com.wifi.bean.VO.UserMacVO;
import com.wifi.bean.VO.UserMacWithName;
import com.wifi.dao.UserMapper;
import com.wifi.dao.UsermacMapper;
import com.wifi.service.UsermacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by liyuan on 2018/1/29.
 */
@Service
public class UsermacServiceImpl implements UsermacService {

    @Autowired
    UsermacMapper usermacMapper;
    @Autowired
    UserMapper userMapper;

    public String selectUsermacByUsername(String username) {
        Integer userId = userMapper.selectIdByUserName(username);
        List<Usermac> usermacs = usermacMapper.selectByuserId(userId);
        ArrayList<UserMacWithName> userMacWithNames = new ArrayList<UserMacWithName>();
        UserMacVO userMacVO = new UserMacVO();
        int i = 1;
        for (Usermac um: usermacs){
            UserMacWithName userMacWithName = new UserMacWithName();
            userMacWithName.setId(i);
            userMacWithName.setUsername(username);
            userMacWithName.setUsermacId(um.getUsermacId());
            userMacWithName.setUserId(um.getUserId());
            userMacWithName.setUserMac(um.getUserMac());
            userMacWithName.setUserMac(um.getUserMac());
            userMacWithNames.add(userMacWithName);
            i++;
        }

        userMacVO.setCount(userMacWithNames.size());
        userMacVO.setData(userMacWithNames);



        String str = new Gson().toJson(userMacVO);

        System.out.println(str);
        return str;
    }
}
