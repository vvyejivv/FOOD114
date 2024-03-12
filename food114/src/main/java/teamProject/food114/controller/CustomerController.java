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

	// 마이페이지 - 나의정보 - 메인화면 myPage_myInfo(main)
	@RequestMapping("/myInfo.do")
	public String myPage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception { 
		request.setAttribute("map", map);
		return "/myPage_myInfo(main)";
	}
	
	// 마이페이지 - 나의정보 - 메인화면 myPage_myInfo(main)
	@RequestMapping("/myInfo_header.do")
	public String myPageHeader(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception { 
		request.setAttribute("map", map);
		return "/myPage_header";
	}
	
	// 마이페이지 - 나의 정보 수정
	@RequestMapping(value = "/updateMyInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateMyInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.editMyInfo(map);
		return new Gson().toJson(resultMap);
	}

	// 마이페이지-나의정보 불러오기 <-userId
	@RequestMapping(value = "/myInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.searchMyInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	// 마이페이지 - 나의정보 - 비밀번호변경
		@RequestMapping("/myInfoPwd.do")
		public String myPagePwd(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception { 
			request.setAttribute("map", map);
			return "/myPage_myInfo(updatePwd)1";
		}
	// 마이페이지 - 나의정보 - 비밀번호변경 첫번째 페이지(기존 비밀번호 입력)
	@RequestMapping(value = "/myInfoPwd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String myInfoPwd1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = customerService.searchLoginUserId(map);
			return new Gson().toJson(resultMap);
		}
	
	// 마이페이지 - 나의정보 - 비밀번호변경 두번째 페이지(새로운 비밀번호 입력)
	@RequestMapping("/myInfoPwdUpdate.do")
	public String myPagePwd2(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception { 
		request.setAttribute("map", map);
		return "/myPage_myInfo(updatePwd)2";
	}
	
	// 마이페이지 - 나의정보 - 비밀번호변경 두번째 페이지(새로운 비밀번호 입력)
	@RequestMapping(value = "/myInfoPwdUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String myInfoPwd2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = customerService.searchLoginUserId(map);
			return new Gson().toJson(resultMap);
		}
	
	// 마이페이지 - 나의정보 - 주소지
	@RequestMapping("/myInfoAddr.do")
		public String myInfoAddr(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception { 
			request.setAttribute("map", map);
			return "/myPage_myInfo(addr)";
		}	
	
		
	// 마이페이지 - 나의정보 - 등급
		@RequestMapping("/myInfoGrade.do")
		public String myPageGrade(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception { 
			request.setAttribute("map", map);
			return "/myPage_myInfo(grade)";
		}
	

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

	// 고객 주소 목록 불러오기
	@RequestMapping(value = "/consumerAddrList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumerAddrList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap=customerService.searchUserAddrList(map);
		return new Gson().toJson(resultMap);
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
