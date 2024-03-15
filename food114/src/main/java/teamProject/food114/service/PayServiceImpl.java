package teamProject.food114.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.PayMapper;



@Service
public class PayServiceImpl implements PayService {
	@Autowired
	PayMapper payMapper;
	//세션 객체 만들기
	@Autowired
	HttpSession session;

	@Override
	public HashMap<String, Object> addPaymentInfoSave(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			payMapper.insertPayInfoSave(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "failed");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
}