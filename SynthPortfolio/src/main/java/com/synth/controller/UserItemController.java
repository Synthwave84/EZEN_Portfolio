package com.synth.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.synth.domain.Criteria;
import com.synth.domain.ItemVO;
import com.synth.dto.PageDTO;
import com.synth.service.MemberItemService;
import com.synth.utils.FileUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/member/item/*")
@Log4j
@Controller
@RequiredArgsConstructor
public class UserItemController {

	private final MemberItemService userItemService;
	
	@Resource(name= "uploadPath")
	private String uploadPath;
	
	@GetMapping("/item_list")
		public String item_list
		(Criteria cri, @ModelAttribute("cg_code") Integer cg_code,
						@ModelAttribute("cg_name") String cg_name, Model model) throws Exception {
		
		cri.setAmount(4);
		
		List<ItemVO> item_list = userItemService.item_list(cg_code, cri);
		
		log.info(("상품리스트 :" + item_list));
		
		item_list.forEach(vo -> {
			vo.setItem_up_folder(vo.getItem_up_folder().replace("\\","/"));
		});
		model.addAttribute("item_list", item_list);
		
		int totalCount = userItemService.getTotalCount(cg_code);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
		return "/member/item/item_list";
		
	}
	
	// 상품 리스트에서 보여줄 이미지. <img src="매핑주소">
	   @ResponseBody
	   @GetMapping("/imageDisplay") // /user/product/imageDisplay?dateFolderName=값1&fileName=값2
	   public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {

	      return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	   }
	   
	   @GetMapping("/item_detail") 
	   public void item_detail (Criteria cri, Integer cg_code, @ModelAttribute("cg_name") String cg_name, Integer item_no, Model model) throws Exception {
		   
		   log.info("페이징 정보 :"+ cri);
		   log.info("상품코드정보 :" + item_no);
		   
		   ItemVO itemVO = userItemService.item_detail(item_no);
		   
		   itemVO.setItem_up_folder(itemVO.getItem_up_folder().replace("\\", "/"));
		   
		   model.addAttribute("itemVO", itemVO);
		   
	   }
}
