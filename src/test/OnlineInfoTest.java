import com.wifi.service.OnlineInfoService;
import com.wifi.service.UsermacService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


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
        String str = usermacService.selectUsermacByUsername("xjtu");

        System.out.println(str);
    }

    @Test
    public void testOnlineTrackByUName(){
        String date = "2016-10-27";
        String uname = "xxzxtemp5";
        String str = onlineInfoService.getTrackByUName(date,uname);
        System.out.println(str);
    }

    @Test
    public void testOnlineTrackByUMac(){
        String date = "2016-10-27";
        String umac = "8cebc69fb6d4";
        String str = onlineInfoService.getTrackByUMac(date,umac);
        System.out.println(str);

    }
}
