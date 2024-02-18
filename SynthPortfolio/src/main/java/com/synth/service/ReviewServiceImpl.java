package com.synth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synth.domain.Criteria;
import com.synth.domain.ReviewVO;
import com.synth.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	
	private final ReviewMapper reviewMapper;
	
	@Override
	public void review_insert(ReviewVO vo) {
		
		reviewMapper.review_insert(vo);
	}

	@Override
	public void review_modify(ReviewVO vo) {
		
		reviewMapper.review_modify(vo);
	}

	@Override
	public List<ReviewVO> list(Integer item_no, Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.list(item_no, cri);
	}

	@Override
	public int listCount(Integer item_no) {
		// TODO Auto-generated method stub
		return reviewMapper.listCount(item_no);
	}

	@Override
	public void delete(Long rev_num) {
		reviewMapper.delete(rev_num);
		
	}

	
}
