package teamProject.food114.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.OrderMapper;
import teamProject.food114.model.CustomerAddr;




@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderMapper orderMapper;
	
	
	@Override
	public HashMap<String, Object> searchOrderUser(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			CustomerAddr customerAddr = orderMapper.selectUserAddr(map);
			resultMap.put("customerAddr",customerAddr);
			resultMap.put("result","success");
				
			
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
}