package teamProject.food114.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Board;

@Mapper
public interface BoardMapper {
	
	// select * where code=3 이벤트 목록 전체 호출 
	List<Board> selectEventList(HashMap<String,Object> map); 
}