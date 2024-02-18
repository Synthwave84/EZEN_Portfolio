package com.synth.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.synth.domain.Criteria;
import com.synth.domain.ReviewVO;

public interface ReviewService {

void review_insert(ReviewVO vo);
	
	void review_modify(ReviewVO vo);
	
//	검색필드는 사용하지 않음.
	List<ReviewVO> list(@Param("item_no")Integer item_no, @Param("cri")Criteria cri);
	
	int listCount(Integer item_no);
	
	void delete(Long rev_num);
}
