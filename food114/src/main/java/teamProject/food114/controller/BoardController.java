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
	@RequestMapping("/event-web.do")
	public String eventWeb(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		return "/eventWeb";
	}

	// 웹 주관 이벤트 목록 호출
	@RequestMapping(value = "/event-list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String eventList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap=boardService.searchEventList(map);
		return new Gson().toJson(resultMap);
	}

	// 공지사항 리스트
	@RequestMapping("/boardNoticeList.do")
	public String userList(Model model) throws Exception { 
		return "/boardNoticeList"; // business_signup.jsp
	}

	// 공지사항 상세보기
	@RequestMapping("/boardNoticeVeiw.do")
	public String boardNotice(Model model) throws Exception { 
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
	
	
	
	
}
