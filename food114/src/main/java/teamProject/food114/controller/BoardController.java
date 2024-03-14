package teamProject.food114.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

//github.com/dlehdwo01/TeamProject1-FOOD114.git
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import teamProject.food114.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

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
		return "/event_biz";
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
	public String boardNotice(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map.get("boardNo"));
		request.setAttribute("boardNo", map.get("boardNo"));
		return "/boardNoticeVeiw";
	}
		
	// 1:1 문의 게시판 글 작성
	@RequestMapping("/boardQnaInsert.do")
	public String insert(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {			request.setAttribute("map", map);
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
	

	
	
	
}
