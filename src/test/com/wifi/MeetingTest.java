package com.wifi;

import com.wifi.service.MeetingService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * Created by Daihangtao on 2018/2/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring/spring-*.xml")
@WebAppConfiguration("src/main/resources")
public class MeetingTest {

    @Autowired
    MeetingService meetingService;

    @Test
    public void testMeeting(){

        String meetingsByUName = meetingService.getMeetingsByUName("2016-10-27", "lixiang2016");
        System.out.println(meetingsByUName);
    }
}
