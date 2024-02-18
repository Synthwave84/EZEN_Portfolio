package com.synth.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.synth.domain.Criteria;
import com.synth.domain.ItemVO;

public interface MemberItemService {
	
	List<ItemVO> item_list(@Param("cg_code")Integer cg_code, @Param("cri")Criteria cri);
	
	int getTotalCount(Integer cg_code);
	
	ItemVO item_detail(Integer item_no);

}
