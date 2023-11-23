package com.synth.service;

import org.springframework.stereotype.Service;

import com.synth.domain.ItemVO;
import com.synth.mapper.AdminItemMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminItemServiceImpl implements AdminItemService {
	private final AdminItemMapper adminItemMapper;

	@Override
	public void item_insert(ItemVO vo) {
		adminItemMapper.item_insert(vo);
	}


	
	
	
}
