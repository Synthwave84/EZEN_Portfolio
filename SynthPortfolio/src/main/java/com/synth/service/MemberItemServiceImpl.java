package com.synth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synth.domain.Criteria;
import com.synth.domain.ItemVO;
import com.synth.mapper.MemberItemMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberItemServiceImpl implements MemberItemService {

	private final MemberItemMapper userItemMapper;

	@Override
	public List<ItemVO> item_list(Integer cg_code, Criteria cri) {
		// TODO Auto-generated method stub
		return userItemMapper.item_list(cg_code, cri);
	}

	@Override
	public int getTotalCount(Integer cg_code) {
		// TODO Auto-generated method stub
		return userItemMapper.getTotalCount(cg_code);
	}

	@Override
	public ItemVO item_detail(Integer item_no) {
		// TODO Auto-generated method stub
		return userItemMapper.item_detail(item_no);
	}
	
	
}
