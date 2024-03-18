package teamProject.food114.service;

import java.util.HashMap;

public interface ReviewService {
	//리뷰 리스트
	HashMap<String, Object> searchReviewList(HashMap<String, Object> map);
	//리뷰 리스트(user)
	HashMap<String, Object> searchUserReviewList(HashMap<String, Object> map);
	//리뷰 사업자
	HashMap<String, Object> searchBizReviewList(HashMap<String, Object> map);
	//리뷰 사업자 자세히
	HashMap<String, Object> searchBizReviewInfo(HashMap<String, Object> map);
	//리뷰 답글
	HashMap<String, Object> addPreivew(HashMap<String, Object> map);
	//리뷰 답글 수정
	HashMap<String, Object> editPreview(HashMap<String, Object> map);
	
	HashMap<String, Object> searchOrederListView(HashMap<String, Object> map);
	
	HashMap<String, Object> addReviewAdd(HashMap<String, Object> map);
}