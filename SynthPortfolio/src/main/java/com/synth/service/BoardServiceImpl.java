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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> getListWithPage(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO get(Long board_no) {
		// TODO Auto-generated method stub
		return boardMapper.get(board_no);
	}
}
