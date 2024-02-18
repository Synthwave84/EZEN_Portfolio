package com.synth.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.synth.domain.CgcodeVO;
import com.synth.domain.ItemManufactureVO;
import com.synth.service.CategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/common/category/*")

public class CategoryController {

	private final CategoryService categoryService;
	
//	1차 카테고리 선택에 따른 2차 카테고리 정보를 클라이언트에 제공
//	일반주소 secondCategory?cg_prt_code=1
//	RestFull 개발문 주소 secondCatergory/1
//	주소의 일부분을 값으로 사용하고자 할 경우 {} 중괄호 사용.
	@ResponseBody
	@GetMapping("/secondCategory/{cg_prtcode}")
	public ResponseEntity<List<CgcodeVO>> secondCategory(@PathVariable("cg_prtcode") Integer cg_prtcode) throws Exception {
		
		log.info("1차 카테고리코드 : " + cg_prtcode);
		
		ResponseEntity<List<CgcodeVO>> entity = null;
		
		entity = new ResponseEntity<List<CgcodeVO>>
		(categoryService.getSecondCategoryList(cg_prtcode),HttpStatus.OK);
		
//		List<CategoryVO> list = ad.CategoryService.getSecondCategoryList(cg_prtcode)
//		list객체 -> JSON으로 변환하는 라이브러리 = Jackson-Databind 라이브러리 (pom.xml)
		
		return entity;
	}
	
	@ModelAttribute
	public void getManufactureList(Integer cg_code, Model model) {
		
		log.info("제품목록");
		List<ItemManufactureVO> manufactureList = categoryService.getManufacture(cg_code);
		model.addAttribute("manufactureList", manufactureList);
	}
	
	@ResponseBody
	@GetMapping("/manufactureCode/{cg_code}")
	public ResponseEntity <List<ItemManufactureVO>> manufacture(@PathVariable("cg_code")Integer cg_code) {
		
		log.info("선택된 카테고리 번호" + cg_code);
		
		ResponseEntity <List<ItemManufactureVO>> entity = null;
		
		entity = new ResponseEntity<List<ItemManufactureVO>>
		(categoryService.getManufacture(cg_code),HttpStatus.OK);
		
		return entity;
	};
	
}
