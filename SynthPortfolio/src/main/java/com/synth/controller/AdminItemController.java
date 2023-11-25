package com.synth.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.synth.domain.Criteria;
import com.synth.domain.ItemVO;
import com.synth.dto.PageDTO;
import com.synth.service.AdminItemService;
import com.synth.service.CategoryService;
import com.synth.utils.FileUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin/item/*")
@RequiredArgsConstructor
public class AdminItemController {
	
	private final AdminItemService adminItemService;
	private final CategoryService categoryService;
	
//	업로드 폴더경로 주입작업 
//	servlet-context의 bean이름 참조 해야함.
	@Resource(name ="uploadPath")
	private String uploadPath;
	
//	CKEditor에서 사용되는 업로드 경로
	@Resource(name ="uploadCKPath")
	private String uploadCKPath;
	
//	상품등록 폼
	@GetMapping("/item_insert")
	public void pro_insert() {
		log.info("상품등록 폼");
	}
	
	@PostMapping("/item_insert")
	public String item_insert(ItemVO vo, MultipartFile uploadFile, RedirectAttributes rttr) {
		String dateFolder = FileUtils.getDateFolder();
		String savedFileName= FileUtils.uploadFile(uploadPath, dateFolder, uploadFile);
		
		vo.setItem_img(savedFileName);
		vo.setItem_up_folder(dateFolder);
		
		log.info("상품정보 :" + vo);
		
		adminItemService.item_insert(vo);
		return "redirect:/admin/item/item_list";
	}
	
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) {
		
		
//		클라이언트에게 보내는 응답 설정
		
//		try코드 사용전에 선언한 목적
		OutputStream out = null;
		PrintWriter  printWriter = null;
		      
		response.setCharacterEncoding("utf-8");
		response.setContentType("/text/html; charset=utf-8");
		
		try {
//			클라이언트에서 전송한 파일 이름
			String fileName = upload.getOriginalFilename();
//			업로드 된 파일으 bytes로 변환함.
			byte[] bytes = upload.getBytes();
			
			String ckUploadPath = uploadCKPath + fileName;
			
			log.info("CKEditor 파일경로 :" +ckUploadPath);
//			0kb 파일 생성
			out = new FileOutputStream(new File(ckUploadPath));
//			출력 스트림 생성
			out.write(bytes);
			out.flush();
			
//			2) 파일업로드 작업 후 파일정보를 CKEditor 로 보내는 작업
			printWriter = response.getWriter();
			
//		브라우저 CKEditor에서 사용할 업로드한 파일 정보를 참조하는 경로설정.	
// 		1)톰캣 Context Path에서 Add External Web Module 작업을 해야 함.
// 		Path : /ckupload, Document Base : C:\\dev\\upload\\ckeditor 설정
// 		2)Tomcat server.xml에서 <Context docBase="업로드경로" path="/ckupload" reloadable="true"/>
			
//			 CKEditor에서 업로드 된 폴더와 
	         String fileUrl = "/ckupload/" + fileName;
	         // {"filename":"abc.gif", "uploaded":1, "url":"/upload/abc.gif"}
	         printWriter.println("{\"filename\":\"" +  fileName + "\", \"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
	         printWriter.flush();
		} catch (Exception e) {
			
		} finally {
			if(out != null) {
				try {
					out.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			if(printWriter != null) printWriter.close();
		}
	}
	
	
	@GetMapping("/item_list")
	public void item_list(Criteria cri, Model model) throws Exception {
		
		cri.setAmount(3);
		List<ItemVO> item_list = adminItemService.item_list(cri);
		
		item_list.forEach(vo -> {
			vo.setItem_up_folder(vo.getItem_up_folder().replace("\\", "/"));
		});
		model.addAttribute("item_list", item_list);
		
		int totalCount = adminItemService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
	}
	
	@ResponseBody
	@GetMapping("/imageDisplay")
	public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	}
	
	
	
}
