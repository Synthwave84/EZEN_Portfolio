package com.synth.service;

import java.util.List;

import com.synth.domain.CgcodeVO;
import com.synth.domain.ItemManufactureVO;

public interface CategoryService {

	List<CgcodeVO> getFirstCategoryList();
	List<CgcodeVO> getSecondCategoryList(Integer cg_prtcode);
	List<ItemManufactureVO> getManufacture(Integer cg_code);
	CgcodeVO get(Integer cg_code);
}
