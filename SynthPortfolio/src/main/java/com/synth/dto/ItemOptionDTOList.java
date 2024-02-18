package com.synth.dto;

import lombok.Data;

@Data
public class ItemOptionDTOList {

//    OT.OPTION_TYPE_ID,
//    OT.OPTION_TYPE_NAME,
//    OCG.OPTION_CG_ID,
//    OCG.OPTION_CG_NAME,
//    OV.OPTION_ID,
//    OV.OPTION_VALUE
	
	private Integer 	option_type_id;
	private String 		option_type_name;
	private Integer 	option_cg_id;
	private String 		option_cg_name;
	private Integer 	option_id;
	private String 		option_value;
	
	
}
