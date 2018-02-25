import com.wifi.bean.Usermac;
import com.wifi.service.OnlineInfoService;
import com.wifi.service.UsermacService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;


/**
 * Created by Daihangtao on 2018/2/21.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring/spring-*.xml")
@WebAppConfiguration("src/main/resources")
public class OnlineInfoTest {

    @Autowired
    OnlineInfoService onlineInfoService;
    @Autowired
    UsermacService usermacService;


    @Test
    public void test1(){
        String date = "2016-10-27";
        String str = onlineInfoService.getHotAP(date);
        System.out.println(str);

    }

    @Test
    public void test2(){
        List<Usermac> usermacs = usermacService.selectUsermacByUsername("xjtu");
        System.out.println(usermacs.size());
    }
}
