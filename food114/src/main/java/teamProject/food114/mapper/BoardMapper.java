package teamProject.food114.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Biz;
import teamProject.food114.model.Board;

@Mapper
public interface BoardMapper {

	// select * where code=3 이벤트 목록 전체 호출
	List<Board> selectEventList(HashMap<String, Object> map);

	// 공지사항 목록
	List<Board> selectBoardList(HashMap<String, Object> map);

	// 게시글 개수
	int selectBoardListCnt(HashMap<String, Object> map);

	// 게시글 상세보기
	Board selectBoardInfo(HashMap<String, Object> map);

	// 이벤트 기간 종료시 update endYn=Y
	void updateEndYn();

	// 이벤트 상세보기
	Board selectEventView(HashMap<String, Object> map);
	// 가게 이벤트 상세보기
	Board selectShopEvent(HashMap<String, Object> map);
	
	
	// biz 이벤트 목록 select
	List<Board> selectBizEventList(HashMap<String, Object> map);

	// 사업자 이벤트 목록 표출
	List<Board> selectBizEvent(HashMap<String, Object> map);
	
	Board selectBizEventView(HashMap<String, Object> map);
	
	void insertBizEventFile(HashMap<String, Object> map);
	
	void updateBizEventFile(HashMap<String, Object> map);
	
	void updateBizEventBoard(HashMap<String, Object> map);
	
	Board selectBizEventFileYn(HashMap<String, Object> map);
	
	List<Board> selectBoardListLimit(HashMap<String, Object> map);
} 