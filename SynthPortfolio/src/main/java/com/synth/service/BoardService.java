package com.synth.service;

import java.util.List;

import com.synth.domain.BoardVO;
import com.synth.domain.Criteria;

public interface BoardService {

//	게시글 등록 작업.
	public void register(BoardVO board);
	
//	페이지에 보여줄 게시글 목록 작업
	public List<BoardVO> getList();
//	총 데이터 갯수 작업
	public int getTotalCount(Criteria cri);
//	페이징 기넝 구현을 위한 작업
	public List<BoardVO> getListWithPage(Criteria cri);
	
//	게시물 보기 또는 수정 폼= 1개
	public BoardVO get(Long board_no);
	
}
