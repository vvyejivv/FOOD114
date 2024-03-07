package teamProject.food114.mapper;


import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.CustomerAddr;

@Mapper
public interface OrderMapper {
	CustomerAddr selectUserAddr(HashMap<String, Object> map);
	
}