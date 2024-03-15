package teamProject.food114.service;

import java.util.HashMap;

public interface PayService {
	//결제 내용 추가
	HashMap<String, Object> addPaymentInfoSave(HashMap<String, Object> map);
}