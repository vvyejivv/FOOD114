package teamProject.food114.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamProject.food114.model.Board;

@Mapper
public interface BoardMapper {
	// 공지사항 목록
		List<Board> selectBoardList(HashMap<String, Object> map);
		
	// 게시글 개수
	int selectBoardListCnt(HashMap<String, Object> map);
}