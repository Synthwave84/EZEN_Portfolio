package com.synth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.synth.domain.BoardVO;
import com.synth.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

//1) Controller 작업
@Controller
//2) 리퀘스트 매핑 작업.
@RequestMapping("/board/*")
//3) lombok 컨스트럭터 작업
@RequiredArgsConstructor
//4) 로거 작업
@Log4j
public class BoardController {
	private final BoardService boardService;
	
//	1) 게시글 등록 폼 주소 연결
	@GetMapping("/register")
	public void register() {
		log.info("레지스터 콜");
	}
	
//	2) 글 등록 작업
	@PostMapping("/register")
	public String register(BoardVO board) {
		log.info("레지스터 등록 데이터 : " + board);
		boardService.register(board);
		
		return "/";
	}
	
	
}
