package teamProject.food114.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import teamProject.food114.service.MenuService;

@Controller
public class MenuController {

	@Autowired
	MenuService menuService;
	
	// 배달 메뉴 찾기
	@RequestMapping("/food114_foodfind.do")
	public String food114FoodFind(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		if(!map.containsKey("category")) {
			map.put("category", "");
		}
		request.setAttribute("map", map);
		return "/foodFind";
	}
	
	// 메뉴 목록
	@RequestMapping("/menuList.do")
	public String menuList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		
		return "/menuList";
	}
	
	// 배달 카테고리 전체 검색
	@RequestMapping(value = "/foodCategoryAll.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumerJoin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = menuService.searchCategory(map);
		return new Gson().toJson(resultMap);
	}
	
	//가게 메뉴
	@RequestMapping(value = "/menuList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String menuList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = menuService.searchMenuList(map);
		return new Gson().toJson(resultMap);
	}
	//선택한 메뉴 검색
	@RequestMapping(value = "/selectMenu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectMenu(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = menuService.searchMenu(map);
		return new Gson().toJson(resultMap);
	}
}
