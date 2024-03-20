package teamProject.food114.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.OrderMapper;
import teamProject.food114.model.CustomerAddr;
import teamProject.food114.model.Order;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper orderMapper;
	
	@Override
	public HashMap<String, Object> searchOrderUser(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<CustomerAddr> customerAddr = orderMapper.selectUserAddr(map);
			resultMap.put("customerAddr", customerAddr);
			resultMap.put("result", "success");

		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> searchOrderList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<Order> orderList = orderMapper.selectOrderList(map);
			Order cnt = orderMapper.selectOrderCount(map);
			resultMap.put("cnt", cnt);
			resultMap.put("orderList", orderList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
	// 주문 정보	
	@Override
	public HashMap<String, Object> addOrderDetail(List<Map<String, Object>> list, HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			HashMap<String, Object> dataMap = new HashMap<>();
			dataMap.put("userId", map.get("userId"));
			dataMap.put("bizId", map.get("bizId"));
			dataMap.put("status", map.get("status"));
			dataMap.put("addr", map.get("addr"));
			dataMap.put("detail", map.get("detail"));
			dataMap.put("phone", map.get("phone"));
			orderMapper.insertOrderAdd(dataMap);
	        for (Map<String, Object> menu : list) {
	        	System.out.println(menu);
	        	dataMap.put("menuNo", menu.get("menuNo"));
	        	dataMap.put("count", menu.get("cnt"));
	        	dataMap.put("unitPrice", menu.get("unitPrice"));
	            orderMapper.insertOrderDetailAdd(dataMap);
	        }
			resultMap.put("result", "success");
			resultMap.put("orderNo", dataMap.get("ORDERNO"));
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
	// 주문상태 업데이트
	@Override
	public HashMap<String, Object> updateOrderStatus(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			orderMapper.updateOrderStatus(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
	// 주문중 메뉴 삭제
	@Override
	public HashMap<String, Object> removeMenu(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			orderMapper.deleteMenu(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
	//주문 완료
	@Override
	public HashMap<String, Object> updateOrder(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			orderMapper.updateOrder(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchDaySell(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<Order> daySellList = orderMapper.selectDaySell(map);
			resultMap.put("daySellList", daySellList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}


}