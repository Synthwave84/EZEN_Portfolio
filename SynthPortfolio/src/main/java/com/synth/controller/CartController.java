package com.synth.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.synth.domain.CartVO;
import com.synth.domain.MemberVO;
import com.synth.dto.CartDTOList;
import com.synth.service.CartService;
import com.synth.utils.FileUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller

@RequiredArgsConstructor
@RequestMapping("/member/cart/*")
@Slf4j
public class CartController {

	private final CartService cartService;
	
	@Resource(name = "uploadPath")
	private  String uploadPath;
	
	@ResponseBody
	@PostMapping("/cart_add")
	public ResponseEntity<String> cart_add(CartVO vo, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		String member_id = ((MemberVO)session.getAttribute("loginStatus")).getMember_id();
		vo.setMember_id(member_id);
		
		cartService.cart_add(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/cart_list")
	public void cart_list(HttpSession session, Model model) throws Exception {
		String member_id = ((MemberVO)session.getAttribute("loginStatus")).getMember_id();
		
		List<CartDTOList> cart_list = cartService.cart_list(member_id);
		
		int cart_total_price = 0;
		
		for(int i=0; i<cart_list.size(); i++) {
			CartDTOList vo = cart_list.get(i);
			
			vo.setItem_up_folder(vo.getItem_up_folder().replace("\\", "/"));
			cart_total_price += (vo.getItem_price() * vo.getCart_amount());
			
		}
		
		model.addAttribute("cart_list", cart_list);
		model.addAttribute("cart_total_price", cart_total_price);
	
	}
	
	@ResponseBody
//	/admin/product/imageDisplay?=dateFolderName=값1&fileName=값2
	@GetMapping("/imageDisplay")
	public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + dateFolderName, fileName);
		
	}
	
	@PostMapping("/cart_amount_change")
	public ResponseEntity<String> cart_amount_change(Long cart_no, int cart_amount) throws Exception {
		
		ResponseEntity<String> entity = null;
				
		cartService.cart_amount_change(cart_no, cart_amount);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping("/cart_list_del")
	public ResponseEntity<String> cart_list_del(Long cart_no) throws Exception {
      
      ResponseEntity<String> entity = null;
      
      entity = new ResponseEntity<String>("success", HttpStatus.OK);
      
      cartService.cart_list_del(cart_no);
      
      return entity;
   }
	
	@GetMapping("/cart_list_del")
	public String cart_list_del2(Long cart_no) throws Exception {
      
      cartService.cart_list_del(cart_no);
      
      return "redirect:/member/cart/cart_list";
   }
	
	@PostMapping("/cart_sel_delete")
	public ResponseEntity<String> cart_sel_delete(@RequestParam("cart_no_arr[]") List<Long> cart_no_arr) {
		ResponseEntity<String> entity = null;
		
		//방법1. 하나씩 반복적으로 삭제.
		/*
		for(int i=0; i<cart_no_arr.size(); i++) {
			cartService.cart_delete(cart_no_arr.get(i));
		}
		*/
		
		//방법2. mybatis foreach : https://java119.tistory.com/85
		cartService.cart_sel_delete(cart_no_arr);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	
	
	
}
