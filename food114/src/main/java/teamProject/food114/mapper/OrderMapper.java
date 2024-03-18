package teamProject.food114.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.CustomerAddr;
import teamProject.food114.model.Order;

@Mapper
public interface OrderMapper {
	List<CustomerAddr> selectUserAddr(HashMap<String, Object> map); //고객 주소
	void insertOrderAdd(HashMap<String, Object> map); // 주문 접수
	void insertOrderDetailAdd(HashMap<String, Object> map); // 주문 접수(자세히)
	List<Order> selectOrderList(HashMap<String, Object> map);
	Order selectOrderCount(HashMap<String, Object> map);
	void updateOrderStatus(HashMap<String, Object> map);//주문상태
	void updateOrder(HashMap<String, Object> map);//주문완료 후 저장
	void deleteMenu(HashMap<String, Object> map);//주문하기 창에서 메뉴 삭제
	List<Order> selectDaySell(HashMap<String, Object> map);
}