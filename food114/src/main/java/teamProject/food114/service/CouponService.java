package teamProject.food114.service;

import java.util.HashMap;

public interface CouponService {
	// 쿠폰 목록
	HashMap<String, Object> searchCoupon(HashMap<String, Object> map);
}