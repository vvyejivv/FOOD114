package teamProject.food114.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//github.com/dlehdwo01/TeamProject1-FOOD114.git
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import teamProject.food114.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	HttpSession session;
	
	// 웹 주관 이벤트 페이지
	@RequestMapping("/event-web-list.do")
	public String eventWeb(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		if (!map.containsKey("endYn")) {
			request.setAttribute("endYn", "N");
		} else {
			request.setAttribute("endYn", map.get("endYn"));
		}

		return "/eventList";
	}

	// 웹 주관 이벤트 페이지
	@RequestMapping("/event-biz-list.do")
	public String eventBizList(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		if(!map.containsKey("order") || map.get("order")=="") {
			map.put("order", "ORDER BY ENDYN DESC");
		}
		if(!map.containsKey("nowCategory")||map.get("nowCategory")=="") {
			map.put("nowCategory","%%");
		}
		if(!map.containsKey("nowPage")) {
			map.put("nowPage", 1);
		}
		request.setAttribute("map", map);
		return "/event-biz02";
	}

	// 웹 주관 이벤트 페이지 상세보기
	@RequestMapping("/event-web-view.do")
	public String eventWebView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("boardNo", map.get("boardNo"));
		request.setAttribute("endYn", map.get("endYn"));
		return "/eventView";
	}

	// 웹 주관 이벤트 페이지 상세보기
	@RequestMapping(value = "/event-view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String eventView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchEvent(map);
		return new Gson().toJson(resultMap);
	}

	// 웹 주관 이벤트 목록 호출
	@RequestMapping(value = "/event-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String eventList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchEventList(map);
		return new Gson().toJson(resultMap);
	}

	// 공지사항 리스트
	@RequestMapping("/boardNoticeList.do")
	public String userList(Model model) throws Exception {
		return "/boardNoticeList";
	}

	// 공지사항 상세보기
	@RequestMapping("/boardNoticeVeiw.do")
	public String boardNotice(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		System.out.println(map.get("boardNo"));
		request.setAttribute("boardNo", map.get("boardNo"));
		return "/boardNoticeVeiw";
	}

	// 1:1 문의 게시판 글 작성
	@RequestMapping("/boardQnaInsert.do")
	public String insert(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/boardQnaInsert";
	}

	// 게시글 목록
	@RequestMapping(value = "/boardNoticeList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		resultMap = boardService.searchBoardList(map);
		return new Gson().toJson(resultMap);
	}

	// 공지사항 상세보기
	@RequestMapping(value = "/boardNoticeVeiw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBoardInfo(map);
		return new Gson().toJson(resultMap);
	}

	// 자주하는 질문 (목록/상세보기)
	@RequestMapping("/boardNoticeQnaAsk.do")
	public String qnaAsk(Model model) throws Exception {
		return "/boardNoticeQnaAsk";
	}

	@RequestMapping("/bizEvent.do")
	public String bizEvent(Model model) throws Exception {
		if(session.getAttribute("sessionBizId")==null) {
			return "redirect:/nosession.do";
		}
		return "/bizEvent"; // bizEvent.jsp
	}

	@RequestMapping(value = "/listBizEvent.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listBizEvent(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBizEvent(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping("/bizEvent_info.do")
	public String bizEvent_info(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		if(session.getAttribute("sessionBizId")==null) {
			return "redirect:/nosession.do";
		}
		request.setAttribute("map", map);
		return "/bizEvent_info"; // bizEvent_info.jsp
	}

	@RequestMapping(value = "/listBizEventView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listBizEventView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.searchBizEventView(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/editBizEventBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editBizEventBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.editBizEventBoard(map);
		return new Gson().toJson(resultMap);
	}

	// file upload
	@RequestMapping("/bizEventFileUpload.dox")
	public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("boardNo") String boardNo,
			@RequestParam("title") String title, @RequestParam("contents") String contents,
			@RequestParam("type") String type, @RequestParam("endYn") String endYn,
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
			System.out.println("Working Directory = " + path2 + "\\src\\webapp\\boardFile");
			if (!multi.isEmpty()) {
				File file = new File(path2 + "\\src\\main\\webapp\\boardFile", saveFileName);
				multi.transferTo(file);

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("fileName", saveFileName);
				map.put("path", "../boardFile/");
				map.put("boardNo", boardNo);
				map.put("title", title);
				map.put("contents", contents);
				map.put("type", type);
				map.put("endYn", endYn);
				map.put("orgName", originFilename);
				map.put("fileSize", size);
				map.put("etc", extName);
				// insert 쿼리 실행
				/* bizService.addBizFile(map); */
				// testService.addBoardImg(map);
				boardService.addBizEventFile(map);
				model.addAttribute("filename", multi.getOriginalFilename());
				model.addAttribute("uploadPath", file.getAbsolutePath());

				return "redirect:bizEvent_info.do";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:bizEvent_info.do";
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
