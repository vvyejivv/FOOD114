package teamProject.food114.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Biz;

@Mapper
public interface BizMapper {
	void insertBiz(HashMap<String, Object> map); // 사업자 회원가입
	Biz selectBizId(HashMap<String, Object> map); // 사업자 아이디 체크
}