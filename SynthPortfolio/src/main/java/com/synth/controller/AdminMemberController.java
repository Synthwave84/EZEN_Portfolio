package com.synth.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.synth.domain.BoardVO;
import com.synth.domain.Criteria;
import com.synth.domain.MemberVO;
import com.synth.dto.PageDTO;
import com.synth.service.AdminMemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/member/*")
@RequiredArgsConstructor
public class AdminMemberController {
	
	private final AdminMemberService adminMemberService;
	
	@GetMapping("/member_list")
	public void getMemberList(Criteria cri, Model model) {
//		회원 목록 불러오기
		log.info("Member :" + cri);
		
//		테스트용으로 한번에 출력할 게시글 갯수.
		List<MemberVO> memberList = adminMemberService.getMemberList(cri);
		model.addAttribute("memberList", memberList);
//		출력할 데이터의 갯수.
		int total = adminMemberService.getTotalCount(cri);
		log.info("데이터의 총 량 :" + total);
//		페이징 작업.
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageDTO);
	
	}
	
	
}
