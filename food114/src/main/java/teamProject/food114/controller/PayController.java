package teamProject.food114.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {
	@RequestMapping("/pay.do")
	public String businessSignup(Model model) throws Exception {
		return "/portone"; 
	}

}
