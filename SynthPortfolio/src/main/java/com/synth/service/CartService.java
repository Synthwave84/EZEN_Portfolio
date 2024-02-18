package com.synth.service;

import java.util.List;

import com.synth.domain.CartVO;
import com.synth.dto.CartDTOList;

public interface CartService {

	void cart_add(CartVO vo);
	
	List<CartDTOList> cart_list(String member_id);
	
	public void cart_amount_change(Long cart_no, int cart_amount);
	
	void cart_list_del(Long cart_no);
	
	void cart_sel_delete(List<Long> cart_no_arr);
}
