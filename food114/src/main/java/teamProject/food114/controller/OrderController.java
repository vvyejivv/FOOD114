package teamProject.food114.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import teamProject.food114.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;

	// 주문하기 페이지
	@RequestMapping("/food114-shop-order.do")
	public String order(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		System.out.println(map);
		return "/user_shop_order";
	}

	// 주문할 고객 주소
	@RequestMapping(value = "/consumer-addr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumerAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = orderService.searchOrderUser(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/orderList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orderList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = orderService.searchOrderList(map);
		return new Gson().toJson(resultMap);
	}

	// 장바구니 저장
	@RequestMapping(value = "/orderAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addOrder(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
        String json = map.get("selectMenuList").toString();
        ObjectMapper mapper = new ObjectMapper();
        List<Map<String, Object>> list = mapper.readValue(json, new TypeReference<List<Map<String, Object>>>(){});
        map.put("list", list);
        resultMap = orderService.addOrderDetail(list, map); 
        return new Gson().toJson(resultMap);
	}
	//주문 상태 업데이트	
	@RequestMapping(value = "/orderStatusUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orderStatusUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = orderService.updateOrderStatus(map);
		return new Gson().toJson(resultMap);
	}
	//주문 중 메뉴 삭제	
	@RequestMapping(value = "/removeMenu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeMenu(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = orderService.removeMenu(map);
		return new Gson().toJson(resultMap);
	}
	//주문 내용 저장	
	@RequestMapping(value = "/orderUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orderUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String num = (String) map.get("orderNo");
		int orderNo = Integer.parseInt(num);
		map.put("orderNo", orderNo);
		resultMap = orderService.updateOrder(map);
		return new Gson().toJson(resultMap);
	}
	
	// 일매출리스트
	@RequestMapping(value = "/selectDaySellList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectDaySellList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = orderService.searchDaySell(map);
		return new Gson().toJson(resultMap);
	}
}
