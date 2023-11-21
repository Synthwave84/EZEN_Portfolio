package com.synth.mapper;

import java.util.List;

import com.synth.domain.BoardVO;
import com.synth.domain.Criteria;

public interface BoardMapper {

	public void register(BoardVO board);

	public List<BoardVO> getList();

	public int getTotalCount(Criteria cri);

	public List<BoardVO> getListWithPage(Criteria cri);
	
	public BoardVO read(Long bno);
	
	public void readCount(Long bno);
	
	public void modify(BoardVO board); 
	
	public void delete(Long bno);
}
