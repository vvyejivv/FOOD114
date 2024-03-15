package teamProject.food114.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.CustomerMapper;
import teamProject.food114.model.Addr;
import teamProject.food114.model.Customer;
import teamProject.food114.model.Order;

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
					
					if(!customer.getUseYn().equals("N")&&customer.getLeaveTime()==null) {
						//세션 생성
						resultMap.put("status", "success");
						session.setAttribute("sessionId", customer.getUserId());
						session.setAttribute("userGrade", customer.getGrade());
					} 
					if(customer.getUseYn().equals("N")) {
						resultMap.put("status", "idle");
						resultMap.put("message", "아이디가 현재 휴면상태입니다.");
					}
					if(customer.getLeaveTime()!=null) {
						resultMap.put("status", "leave");
						resultMap.put("message", "탈퇴된 회원입니다.");
					}
					
					
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

	// 마이페이지 내정보 불러오기 
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

	@Override
	public HashMap<String, Object> searchUserAddrList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			resultMap.put("addrList", customerMapper.selectUserAddr(map));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return resultMap;
	}
	
	// myInfo 변경 : 이름, 별명, 연락처, 이메일
	@Override
	public HashMap<String, Object> editMyInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			customerMapper.updateMyInfo(map);
			resultMap.put("result", "success");			
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	// pwd 변경(myInfo)
	@Override
	public HashMap<String, Object> editPwd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			customerMapper.updatePwd(map);
			resultMap.put("result", "success");			
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	// myInfo - my주소지 관리 - 주소지 상세보기
	@Override
	public HashMap<String, Object> searchMyInfoAddr(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			List<Addr> Addr = customerMapper.selectMyInfoAddr(map);
			resultMap.put("result", "success");			
			resultMap.put("list", Addr);			
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
	//마이페이지 - 주문/리뷰 - 주문내역리스트
	@Override
	public HashMap<String, Object> searchMyOrderList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Order> orderList = customerMapper.selectMyOrderList(map);
			resultMap.put("orderList", orderList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> editUserLeave(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String,Object> resultMap=new HashMap<>();
		try {
			customerMapper.updateUserLeave(map);
			resultMap.put("result","success");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result","failed");
		}
		return resultMap;
	}
}