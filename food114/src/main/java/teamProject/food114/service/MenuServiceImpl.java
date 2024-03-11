package teamProject.food114.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.MenuMapper;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuMapper menuMapper;
	
	@Override
	public HashMap<String, Object> searchCategory(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String,Object> resultMap = new HashMap<>();
		try {
			resultMap.put("categoryList", menuMapper.selectCategory(map));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
	//메뉴 검색
	@Override
	public HashMap<String, Object> searchMenuList(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		try {
			resultMap.put("menuList", menuMapper.selectMenuList(map));
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}