package com.synth.domain;

import lombok.Data;

@Data
public class ItemOptionVO {

//    ITEM_OPTION_ID      NUMBER                  CONSTRAINT PK_ITEM_OPTION_ID PRIMARY KEY,
//    ITEM_NO             NUMBER                  NOT NULL,
//    OPTION_TYPE_ID      NUMBER                  NULL,
//    OPTION_CG_ID        NUMBER                  NULL,
//    OPTION_ID           NUMBER                  NULL,
	
	private Integer	item_option_id;
	private String  item_uuid;
	private Integer option_type_id;
	private Integer option_cg_id;
	private Integer option_id;
}
