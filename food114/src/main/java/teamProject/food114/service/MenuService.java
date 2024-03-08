package teamProject.food114.service;

import java.util.HashMap;

public interface MenuService {
	
	// 카테고리 전체 검색
	HashMap<String,Object> searchCategory(HashMap<String,Object> map);
}