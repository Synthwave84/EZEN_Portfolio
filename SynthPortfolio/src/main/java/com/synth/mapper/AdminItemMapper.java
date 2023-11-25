package com.synth.mapper;

import java.util.List;

import com.synth.domain.Criteria;
import com.synth.domain.ItemVO;

public interface AdminItemMapper {

	void item_insert(ItemVO vo);
	
	List<ItemVO> item_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
}
