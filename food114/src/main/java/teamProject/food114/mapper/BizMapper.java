package teamProject.food114.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Area;
import teamProject.food114.model.Biz;
import teamProject.food114.model.BizFile;
import teamProject.food114.model.Board;
import teamProject.food114.model.Category;


@Mapper
public interface BizMapper {
	void insertBiz(HashMap<String, Object> map); // 사업자 회원가입
	Biz selectBizId(HashMap<String, Object> map); // 사업자 아이디 체크
	Biz idCheck(HashMap<String, Object> map); // 사업자 아이디 중복확인
	Biz emailCheck(HashMap<String, Object> map); // 사업자 이메일 중복확인
	List<Biz> selectBizList(HashMap<String, Object> map); // 식당 리스트 조회
	List<Area> selectSiList(HashMap<String, Object> map); // 시 리스트 조회
	List<Area> selectGuList(HashMap<String, Object> map); // 구 리스트 조회
	List<Area> selectDongList(HashMap<String, Object> map); // 동 리스트 조회



	Biz selectBizInfo(HashMap<String, Object> map); // 사업자 정보 조회
	void insertBizFile(HashMap<String, Object> map); // 파일 업로드
	BizFile selectBizFile(HashMap<String, Object> map); // 파일 불러오기
	void updateBizFile(HashMap<String, Object> map); // 파일 변경
	
	
	List<Category> selectCategory(HashMap<String,Object> map); // 카테고리 전체조회
	BizFile selectWaitBizFile(HashMap<String, Object> map); // 대기상태 파일 불러오기
	void updateBizInfo(HashMap<String,Object> map); // 사업자 정보 업데이트
	void updateBizFileCompleteToDelete(HashMap<String,Object> map); // bizFile complete->delete
	void updateBizFileWaitToComplete(HashMap<String,Object> map); // bizFile wait->complete
	

	List<Biz> selectBizEventList(HashMap<String,Object> map);	// biz별 이벤트 목록
	

	List<Biz> selectAreaList(HashMap<String, Object> map); // 시구동 검색 식당 리스트 조회
}