package com.wifi.serviceIml;

import com.wifi.bean.Usermac;
import com.wifi.dao.UserMapper;
import com.wifi.dao.UsermacMapper;
import com.wifi.service.UsermacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public List<Usermac> selectUsermacByUsername(String username) {
        Integer userId = userMapper.selectIdByUserName(username);
        List<Usermac> usermacs = usermacMapper.selectByuserId(userId);
        return usermacs;
    }
}
