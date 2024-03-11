package teamProject.food114.controller;

import java.util.HashMap;

import javax.naming.directory.InvalidAttributeIdentifierException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import teamProject.food114.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@Autowired
	HttpSession session;
	


	// 고객 메인 페이지
	@RequestMapping("/food114.do")
	public String food114Main(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		return "/mainPage";
	}

	// 고객 회원가입 페이지
	@RequestMapping("/consumer-join.do")
	public String consumerJoin(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		return "/consumerJoin";
	}

	// 고객 로그인 페이지
	@RequestMapping("/consumer-login.do")
	public String consumerLogin(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		return "/consumerLogin";
	}

	// 고객 회원가입 성공 페이지
	@RequestMapping("/consumer-join-success.do")
	public String consumerJoinSuccess(HttpServletRequest request, Model model,
			@RequestParam HashMap<String, Object> map) throws Exception {
		return "/consumerJoinAfter";
	}

	// 고객 회원가입 클릭시
	@RequestMapping(value = "/consumer-join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumerJoin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.addConsumer(map);
		return new Gson().toJson(resultMap);
	}

	// 아이디 중복 확인 클릭시
	@RequestMapping(value = "/consumer-idCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumeridCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.searchUserId(map);
		return new Gson().toJson(resultMap);
	}

	// 이메일 중복 확인 클릭시
	@RequestMapping(value = "/email-check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String emailCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.searchEmail(map);
		return new Gson().toJson(resultMap);
	}

	// 고객 로그인
	@RequestMapping(value = "/consumer-login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumerLogin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.searchLoginUserId(map);
		return new Gson().toJson(resultMap);
	}

	// 로그아웃
	@RequestMapping(value = "/logout.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String logout(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(session.getAttribute("sessionId"));
		session.invalidate();

		return new Gson().toJson(resultMap);
	}

}
