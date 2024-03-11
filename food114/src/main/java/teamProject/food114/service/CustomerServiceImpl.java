package teamProject.food114.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.CustomerMapper;
import teamProject.food114.model.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerMapper customerMapper;
	//세션 객체 만들기
	@Autowired
	HttpSession session;

	@Override
	public HashMap<String, Object> addConsumer(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();

		try {
			customerMapper.insertConsumer(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "failed");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchUserId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			Customer customer = customerMapper.selectUserID(map);
			if (customer == null) {
				resultMap.put("result", "success");
				
			} else {				
				resultMap.put("result", "dup");
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchEmail(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			Customer customer = customerMapper.selectEmail(map);
			if (customer == null) {
				resultMap.put("result", "success");
			} else {				
				resultMap.put("result", "dup");
			}
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
	//로그인 : 아이디 비밀번호 확인
	@Override
	public HashMap<String, Object> searchLoginUserId(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			Customer customer = customerMapper.selectUserID(map);
			if (customer == null) {
				resultMap.put("message", "아이디가 존재하지 않습니다.");
			} else {				
				//비밀번호 체크
				String pwd = (String)map.get("pwd");
				if(customer.getPwd().equals(pwd)) {
					//로그인 성공
					resultMap.put("pwd", "pwdSuccess");
					
					//세션 생성
					session.setAttribute("sessionId", customer.getUserId());
					session.setAttribute("userGrade", customer.getGrade());
					
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

	// 마이페이지 내정보 불러오기 : 수정중
	@Override
	public HashMap<String, Object> searchMyInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			Customer customer = customerMapper.selectUserID(map);
			resultMap.put("result", "success");			
			resultMap.put("info", customer);			
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
}