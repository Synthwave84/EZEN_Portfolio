package com.synth.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.synth.domain.Criteria;
import com.synth.domain.MemberVO;
import com.synth.domain.ReviewVO;
import com.synth.dto.PageDTO;
import com.synth.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequiredArgsConstructor
@RequestMapping("/member/review/*")
@Log4j
public class ReviewController {
	
	private final ReviewService reviewService;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> review_insert(@RequestBody ReviewVO vo, HttpSession session) throws Exception {
		
		String member_id = ((MemberVO)session.getAttribute("loginStatus")).getMember_id();
		vo.setMember_id(member_id);
		log.info("리뷰" + vo );
		
		ResponseEntity<String> entity= null;
		
		reviewService.review_insert(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/list/{item_no}/{page}")
	public ResponseEntity<Map<String,Object>> list(@PathVariable("item_no") Integer item_no, @PathVariable("page") Integer page) throws Exception {
		
		ResponseEntity<Map<String,Object>> entity= null;
		Map<String,Object> map = new HashMap<String, Object>();
		
		Criteria cri = new Criteria();
		cri.setAmount(3);
		cri.setPageNum(page);
		
		List<ReviewVO> list = reviewService.list(item_no, cri);
		
		int listCount = reviewService.listCount(item_no);
		PageDTO pageMaker = new PageDTO(cri, listCount);
		
		map.put("list" , list);
		map.put("pageMaker", pageMaker);
		
		entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		return entity;
	}
	
	@DeleteMapping("/delete/{rev_num}")
	public ResponseEntity<String> delete (@PathVariable("rev_num") Long rev_num) throws Exception {
		ResponseEntity<String> entity = null;
		reviewService.delete(rev_num);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	@PutMapping(value= "/modify", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> review_modify(@RequestBody ReviewVO vo, HttpSession session) throws Exception {
		
		String member_id = ((MemberVO)session.getAttribute("loginStatus")).getMember_id();
		vo.setMember_id(member_id);
		log.info("리뷰 : " + vo );
		
		ResponseEntity<String> entity = null;
		reviewService.review_modify(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}

}
