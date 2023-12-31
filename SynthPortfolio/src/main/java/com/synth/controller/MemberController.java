package com.synth.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.synth.domain.MemberVO;
import com.synth.dto.LoginDTO;
import com.synth.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@RequiredArgsConstructor
@Controller
public class MemberController {

	private final MemberService memberService;
//	암호화 작업용 인터페이스 호출
	private final PasswordEncoder passwordEncoder;
	
//	1) join 주소 연결
	@GetMapping("/join")
	public void join() {
	log.info("join 메소드 호출");
	} // Passed
	
//	2)회원 정보 저장 
	@PostMapping("/join")
	public String join(MemberVO vo, RedirectAttributes rttr) throws Exception {
		log.info("회원정보 :" + vo);
		
		vo.setMember_password(passwordEncoder.encode(vo.getMember_password()));
		log.info("암호화 처리 된 비밀번호" + vo.getMember_password());
		memberService.join(vo);
		return "redirect:/member/join";
	} // Passed
	
//	3) 회원가입시 아이디 중복체크 작업. 
//		join.jsp의 A.01과 연계
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
	
//	4) 로그인 폼 페이지.
	@GetMapping("/login")
	public void login() {
	
	};
	
//	5)로그인 작업
	@PostMapping("/login") 
	public String login(LoginDTO dto, HttpSession session, RedirectAttributes rttr) {
		log.info(dto);
		MemberVO db_vo = memberService.login(dto.getMember_id());
		
		String msg = "";
		String url = "";
		
		if(db_vo != null) {
			
//			db상의 암호화 된 비밀번호와 사용자가 입력한 암호화 되지 않은 비밀번호를 비교하여 일치 하는지 여부를 판단 하는 구문
			if(passwordEncoder.matches(dto.getMember_password(), db_vo.getMember_password())) {
				session.setAttribute("loginStatus", db_vo);
				url ="/board/register"; 
			}else {
//				로그인 폼 주소
				url="/member/login";
				msg="비밀번호가 잘못 되었습니다";
//				로그인 폼 jsp파일에서 사용하기 위한 코드
				rttr.addFlashAttribute("msg", msg);
			}
		}else{
//		 	아이디 일치하지 않을 시 
			url ="/member/login";
			msg ="아이디가 잘못 되었습니다.";
			rttr.addFlashAttribute("msg",msg);
					}
		log.info("로그인 성공");
		return "redirect:" + url;
	}
	
	
}
