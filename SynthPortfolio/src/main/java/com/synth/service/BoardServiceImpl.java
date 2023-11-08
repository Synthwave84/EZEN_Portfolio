package com.synth.service;

import org.springframework.stereotype.Service;

import com.synth.domain.BoardVO;
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
}
