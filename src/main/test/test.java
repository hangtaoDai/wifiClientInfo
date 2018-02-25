import com.wifi.bean.Usermac;
import com.wifi.service.UsermacService;
import org.junit.Test;
import org.junit.runner.RunWith;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试
@ContextConfiguration(locations={"classpath:spring-service.xml","classpath:spring-dao.xml","classpath:spring-web.xml","classpath:mybatis-config.xml"}) //加载配置文件
@WebAppConfiguration("src/main/resources")
public class test {
    @Autowired
    UsermacService usermacService;
    @Test
    public void A(){
       // UsermacService usermacService=new UsermacServiceImpl();
        List<Usermac> usermacs = usermacService.selectUsermacByUsername("xjtunic");
        System.out.println(usermacs.toString());
    }
}
