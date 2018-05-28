package in.fiinfra.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppletController {


    @RequestMapping("/applet/upload")
    public ModelAndView test() {
    	System.out.println("i am in test");
        return new ModelAndView("upload");
    }

   
}