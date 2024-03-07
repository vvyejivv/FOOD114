package teamProject.food114.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Code;

@Mapper
public interface CodeMapper {
	List<Code> selectEmail(HashMap<String,Object> map);
	List<Code> selectBank(HashMap<String,Object> map);
}