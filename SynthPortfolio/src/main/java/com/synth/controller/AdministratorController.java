package com.synth.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.synth.domain.AdminVO;
import com.synth.service.AdministratorService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/*")
@RequiredArgsConstructor
public class AdministratorController {
	private final AdministratorService administratorService;
	private final PasswordEncoder passwordEncoder;
	
	@GetMapping("/admin/login")
	public String adminLogin() {
	log.info("괸리자 로그인 페이지");
	return "/admin/ad_Login";
	}
	
//	관리자 로그인 인증
	@PostMapping("/admin_login") 
		public String admin_login(AdminVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		
			log.info("관리자로그인:" + vo);
		
		AdminVO db_vo = administratorService.admin_login(vo.getAdministrator_id());
		
		String url = "";
		String msg = "";
		
//		아이디 존재 여부 확인
		// 아이디가 일치하면
				if(db_vo != null) {
					// 사용자가 입력한 비밀번호(평문텍스트)와 db에서 가져온 암호화된 비밀번호 일치여부 검사
					if(passwordEncoder.matches(vo.getAdministrator_pw(), db_vo.getAdministrator_pw())) {
						// 로그인 성공결과로 서버측의 메모리를 사용하는 세션형태작업
						session.setAttribute("adminStatus", db_vo);
						
						//로그인 시간 업데이트
						administratorService.login_time(vo.getAdministrator_id());
						
						url = "/admin/admin_menu"; // 관리자 메뉴페이지 주소
						log.info("로그인 성공");
					}else {
						url = "/admin/ad_Login"; // 로그인 폼주소
						msg = "failPW";
						rttr.addFlashAttribute("msg", msg); // 로그인 폼 jsp파일에서 사용목적
					}
				}else {
					// 아이디가 일치하지 않으면
					url = "/admin/login"; // 로그인 폼주소
					msg = "failID";
					rttr.addFlashAttribute("msg", msg); // 로그인 폼 jsp파일에서 사용목적
				}
				
				
				return "redirect:" + url;
			}
//	로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/admin/";
	}
	
//	관리자용 메뉴 페이지
	@GetMapping("/admin_menu")
	public void admin_menu() {
		
	}
}
