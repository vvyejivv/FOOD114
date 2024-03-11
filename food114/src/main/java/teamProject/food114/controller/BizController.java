package teamProject.food114.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

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
	
	@RequestMapping("/orderTest.do")
	public String orderTest(Model model) throws Exception {
		return "/orderTest"; // orderTest.jsp
	}

	@RequestMapping("/mapSearch.do")
	public String mapSearch(Model model) throws Exception {
		return "/mapSearch"; // mapSearch.jsp
	}
	
	//사업자 로그인
	@RequestMapping("/bizLogin.do")
	public String bizLogin(Model model) throws Exception {
		return "/bizLogin"; 
	}
//	@RequestMapping(value = "/bizSignup.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public String bizSignup(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap = bizService.addBiz(map);
//		return new Gson().toJson(resultMap);
//	}
	//사업자 로그인 
	@RequestMapping(value = "/biz-login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumerLogin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchLoginBizId(map);
		return new Gson().toJson(resultMap);
	}
	

	@RequestMapping("/mapTest.do")
	public String mapTest(Model model) throws Exception {
		return "/mapTest"; // mapTest.jsp
	}

	@RequestMapping("/mapTest2.do")
	public String mapTest2(Model model) throws Exception {
		return "/mapTest2"; // mapTest2.jsp
	}
	
	@RequestMapping("/mapTest3.do")
	public String mapTest3(Model model) throws Exception {
		return "/mapTest3"; // mapTest3.jsp
	}
	
	@RequestMapping("/biz-menu-update.do")
	public String bizMenuUpdate(Model model) throws Exception {
		return "/biz_menu_update"; // biz_menu_update.jsp
	}
	
	@RequestMapping("/biz-menu-insert.do")
	public String bizMenuInsert(Model model) throws Exception {
		return "/biz_menu_insert"; // biz_menu_insert.jsp
	}
	
	@RequestMapping("/biz-info.do")
	public String bizInfo(Model model) throws Exception {
		return "/biz_info"; // biz_info.jsp
	}
	
	@RequestMapping("/biz-sales.do")
	public String bizSales(Model model) throws Exception {
		return "/biz_sales_data"; // biz_sales_data.jsp
	}

	@RequestMapping(value = "/bizSignup.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bizSignup(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.addBiz(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/idCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String idCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.idCheck(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/emailCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String emailCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.emailCheck(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/bizList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bizList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchBizList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/siList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String siList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchSiList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/guList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String guList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchGuList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/dongList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String dongList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchDongList(map);
		return new Gson().toJson(resultMap);
	}
}
