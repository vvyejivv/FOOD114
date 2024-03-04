package teamProject.food114.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamProject.food114.service.BizService;

@Controller
public class BizController {
	
	@Autowired
	BizService bizService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/business-signup.do")
	public String businessSignup(Model model) throws Exception {
		return "/business_signup"; // business_signup.jsp
	}
	
	@RequestMapping("/mapSearch.do")
	public String mapSearch(Model model) throws Exception {
		return "/mapSearch"; // mapSearch.jsp
	}
	

//	@RequestMapping(value = "/bizSignup.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public String bizSignup(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap = bizService.addBiz(map);
//		return new Gson().toJson(resultMap);
//	}
}
