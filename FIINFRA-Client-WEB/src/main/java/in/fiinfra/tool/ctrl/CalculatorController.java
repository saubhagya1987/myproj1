package in.fiinfra.tool.ctrl;

import in.fiinfra.cp.common.ctrl.AbstractController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/calculator")
public class CalculatorController extends AbstractController {
	
	@RequestMapping(value = "/calc", method = RequestMethod.GET)
	public String showCalculator() {
		return "cp/calculator";
	}
}
