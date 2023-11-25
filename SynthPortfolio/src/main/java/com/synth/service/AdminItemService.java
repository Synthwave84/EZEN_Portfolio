package com.synth.service;

import java.util.List;

import com.synth.domain.Criteria;
import com.synth.domain.ItemVO;

public interface AdminItemService {

	void item_insert(ItemVO vo);
	
	List<ItemVO> item_list(Criteria cri);
	
	int getTotalCount(Criteria cri);
}
