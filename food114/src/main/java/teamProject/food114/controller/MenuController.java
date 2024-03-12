package teamProject.food114.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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

		return "/foodFind";
	}

	// 배달 카테고리 전체 검색
	@RequestMapping(value = "/foodCategoryAll.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumerJoin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = menuService.searchCategory(map);
		return new Gson().toJson(resultMap);
	}
	
	// 가게 메뉴
	@RequestMapping(value = "/menuList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String menuList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = menuService.searchMenuList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/menuView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String menuView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = menuService.searchMenuView(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/menuUploadNoFile.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String menuUploadNoFile(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = menuService.addMenuNoFile(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/menuUpdateNoFile.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String menuUpdateNoFile(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = menuService.editMenuNoFile(map);
		return new Gson().toJson(resultMap);
	}

	// file upload
	@RequestMapping("/menuUpload.dox")
	public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("bizId") String bizId,
			@RequestParam("menu") String menu, @RequestParam("price") String price,
			@RequestParam("menuInfo") String menuInfo,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		String url = null;
		String path = "c:\\img";
		try {

			// String uploadpath = request.getServletContext().getRealPath(path);
			String uploadpath = path;
			String originFilename = multi.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			long size = multi.getSize();
			String saveFileName = genSaveFileName(extName);

			System.out.println("uploadpath : " + uploadpath);
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			String path2 = System.getProperty("user.dir");
			System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
			if (!multi.isEmpty()) {
				File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
				multi.transferTo(file);

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("fileName", saveFileName);
				map.put("path", "../img/");
				map.put("bizId", bizId);
				map.put("menu", menu);
				map.put("price", price);
				map.put("menuInfo", menuInfo);
				map.put("orgName", originFilename);
				map.put("fileSize", size);
				map.put("etc", extName);
				// insert 쿼리 실행
				menuService.addMenu(map);

				model.addAttribute("filename", multi.getOriginalFilename());
				model.addAttribute("uploadPath", file.getAbsolutePath());

				return "redirect:biz-menu-insert.do";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:biz-menu-insert.do";
	}

	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";

		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;

		return fileName;
	}
	
	@RequestMapping("/menuUpdate.dox")
	public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("bizId") String bizId,
			@RequestParam("menu") String menu, @RequestParam("price") String price,
			@RequestParam("menuInfo") String menuInfo, @RequestParam("menuNo") String menuNo, @RequestParam("status") String status,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		String url = null;
		String path = "c:\\img";
		try {

			// String uploadpath = request.getServletContext().getRealPath(path);
			String uploadpath = path;
			String originFilename = multi.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			long size = multi.getSize();
			String saveFileName = genSaveFileName(extName);

			System.out.println("uploadpath : " + uploadpath);
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			String path2 = System.getProperty("user.dir");
			System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
			HashMap<String, Object> map = new HashMap<String, Object>();
			if (!multi.isEmpty()) {
				File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
				multi.transferTo(file);

				map.put("fileName", saveFileName);
				map.put("path", "../img/");
				map.put("bizId", bizId);
				map.put("menu", menu);
				map.put("price", price);
				map.put("menuInfo", menuInfo);
				map.put("menuNo", menuNo);
				map.put("status", status);
				map.put("orgName", originFilename);
				map.put("fileSize", size);
				map.put("etc", extName);
				// update 쿼리 실행
				menuService.editMenu(map);

				model.addAttribute("filename", multi.getOriginalFilename());
				model.addAttribute("uploadPath", file.getAbsolutePath());

				return "redirect:biz-menu-update-view.do";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:biz-menu-update-view.do";
	}
}
