package in.fiinfra.auth.ctrl;

import in.fiinfra.cp.common.ctrl.AbstractController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/auth")
public class AuthController extends AbstractController{

	
	public void changePassword(){
		
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(){
		return "redirect:/index.jsp";
	}
}
