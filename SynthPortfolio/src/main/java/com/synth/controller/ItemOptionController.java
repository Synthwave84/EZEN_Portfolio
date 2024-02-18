package com.synth.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.synth.dto.ItemOptionDTOList;
import com.synth.service.ItemOptionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/common/option/*")
@RequiredArgsConstructor
public class ItemOptionController {
	
	private final ItemOptionService itemOptionService;
	
	
	
	@ResponseBody
	@GetMapping("/type/{option_type_id}")
	public ResponseEntity <List<ItemOptionDTOList>> getOptionCG(@PathVariable("option_type_id")Integer option_type_id) {
		
		log.info("타입코드 작동");
		
		ResponseEntity <List<ItemOptionDTOList>> entity = null;
		
		entity = new ResponseEntity<List<ItemOptionDTOList>>
		(itemOptionService.getOptionCg(option_type_id),HttpStatus.OK);
		
		return entity;
	};
	
	@ResponseBody
	@GetMapping("/option_val/{option_cg_id}")
	public ResponseEntity< List<ItemOptionDTOList>> getOptionValue(@PathVariable("option_cg_id")Integer option_cg_id) {
		
		log.info("밸류 코드 작동");
		
		ResponseEntity< List<ItemOptionDTOList>> entity = null;
		
		entity = new ResponseEntity<List<ItemOptionDTOList>>
		(itemOptionService.getOptionValue(option_cg_id),HttpStatus.OK);
		
		return entity;
		
	}
	
	
	

	
}
