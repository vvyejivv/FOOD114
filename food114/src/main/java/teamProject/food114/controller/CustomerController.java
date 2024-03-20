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



	// 마이페이지 - 결제수단 관리
	@RequestMapping("/food114-myPage-payment.do")
	public String myInfoPayment(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/myPage_myInfo(payment)"; // bizReview.jsp
	}
	
	// 마이페이지 - 쿠폰 관리
	@RequestMapping("/food114-myPage-coupon.do")
	public String myInfoCoupon(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/myPage_myInfo(coupon)"; // bizReview.jsp
	}
	
	// 마이페이지 - 나의정보 - 메인화면 myPage_myInfo(main)
	@RequestMapping("/food114-myPage.do")
	public String myPage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/myPage_myInfo(main)";
	}
	
	// 마이페이지 - 포인트 관리
	@RequestMapping("/food114-myPage-point.do")
	public String myInfoPoint(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/myPage_myInfo(point)"; // bizReview.jsp
	}

	// 마이페이지 - 나의 정보 수정 (myInfo 변경 : 이름, 별명, 연락처, 이메일)
	@RequestMapping(value = "/updateMyInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateMyInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.editMyInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	// 마이페이지 - 회원탈퇴
	@RequestMapping(value = "/consumer-leave.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumerLeace(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap=customerService.editUserLeave(map);
		session.invalidate();
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
	@RequestMapping("/food114-myPage-pwd.do")
	public String myPagePwd(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
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
	public String myPagePwd2(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		if (!map.containsKey("result")) {
			return "redirect:/myInfoPwd.do";
		}
		return "/myPage_myInfo(updatePwd)2";
	}

	// 마이페이지 - 나의정보 - 비밀번호변경 두번째 페이지(새로운 비밀번호 입력)
	@RequestMapping(value = "/myInfoPwdUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myInfoPwd2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.editPwd(map);
		return new Gson().toJson(resultMap);
	}

	// 마이페이지 - 나의정보 - 주소지	
	@RequestMapping("/food114-myPage-addr.do")
	public String myInfoAddr(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/myPage_myInfo(addr)";
	}
	
	
	

	// myInfo - my주소지 관리 - 주소지 상세보기
	@RequestMapping(value = "/myInfoAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchMyInfoAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = customerService.searchMyInfoAddr(map);
			return new Gson().toJson(resultMap);
	}
	
	
	// myInfo - my주소지 관리 - 기본주소지 Y
		@RequestMapping(value = "/myInfoAddrListYn.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String editAddrListYn(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				resultMap = customerService.editAddrListYn(map);
				return new Gson().toJson(resultMap);
		}
	
	// myInfo - my주소지 관리 - 주소지 추가
	@RequestMapping(value = "/insertAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.insertAddr(map);
		return new Gson().toJson(resultMap);
	}
	
	// myInfo - my주소지 관리 - 주소지 삭제
	@RequestMapping(value = "/deleteAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteAddrList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.deleteAddr(map);
		return new Gson().toJson(resultMap);
	}
	
	// myInfo - my주소지 관리 - 주소지 수정
	@RequestMapping(value = "/updateAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.editAddr(map);
		return new Gson().toJson(resultMap);
	}
	
	
	// 마이페이지 - 나의정보 - 등급
	@RequestMapping("/food114-myPage-grade.do")
	public String myPageGrade(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/myPage_myInfo(grade)";
	}
	// 마이페이지 - 결제/수단/리뷰 - 주문내역
	@RequestMapping("/food114-myPage-order.do")
	public String myOrderList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		if(!map.containsKey("nowPage")) {
			map.put("nowPage", 1);
		}
		request.setAttribute("map", map);
		return "/myPage_orderList";
	}
	// 마이페이지 - 결제/수단/리뷰 - 주문내역 목록 불러오기
	@RequestMapping(value = "/myOrderList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myOrderList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.searchMyOrderList(map);
		return new Gson().toJson(resultMap);
	}

	// 고객 메인 페이지
	@RequestMapping("/food114.do")
	public String food114Main(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/food114";
	}	

	// 고객 회원가입 페이지
	@RequestMapping("/food114-join.do")
	public String consumerJoin(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		return "/consumerJoin";
	}

	// 고객 로그인 페이지
	@RequestMapping("/food114-login.do")
	public String consumerLogin(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		return "/consumerLogin";
	}

	// 고객 회원가입 성공 페이지
	@RequestMapping("/food114-welcome.do")
	public String consumerJoinSuccess(HttpServletRequest request, Model model,
			@RequestParam HashMap<String, Object> map) throws Exception {
		return "/consumerJoinAfter";
	}

	// 결제완료창	
	@RequestMapping("/paymentCompleted.do")
	public String paymentCompleted(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		return "/paymentCompleted"; 
	}
	
	// 고객 주소 목록 불러오기
	@RequestMapping(value = "/consumerAddrList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumerAddrList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.searchUserAddrList(map);
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
		session.invalidate();

		return new Gson().toJson(resultMap);
	}

	// 고객 회원가입 클릭시
	@RequestMapping(value = "/paymentCompleted.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String paymentCompleted(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = customerService.searchMyOrder(map);
		return new Gson().toJson(resultMap);
	}
	
	
	

}
