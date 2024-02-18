package com.synth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synth.domain.CartVO;
import com.synth.dto.CartDTOList;
import com.synth.mapper.CartMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {
	
	private final CartMapper cartMapper;
	
	@Override
	public void cart_add(CartVO vo) {
		// TODO Auto-generated method stub
		cartMapper.cart_add(vo);
	}

	@Override
	public List<CartDTOList> cart_list(String member_id) {
		// TODO Auto-generated method stub
		return cartMapper.cart_list(member_id);
	}

	@Override
	public void cart_amount_change(Long cart_no, int cart_amount) {
		// TODO Auto-generated method stub
		cartMapper.cart_amount_change(cart_no, cart_amount);
	}

	@Override
	public void cart_list_del(Long cart_no) {
		// TODO Auto-generated method stub
		cartMapper.cart_list_del(cart_no);
	}

	@Override
	public void cart_sel_delete(List<Long> cart_no_arr) {
		// TODO Auto-generated method stub
		cartMapper.cart_sel_delete(cart_no_arr);
	}

	
}
