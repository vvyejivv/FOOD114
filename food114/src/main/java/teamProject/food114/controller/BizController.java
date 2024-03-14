package teamProject.food114.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import teamProject.food114.service.BizService;

@Controller
public class BizController {

	@Autowired
	BizService bizService;

	@Autowired
	HttpSession session;

	@RequestMapping("/business-signup.do")
	public String businessSignup(Model model) throws Exception {
		return "/business_signup"; // business_signup.jsp
	}

	@RequestMapping("/orderTest.do")
	public String orderTest(Model model) throws Exception {
		return "/orderTest"; // orderTest.jsp
	}

	@RequestMapping("/mapSearch.do")
	public String mapSearch(Model model) throws Exception {
		return "/mapSearch"; // mapSearch.jsp
	}

	// 사업자 로그인
	@RequestMapping("/bizLogin.do")
	public String bizLogin(Model model) throws Exception {
		return "/bizLogin";
	}

	// 사업자 메인
	@RequestMapping("/business-main.do")
	public String businessMain(Model model) throws Exception {
		return "/business_main"; // business_main.jsp
	}

	// 가게 정보
	@RequestMapping("/shopInfo.do")
	public String shopInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/shopInfo";
	}

	// 가게 이벤트
	@RequestMapping("/shopEvent.do")
	public String shopEvent(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/shopEvent";
	}

//	@RequestMapping(value = "/bizSignup.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public String bizSignup(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap = bizService.addBiz(map);
//		return new Gson().toJson(resultMap);
//	}
	
	// 사업자 로그인
	@RequestMapping(value = "/biz-login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String consumerLogin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchLoginBizId(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping("/mapTest.do")
	public String mapTest(Model model) throws Exception {
		return "/mapTest"; // mapTest.jsp
	}

	@RequestMapping("/mapTest2.do")
	public String mapTest2(Model model) throws Exception {
		return "/mapTest2"; // mapTest2.jsp
	}

	@RequestMapping("/mapTest3.do")
	public String mapTest3(Model model) throws Exception {
		return "/mapTest3"; // mapTest3.jsp
	}

	@RequestMapping("/bizView.do")
	public String bizView(Model model) throws Exception {
		return "/bizView"; // bizView.jsp
	}

	@RequestMapping("/biz-menu-update.do")
	public String bizMenuUpdate(Model model) throws Exception {
		return "/biz_menu_update"; // biz_menu_update.jsp
	}

	@RequestMapping("/biz-menu-insert.do")
	public String bizMenuInsert(Model model) throws Exception {
		return "/biz_menu_insert"; // biz_menu_insert.jsp
	}

	@RequestMapping("/biz-menu-update-view.do")
	public String bizMenuUpdateView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/biz_menu_update_view"; // biz_menu_update_view.jsp
	}

	@RequestMapping("/biz-info.do")
	public String bizInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {

		return "/biz_info"; // biz_info.jsp
	}

	@RequestMapping("/biz-sales.do")
	public String bizSales(Model model) throws Exception {
		return "/biz_sales_data"; // biz_sales_data.jsp
	}	

	@RequestMapping("/bizOrder.do")
	public String bizOrder(Model model) throws Exception {
		return "/bizOrder"; // bizOrder.jsp
	}

	@RequestMapping("/bizEvent.do")
	public String bizEvent(Model model) throws Exception {
		return "/bizEvent"; // bizEvent.jsp
	}

	@RequestMapping("/bizEvent_info.do")
	public String bizEvent_info(Model model) throws Exception {
		return "/bizEvent_info"; // bizEvent_info.jsp
	}

	// 은행,카테고리,이메일 불러오기
	@RequestMapping(value = "/selectAll.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectAll(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchSelect(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/bizSignup.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bizSignup(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.addBiz(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/idCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String idCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.idCheck(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/emailCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String emailCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.emailCheck(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/bizList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bizList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchBizList(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/siList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String siList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchSiList(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/guList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String guList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchGuList(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/dongList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String dongList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchDongList(map);
		return new Gson().toJson(resultMap);
	}

	// 가게정보
	@RequestMapping(value = "/shopInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String shopInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchShopInfo(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/bizFile.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bizFile(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchBizFile(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/bizView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bizView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchBizInfo(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/bizInfoUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bizInfoUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.editBizInfo(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/areaRestList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaRestList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bizService.searchAreaList(map);
		return new Gson().toJson(resultMap);
	}

	// file upload
	@RequestMapping("/fileUpload.dox")
	public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("bizId") String bizId,
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
			System.out.println("Working Directory = " + path2 + "\\src\\webapp\\bizFile");
			if (!multi.isEmpty()) {
				File file = new File(path2 + "\\src\\main\\webapp\\bizFile", saveFileName);
				multi.transferTo(file);

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("fileName", saveFileName);
				map.put("path", "../bizFile/");
				map.put("bizId", bizId);
				map.put("orgName", originFilename);
				map.put("fileSize", size);
				map.put("etc", extName);
				// insert 쿼리 실행
				bizService.addBizFile(map);
				// testService.addBoardImg(map);

				model.addAttribute("filename", multi.getOriginalFilename());
				model.addAttribute("uploadPath", file.getAbsolutePath());

				return "redirect:biz-info.do";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:biz-info.do";
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

}
