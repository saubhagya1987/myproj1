package in.fiinfra.common;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationContext.xml"})
public class AbstractTestCase {
	
	protected void printJson(String title, Object data){
		Gson gson = new Gson();
		System.out.println("***********"+title+"*******************************");
		System.out.println(gson.toJson(data));
		System.out.println("***************************************************");
	}

}
