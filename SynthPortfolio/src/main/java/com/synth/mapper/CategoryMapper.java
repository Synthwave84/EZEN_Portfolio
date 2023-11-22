package com.synth.mapper;

import java.util.List;

import com.synth.domain.CgcodeVO;

public interface CategoryMapper {

	List<CgcodeVO> getFirstCategoryList();
	List<CgcodeVO> getSecondCategoryList(Integer cg_prtcode);
	CgcodeVO get(Integer cg_code);
}
