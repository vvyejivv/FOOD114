package teamProject.food114.service;

import java.util.HashMap;

public interface OrderService {
	//주문자 주소 검색
	HashMap<String, Object> searchOrderUser(HashMap<String, Object> map);
}