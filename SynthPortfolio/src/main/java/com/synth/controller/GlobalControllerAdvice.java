package com.synth.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.synth.domain.CgcodeVO;
import com.synth.domain.OptionTypeVO;
import com.synth.dto.ItemOptionDTOList;
import com.synth.service.CategoryService;
import com.synth.service.ItemOptionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@ControllerAdvice(basePackages = {"com.synth.controller"})
public class GlobalControllerAdvice {

	private final CategoryService categoryService;
	private final ItemOptionService itemOptionService;
	@ModelAttribute
	public void getFirstCategoryList(Model model) {
		
		log.info("1차 카테고리 테스트");
		List<CgcodeVO> firstCategoryList = categoryService.getFirstCategoryList();
		model.addAttribute("firstCategoryList", firstCategoryList);
	}
	
	@ModelAttribute
	public void getOptionList(Model model) {
		
		List<ItemOptionDTOList> optionList = itemOptionService.getOptionList();
		model.addAttribute("optionList", optionList);
		log.info("옵션정보" + optionList);
	};
	
	@ModelAttribute 
	public void getOptionType(Model model) {
		
		List<OptionTypeVO> optionType = itemOptionService.getOptionType();
		model.addAttribute("optionType", optionType);
		log.info("옵션타입" + optionType);
	}
	
}
