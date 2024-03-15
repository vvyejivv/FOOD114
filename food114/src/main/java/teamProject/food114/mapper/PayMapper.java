package teamProject.food114.mapper;


import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayMapper {
	// 결제 내용 추가
	void insertPayInfoSave(HashMap<String, Object> map);
}