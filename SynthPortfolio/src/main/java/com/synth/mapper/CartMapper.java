package com.synth.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.synth.domain.CartVO;
import com.synth.dto.CartDTOList;

public interface CartMapper {

void cart_add(CartVO vo);
	
	List<CartDTOList> cart_list(String member_id);
	
	public void cart_amount_change(
			@Param("cart_no")Long cart_no, 
			@Param("cart_amount")int cart_amount);
	
	void cart_list_del(Long cart_no);
	
	//장바구니 선택삭제. 파라미터 List컬렉션 사용.
	void cart_sel_delete(List<Long> cart_no_arr);
	
}
