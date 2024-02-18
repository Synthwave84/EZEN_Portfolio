package com.synth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synth.domain.Criteria;
import com.synth.domain.ItemOptionVO;
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
	public void item_option_insert(
			ItemOptionVO op_vo, 
			List<Integer> option_type_id_arr, 
			List<Integer> option_cg_id_arr,
			List<Integer> option_id_arr) {
		
		for(int i=0; i<option_type_id_arr.size(); i++) {
			adminItemMapper.item_option_insert(option_type_id_arr.get(i), option_cg_id_arr.get(i), option_id_arr.get(i), op_vo);
		}
		
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

	@Override
	public void modify_checked_item(List<Integer> item_no_arr, List<Integer> item_price_arr, List<String> item_buy_arr) {
		
		for(int i=0; i<item_no_arr.size(); i++) {
			adminItemMapper.modify_checked_item(item_no_arr.get(i), item_price_arr.get(i), item_buy_arr.get(i));
		}
		
	}

	@Override
	public ItemVO item_edit(Integer item_no) {
		
		return adminItemMapper.item_edit(item_no);
	}

	@Override
	public void item_edit_success(ItemVO vo) {
		adminItemMapper.item_edit_success(vo);
		
	}

	@Override
	public void item_delete(Integer item_no) {
		adminItemMapper.item_delete(item_no);
		
	}



	

	


	
	
	
}
