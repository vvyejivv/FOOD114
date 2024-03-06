package teamProject.food114.service;

import java.util.HashMap;

public interface BizService {
	HashMap<String, Object> addBiz(HashMap<String, Object> map);
	HashMap<String, Object> idCheck(HashMap<String, Object> map);
	HashMap<String, Object> emailCheck(HashMap<String, Object> map);
	HashMap<String, Object> searchBizList(HashMap<String, Object> map);
}