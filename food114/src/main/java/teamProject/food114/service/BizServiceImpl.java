package teamProject.food114.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.BizMapper;
import teamProject.food114.mapper.CodeMapper;
import teamProject.food114.model.Area;
import teamProject.food114.model.Biz;
import teamProject.food114.model.BizFile;
import teamProject.food114.model.Category;

@Service
public class BizServiceImpl implements BizService {

	@Autowired
	BizMapper bizMapper;

	@Autowired
	CodeMapper codeMapper;

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
				// 비밀번호 체크
				String pwd = (String) map.get("pwd");
				if (biz.getPwd().equals(pwd)) {
					// 로그인 성공
					resultMap.put("pwd", "pwdSuccess");

					// 세션 생성
					session.setAttribute("sessionBizId", biz.getBizId());

				} else {
					// 로그인 실패(패스워드가 다른 경우)
					resultMap.put("pwd", "fail");
					resultMap.put("message", "비밀번호가 일치하지 않습니다.");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "error");
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> idCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Biz biz = bizMapper.idCheck(map);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if (biz == null) {
			// 아이디가 없는 경우
			resultMap.put("result", "success");
			resultMap.put("message", "This is an available ID.\nDo you want to use it?");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "This is a duplicate ID.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> emailCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Biz email = bizMapper.emailCheck(map);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if (email == null) {
			// 아이디가 없는 경우
			resultMap.put("result", "success");
			resultMap.put("message", "This is an available Email.\nDo you want to use it?");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "This is a duplicate Email.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchBizList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Biz> list = bizMapper.selectBizList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchSiList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Area> siList = bizMapper.selectSiList(map);
			resultMap.put("siList", siList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchGuList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Area> guList = bizMapper.selectGuList(map);
			resultMap.put("guList", guList);

			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchDongList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Area> dongList = bizMapper.selectDongList(map);
			resultMap.put("dongList", dongList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 가게 정보 확인
	@Override
	public HashMap<String, Object> searchShopInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Biz biz = bizMapper.idCheck(map);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap.put("bizInfo", biz);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchBizInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Biz biz = bizMapper.selectBizInfo(map);
		BizFile bizFile = bizMapper.selectBizFile(map);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap.put("bizInfo", biz);
			resultMap.put("bizFile", bizFile);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> addBizFile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			if (bizMapper.selectWaitBizFile(map) == null) {
				bizMapper.insertBizFile(map);
			} else {
				bizMapper.updateBizFile(map);
				bizMapper.insertBizFile(map);
			}
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchSelect(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("categoryList", bizMapper.selectCategory(map));
		resultMap.put("bankList", codeMapper.selectBank(map));
		resultMap.put("emailList", codeMapper.selectEmail(map));
		return resultMap;

	}

	@Override
	public HashMap<String, Object> searchBizFile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("bizFile", bizMapper.selectWaitBizFile(map));
		return resultMap;
	}

	@Override
	public HashMap<String, Object> editBizInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			bizMapper.updateBizInfo(map);
			String imgFlg = (String)map.get("imgFlg");
			if(imgFlg.equals("true")) {
				bizMapper.updateBizFileCompleteToDelete(map);
				bizMapper.updateBizFileWaitToComplete(map);	
			}					
			resultMap.put("result", "success");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "failed");
		}
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> searchAreaList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Biz> areaRestList = bizMapper.selectAreaList(map);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap.put("areaRestList", areaRestList);
			resultMap.put("result", "success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchBizEventList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap.put("list", bizMapper.selectBizEventList(map));			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
}