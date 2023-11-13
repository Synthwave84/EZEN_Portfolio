package com.synth.domain;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter

//	페이징 및 검색 필드를 가지고 있는 클래스.
public class Criteria {
	private int pageNum;
	private int amount; 
	
	private String type;  
	private String keyword; 
	
	public Criteria() {
		this(1, 10);
		System.out.println("Criteria 기본생성자 호출");
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	public String[] getTypeArr() {
		
		
		return type == null? new String[] {} : type.split("");
	}
	
//	UriComponentsBuilder : 여러개의 파라미터들을 연결하여 URL형태로 만들어주는 기능
//	?pageNum=값&amount=값&type=값&keyword=값
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("type", this.type)
				.queryParam("keyword", this.keyword);
		
		return builder.toUriString();
				
	}
	
}