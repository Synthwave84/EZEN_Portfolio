package com.synth.service;

import java.util.List;

import com.synth.domain.Criteria;
import com.synth.domain.ItemOptionVO;
import com.synth.domain.ItemVO;

public interface AdminItemService {

	void item_insert(ItemVO vo);
	void item_option_insert(
			ItemOptionVO op_vo,
			List<Integer> option_type_id,
			List<Integer> option_cg_id,
			List<Integer> option_id
			);
	
	List<ItemVO> item_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	void modify_checked_item(
			List<Integer> item_no_arr,
			List<Integer> item_price_arr,
			List<String> item_buy_arr
			);
	
	ItemVO item_edit(Integer item_no);
	
	void item_edit_success(ItemVO vo);
	
	void item_delete(Integer item_no);
}
