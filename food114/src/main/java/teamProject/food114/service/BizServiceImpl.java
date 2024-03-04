package teamProject.food114.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import teamProject.food114.mapper.BizMapper;

@Service
public class BizServiceImpl implements BizService {
	
	@Autowired
	BizMapper bizMapper;
	

	@Autowired
	HttpSession session;
	
	
	@Override
	public HashMap<String, Object> addBiz(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			bizMapper.insertBiz(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}