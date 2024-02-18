package com.synth.dto;

import lombok.Data;

@Data
public class CartDTOList {
	
	private Long 	cart_no;
	private Integer	item_no;
	private int		cart_amount;
	
	private String	item_name;
	private int		item_price;
	private String	item_up_folder;
	private	String	item_img;
	private int		item_discount;
	
}
