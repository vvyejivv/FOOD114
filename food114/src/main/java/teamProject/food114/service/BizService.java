package teamProject.food114.service;

import java.util.HashMap;
import java.util.List;

import teamProject.food114.model.Category;

public interface BizService {
	HashMap<String, Object> addBiz(HashMap<String, Object> map);

	// 사업자 로그인 아이디 확인
	HashMap<String, Object> searchLoginBizId(HashMap<String, Object> map);

	HashMap<String, Object> idCheck(HashMap<String, Object> map);

	HashMap<String, Object> emailCheck(HashMap<String, Object> map);

	HashMap<String, Object> searchBizList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchSiList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchGuList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchDongList(HashMap<String, Object> map);
	//가게 정보 확인
	HashMap<String, Object> searchShopInfo(HashMap<String, Object> map);

	
	HashMap<String, Object> searchBizInfo(HashMap<String, Object> map);
	
	// 대기상태의 파일 조회	
	HashMap<String, Object> searchBizFile(HashMap<String, Object> map);
	HashMap<String, Object> addBizFile(HashMap<String, Object> map);
	
	// 은행,카테고리,이메일 불러오기
	HashMap<String, Object> searchSelect(HashMap<String, Object> map);
	
	// 사업자 정보 수정시
	HashMap<String, Object> editBizInfo(HashMap<String, Object> map);
	
	HashMap<String, Object> searchAreaList(HashMap<String, Object> map);
	
	// Biz 이벤트 목록 출력
	HashMap<String, Object> searchBizEventList(HashMap<String, Object> map);
}