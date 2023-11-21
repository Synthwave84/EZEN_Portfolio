package com.synth.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.synth.domain.BoardVO;
import com.synth.domain.Criteria;
import com.synth.dto.PageDTO;
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
		return "redirect:/board/list";
	}
	
//	3) 글 목록 확인 작업.
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
//		게시글 목록 불러오기
		log.info("List :" + cri);
		
//		테스트용으로 한번에 출력할 게시글 갯수.
		List<BoardVO> list = boardService.getListWithPage(cri);
		model.addAttribute("list", list);
//		출력할 데이터의 갯수.
		int total = boardService.getTotalCount(cri);
		log.info("데이터의 총 량 :" + total);
//		페이징 작업.
		PageDTO pageDTO = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageDTO);
		
	}
	
//	게시물 읽기 :리스트에서 제목을 클릭했을 떄, 게시물 번호가 데이터를 출력
	//매핑주소 /board/get?bno=게시물번호
		//게시물읽기: 리스트에서 제목을 클릭했을 때 , 게시물번호에 데이타를 출력
		//수정폼
		@GetMapping({"/read", "/modify"})
		public void read(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,  Model model) {
			//목록에서 선택한 게시물번호
			log.info("게시물번호: " + bno);
			
			//페이징과검색정보
			log.info("페이징과검색정보: " + cri);
			
			BoardVO board = boardService.read(bno);
			model.addAttribute("board", board);
		}
		
//		5) 수정 작업
		@PostMapping("/modify") 
		public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
			log.info(board);
			boardService.modify(board);
			return "redirect:/board/list"+cri.getListLink();
		}
		
//		6)삭제 작업
		@GetMapping("/delete")
		public String delete(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
			
			log.info("삭제할 번호: " + bno);
			boardService.delete(bno);
			return "redirect:/board/list" + cri.getListLink();
		}

}
