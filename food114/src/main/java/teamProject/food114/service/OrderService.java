package teamProject.food114.service;

import java.util.HashMap;

public interface OrderService {
	//주문자 주소 검색
	HashMap<String, Object> searchOrderUser(HashMap<String, Object> map);
	
	HashMap<String, Object> searchOrderList(HashMap<String, Object> map);
	//주문 접수
	HashMap<String, Object> addOrder(HashMap<String, Object> map);
}