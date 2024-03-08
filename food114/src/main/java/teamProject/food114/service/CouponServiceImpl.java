package teamProject.food114.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.CouponMapper;
import teamProject.food114.model.Coupon;


@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	CouponMapper couponMapper;
	

	@Override
	public HashMap<String, Object> searchCoupon(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<Coupon> coupon = couponMapper.couponCheck(map);
			resultMap.put("coupon", coupon);
			resultMap.put("result", "success");
			
		} catch (Exception e) {
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
}