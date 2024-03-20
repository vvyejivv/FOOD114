package teamProject.food114.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import teamProject.food114.service.PayService;

@Controller
public class PayController {
	
	@Autowired
	PayService payService;
	
	
	@RequestMapping("/pay.do")
	public String businessSignup(Model model) throws Exception {
		return "/portone"; 
	}

	
	// 결제정보 저장
	@RequestMapping(value = "/PaymentInfoSave.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String PaymentInfoSave(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = payService.addPaymentInfoSave(map);
		return new Gson().toJson(resultMap);
	}

}
