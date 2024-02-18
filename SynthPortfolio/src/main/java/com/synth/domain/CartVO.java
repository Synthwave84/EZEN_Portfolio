package com.synth.domain;

import lombok.Data;

@Data
public class CartVO {
	
	
//    CART_NO             NUMBER,
//    ITEM_NO             NUMBER          NOT NULL,
//    MEMBER_ID           VARCHAR2(15)    NOT NULL,
//    CART_AMOUNT         NUMBER          NOT NULL,
//    FOREIGN KEY(ITEM_NO)    REFERENCES ITEM_TBL(ITEM_NO),
//    FOREIGN KEY(MEMBER_ID)  REFERENCES MEMBER_TAB(MEMBER_ID),
//    CONSTRAINT PK_CART_NO   PRIMARY KEY(CART_NO) 
		
	private Integer cart_no;
	private Integer item_no;
	private String 	member_id;
	private Integer cart_amount;
	
	
}
