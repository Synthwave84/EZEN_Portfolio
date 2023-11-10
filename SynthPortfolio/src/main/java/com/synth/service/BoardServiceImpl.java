package com.synth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synth.domain.BoardVO;
import com.synth.domain.Criteria;
import com.synth.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private final BoardMapper boardMapper;

	@Override
	public void register(BoardVO board) {
		
		boardMapper.register(board);
		
	}

	@Override
	public List<BoardVO> getList() {
		
		return boardMapper.getList();
	}

	@Override
	public int getTotalCount(Criteria cri) {
	
		return boardMapper.getTotalCount(cri);
	}

	@Override
	public List<BoardVO> getListWithPage(Criteria cri) {
		
		return boardMapper.getListWithPage(cri);
	}

	@Override
	public BoardVO read(Long bno) {
		boardMapper.readCount(bno);
		return boardMapper.read(bno);
		
	}


	@Override
	public void delete(Long bno) {
		boardMapper.delete(bno);
	}

	

	
}
