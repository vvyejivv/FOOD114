package teamProject.food114.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Category;
import teamProject.food114.model.Menu;

@Mapper
public interface MenuMapper {
	// 카테고리 전체 검색
	List<Category> selectCategory(HashMap<String, Object> map);
	//메뉴 검색
	List<Menu> selectMenuList(HashMap<String, Object>map);
	Menu selectMenuCount(HashMap<String, Object>map);
	
	void insertMenu(HashMap<String, Object> map);
	
	void insertMenuNoFile(HashMap<String, Object> map);
	
	Menu selectMenuView(HashMap<String, Object> map);
	
	void updateMenu(HashMap<String, Object> map);
	
	void updateMenuNoFile(HashMap<String, Object> map);
}