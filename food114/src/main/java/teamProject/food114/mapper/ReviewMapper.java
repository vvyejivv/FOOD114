package teamProject.food114.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Review;

@Mapper
public interface ReviewMapper {
	List<Review> selectReviewList(HashMap<String, Object> map); //리뷰 리스트 조회	
	List<Review> selectReviewInfo(HashMap<String, Object> map);//리뷰, 답댓글 조회
	List<Review> selectBizReviewList(HashMap<String, Object> map); //리뷰 사업자
	Review selectBizReviewInfo(HashMap<String, Object> map); //리뷰 사업자 자세히
	
}