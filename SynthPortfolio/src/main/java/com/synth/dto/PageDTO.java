package com.synth.dto;

import com.synth.domain.Criteria;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString

//	페이징 기능을 위해 생성하는 클래스.
//	DTO 는 페이징을 위한 목적으로 사용되므로, 페이징 관련한 기능은 DTO를 이용하여 작업한다.
public class PageDTO {
	
	private int startPage;
	private int endPage; 
	
	private boolean prev, next; 
	
	private int total; 
	
	private Criteria cri; 
	
	public PageDTO(Criteria cri, int total) {
		
		
		
		
		this.cri = cri; 
		this.total = total;
		
		int pageSize = 10; 
		int endPageInfo = pageSize - 1; 
		
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) pageSize)) * pageSize;
		
	
		this.startPage = this.endPage - endPageInfo;
		                               
		
		int readEnd = (int) (Math.ceil((total * 1.0) /cri.getAmount()));
		
		if(readEnd <= this.endPage) {
			this.endPage = readEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < readEnd;
		
	}
	
}
