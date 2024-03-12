package teamProject.food114.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Addr;
import teamProject.food114.model.Customer;

@Mapper
public interface CustomerMapper {
	// 고객 추가
	void insertConsumer(HashMap<String, Object> map);
	
	// select * consumer where userId
	Customer selectUserID(HashMap<String, Object> map);
	
	// select * consumer where email
	Customer selectEmail(HashMap<String, Object> map);
	

	// select * addr where userid
	List<Addr> selectUserAddr(HashMap<String,Object> map);

	// myInfo 수정
	void updateMyInfo(HashMap<String, Object> map);
}