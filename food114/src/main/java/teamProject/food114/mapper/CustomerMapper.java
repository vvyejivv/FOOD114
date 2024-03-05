package teamProject.food114.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Customer;

@Mapper
public interface CustomerMapper {
	// 고객 추가
	void insertConsumer(HashMap<String, Object> map);
	
	// select * consumer where userId
	Customer selectUserID(HashMap<String, Object> map);
	
	// select * consumer food114 where email
	Customer selectEmail(HashMap<String, Object> map);
}