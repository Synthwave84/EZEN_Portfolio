package com.synth.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	
	private Long 	rev_num;
	private String	member_id;
	private Integer	item_no;
	private String	rev_content;
	private int		rev_score;
	private Date    rev_regdate;
}