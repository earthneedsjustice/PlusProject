package com.project.plus.mapper;

import java.util.List;
import java.util.Map;

import com.project.plus.domain.BoardVO;

public interface BoardMapper {
	public int insertBoard(BoardVO board);
	public BoardVO getBoard(int boardNum);
	public List<BoardVO> getBoardList(int clubNum); //clubNum int 받아야됨
	public List<BoardVO> getMoreContents(Map<String,Integer> map);
	public int getContentCount(int BoardNum);
	public void updateBoard(BoardVO board);
	public void deleteBoard(int BoardNum);

	
	
}
