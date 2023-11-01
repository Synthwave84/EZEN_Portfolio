package com.synth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.synth.domain.MemberVO;
import com.synth.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@RequiredArgsConstructor
@Controller
public class MemberController {

	private final MemberService memberService;
	
//	join 주소 연결
	@GetMapping("/join")
	public void join() {
	log.info("<< join 메소드 호출 >>");
	}
	
//	회원 정보 저장
	@PostMapping("/join")
	public String join(MemberVO vo) {
		log.info("회원정보 :" + vo);
		memberService.join(vo);
		return "";
	}
}
