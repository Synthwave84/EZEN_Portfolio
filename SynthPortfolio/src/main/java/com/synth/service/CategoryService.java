package com.synth.service;

import java.util.List;

import com.synth.domain.CgcodeVO;

public interface CategoryService {

	List<CgcodeVO> getFirstCategoryList();
	List<CgcodeVO> getSecondCategoryList(Integer cg_prtcode);
	CgcodeVO get(Integer cg_code);
	
}
