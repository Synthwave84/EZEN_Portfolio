package com.synth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synth.domain.Criteria;
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

	@Override
	public List<ItemVO> item_list(Criteria cri) {
		// TODO Auto-generated method stub
		return adminItemMapper.item_list(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adminItemMapper.getTotalCount(cri);
	}


	
	
	
}
