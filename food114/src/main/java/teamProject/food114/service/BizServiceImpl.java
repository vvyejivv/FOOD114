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
	public HashMap<String, Object> searchLoginBizId(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			Biz biz = bizMapper.selectBizId(map);
			if (biz == null) {
				resultMap.put("message", "아이디가 존재하지 않습니다.");
			} else {				
				//비밀번호 체크
				String pwd = (String)map.get("pwd");
				if(biz.getPwd().equals(pwd)) {
					//로그인 성공
					resultMap.put("pwd", "pwdSuccess");
					
					//세션 생성
					session.setAttribute("bizId", biz.getBizId());
					
				}else {
					//로그인 실패(패스워드가 다른 경우)
					resultMap.put("pwd","fail");
					resultMap.put("message","비밀번호가 일치하지 않습니다.");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
}