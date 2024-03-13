package teamProject.food114.service;

import java.util.HashMap;
import java.util.List;

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
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	public HashMap<String, Object> addOrder(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			orderMapper.insertOrderAdd(map);
			orderMapper.insertOrderDetailAdd(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
}