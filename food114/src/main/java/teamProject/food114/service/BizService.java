package teamProject.food114.service;

import java.util.HashMap;

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
	
	HashMap<String, Object> addBizFile(HashMap<String, Object> map);
}