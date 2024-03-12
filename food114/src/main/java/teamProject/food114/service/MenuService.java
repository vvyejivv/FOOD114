package teamProject.food114.service;

import java.util.HashMap;

public interface MenuService {
	
	// 카테고리 전체 검색
	HashMap<String,Object> searchCategory(HashMap<String,Object> map);
	// 메뉴 검색
	HashMap<String,Object> searchMenuList(HashMap<String,Object> map);
	
	HashMap<String,Object> addMenu(HashMap<String,Object> map);
	
	HashMap<String,Object> addMenuNoFile(HashMap<String,Object> map);
	
	HashMap<String,Object> searchMenuView(HashMap<String,Object> map);
	
	HashMap<String,Object> editMenu(HashMap<String,Object> map);
	
	HashMap<String,Object> editMenuNoFile(HashMap<String,Object> map);
}