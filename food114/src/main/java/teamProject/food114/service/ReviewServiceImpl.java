package teamProject.food114.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.ReviewMapper;
import teamProject.food114.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewMapper reviewMapper;

	@Autowired
	HttpSession session;
	
	
	//리뷰 리스트 확인
	@Override
	public HashMap<String, Object> searchReviewList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Review> reviewList = reviewMapper.selectReviewList(map);
			resultMap.put("reviewList", reviewList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}