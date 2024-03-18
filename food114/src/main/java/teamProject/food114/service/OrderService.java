package teamProject.food114.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OrderService {
	HashMap<String, Object> searchOrderUser(HashMap<String, Object> map); //주문자 주소 검색
	HashMap<String, Object> searchOrderList(HashMap<String, Object> map);
	HashMap<String, Object> addOrderDetail(List<Map<String, Object>> list, HashMap<String, Object> map); //주문 접수
	HashMap<String, Object> updateOrderStatus(HashMap<String, Object> map); //주문 상태
	HashMap<String, Object> updateOrder(HashMap<String, Object> map); //주문완료
	HashMap<String, Object> removeMenu(HashMap<String, Object> map); //주문 중 메뉴삭제
	HashMap<String, Object> searchDaySell(HashMap<String, Object> map);
	
	
}