package teamProject.food114.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.CustomerAddr;
import teamProject.food114.model.Order;

@Mapper
public interface OrderMapper {
	CustomerAddr selectUserAddr(HashMap<String, Object> map);
	
	List<Order> selectOrderList(HashMap<String, Object> map);
	
	Order selectOrderCount(HashMap<String, Object> map);
}