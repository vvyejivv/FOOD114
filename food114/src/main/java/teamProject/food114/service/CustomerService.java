package teamProject.food114.service;

import java.util.HashMap;

public interface CustomerService {
	// 회원가입
	HashMap<String, Object> addConsumer(HashMap<String, Object> map);

	// 아이디 중복체크
	HashMap<String, Object> searchUserId(HashMap<String, Object> map);

	// 이메일 중복체크
	HashMap<String, Object> searchEmail(HashMap<String, Object> map);

	// 로그인 아이디 확인
	HashMap<String, Object> searchLoginUserId(HashMap<String, Object> map);

	// 마이페이지 내정보 불러오기
	HashMap<String, Object> searchMyInfo(HashMap<String, Object> map);

	// 고객 주소 리스트 불러오기
	HashMap<String, Object> searchUserAddrList(HashMap<String, Object> map);

	// myInfo 변경 : 이름, 별명, 연락처, 이메일
	HashMap<String, Object> editMyInfo(HashMap<String, Object> map);
	
	// myInfo 변경 : 비밀번호(pwd)
	HashMap<String, Object> editPwd(HashMap<String, Object> map);
	
	// myInfo - my주소지 관리 - 주소지 상세보기
	HashMap<String, Object> searchMyInfoAddr(HashMap<String, Object> map);
	
	//마이페이지 - 주문/리뷰 - 주문내역리스트
	HashMap<String, Object> searchMyOrderList(HashMap<String, Object> map);
	
	// myInfo - my주소지 관리 - 기본주소지 설정
	HashMap<String, Object> editAddrList(HashMap<String, Object> map);
}