package teamProject.food114.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import teamProject.food114.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;

	@Autowired
	HttpSession session;

	
	//가게 리뷰
	@RequestMapping("/shopReview.do")
	public String shopReview(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		request.setAttribute("map", map);
		/* System.out.println(map); */
		return "/shopReview"; 
	}
	//리뷰 정보
	@RequestMapping(value = "/reviewList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String reviewList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = reviewService.searchReviewList(map);
		return new Gson().toJson(resultMap);
	}

}
