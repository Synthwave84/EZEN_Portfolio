package com.synth.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;

import com.synth.domain.CgcodeVO;
import com.synth.service.CategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@ControllerAdvice(basePackages = {"com.synth.controller"})
public class GlobalControllerAdvice {

	private final CategoryService categoryService;
	
	public void getFirstCategoryList(Model model) {
		log.info("1차 카테고리 테스트");
		List<CgcodeVO> firstCategoryList = categoryService.getFirstCategoryList();
		model.addAttribute("firstCategoryList", firstCategoryList);
	}
}
