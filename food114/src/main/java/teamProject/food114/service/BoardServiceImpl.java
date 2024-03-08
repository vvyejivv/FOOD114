package teamProject.food114.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject.food114.mapper.BoardMapper;
import teamProject.food114.model.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;

	@Override
	public HashMap<String, Object> searchEventList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// TODO Auto-generated method stub
		try {
			List<Board> list = boardMapper.selectEventList(map);
			boardMapper.updateEndYn();
			resultMap.put("list", list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchEvent(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap.put("board", boardMapper.selectEventView(map));
			resultMap.put("result","success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result","failed");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> list = boardMapper.selectBoardList(map);

		// 댓글 개수
		int cnt = boardMapper.selectBoardListCnt(map);
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);

		resultMap.put("result", "success");
		return resultMap;
	}

}