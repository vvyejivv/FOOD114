package teamProject.food114.service;

import java.util.HashMap;

public interface ReviewService {
	//리뷰 리스트
	HashMap<String, Object> searchReviewList(HashMap<String, Object> map);
	//리뷰 사업자
	HashMap<String, Object> searchBizReviewList(HashMap<String, Object> map);
	//리뷰 사업자 자세히
	HashMap<String, Object> searchBizReviewInfo(HashMap<String, Object> map);
	//리뷰 답글

}