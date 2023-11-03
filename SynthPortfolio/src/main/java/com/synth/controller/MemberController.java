package com.synth.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
//	1) join 주소 연결
	@GetMapping("/join")
	public void join() {
	log.info("join 메소드 호출");
	} // Passed
	
//	2)회원 정보 저장 
	@PostMapping("/join")
	public String join(MemberVO vo) {
		log.info("회원정보 :" + vo);
		memberService.join(vo);
		return "";
	} // Passed
	
//	3) 회원가입시 아이디 중복체크 작업.
	@GetMapping("/isIdInUse")
	public ResponseEntity<String> idCheck(String member_id) throws Exception {
//		로그 작업
		log.info("아이디 : " + member_id);

		ResponseEntity<String> entity = null;
		
//		아이디 중복 체크 작업.
		String isIdInUse = "";
//		사용자가 입력한 ID값이 데이터베이스 상에 존재하는가?
		if(memberService.idCheck(member_id) != null) {
//			정보가 존재하여 null이 아닐 시 = 사용 불가. 
			isIdInUse = "false";
			} else {
//			아이디에 대한 정보가 없어 null일 경우 중복아이디가 없으므로 사용이 가능.
			isIdInUse = "true";
			}
//		만일 true가 반환되어 통과할 경우 HttpStatus 코드 OK를 주어 다음으로 넘어갈 수 있다.
		entity = new ResponseEntity<String>(isIdInUse, HttpStatus.OK);
		
		return entity;
	}
	
	
	
}
