package teamProject.food114.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Coupon;

@Mapper
public interface CouponMapper {
	//쿠폰 목록
	List<Coupon> couponCheck(HashMap<String, Object> map); 
}