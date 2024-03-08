package teamProject.food114.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Category;

@Mapper
public interface MenuMapper {
	// 카테고리 전체 검색
	List<Category> selectCategory(HashMap<String, Object> map);
}