package com.synth.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private Long   ord_code;  
	private String member_id;	  
	private String ord_name;
	private String ord_zipcode;
	private String ord_addr_basic;
	private String ord_addr_detail;
	private String ord_tel;
	private int	   ord_price;
	private Date   ord_regdate; 
	private String ord_status;
	private String payment_status;
	
}