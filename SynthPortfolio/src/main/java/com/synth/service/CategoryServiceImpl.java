package com.synth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synth.domain.CgcodeVO;
import com.synth.domain.ItemManufactureVO;
import com.synth.mapper.CategoryMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

	private final CategoryMapper categoryMapper;

	
	@Override
	public List<CgcodeVO> getFirstCategoryList() {
		// TODO Auto-generated method stub
		return categoryMapper.getFirstCategoryList();
	}
	
	@Override
	public List<CgcodeVO> getSecondCategoryList(Integer cg_prtcode) {
		
		return categoryMapper.getSecondCategoryList(cg_prtcode);
	}

	

	@Override
	public CgcodeVO get(Integer cg_code) {
		// TODO Auto-generated method stub
		return categoryMapper.get(cg_code);
	}

	@Override
	public List<ItemManufactureVO> getManufacture(Integer cg_code) {
		
		return categoryMapper.getManufacture(cg_code);
	}
	
	
}
