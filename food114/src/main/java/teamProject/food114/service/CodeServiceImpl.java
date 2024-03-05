package teamProject.food114.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.CodeMapper;

@Service
public class CodeServiceImpl implements CodeService {

	@Autowired	
	CodeMapper codeMapper;
	
	@Override
	public HashMap<String, Object> searchEmail(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			resultMap.put("list", codeMapper.selectEmail(map));			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return resultMap;
	}
}