package teamProject.food114.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.BizMapper;
import teamProject.food114.model.Biz;

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
	
	@Override
	public HashMap<String, Object> idCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Biz biz = bizMapper.idCheck(map);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if(biz == null) {
			// 아이디가 없는 경우
			resultMap.put("result", "success");
			resultMap.put("message", "This is an available ID.\nDo you want to use it?");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "This is a duplicate ID.");
		}
		return resultMap;
	}
}