package com.synth.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.synth.domain.Criteria;
import com.synth.domain.ItemOptionVO;
import com.synth.domain.ItemVO;

public interface AdminItemMapper {

	void item_insert(ItemVO vo);
	void item_option_insert(
			@Param("option_type_id")Integer option_type_id,
			@Param("option_cg_id") Integer option_cg_id,
			@Param("option_id") Integer option_id,
			@Param("itemOptionVO") ItemOptionVO op_vo
			);
	
	List<ItemVO> item_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	void modify_checked_item(
			@Param("item_no") Integer item_num,
			@Param("item_price") Integer item_price,
			@Param("item_buy") String item_buy
			);
	
	ItemVO item_edit(Integer item_no);
	
	void item_edit_success(ItemVO vo);
	
	void item_delete(Integer item_no);
}
