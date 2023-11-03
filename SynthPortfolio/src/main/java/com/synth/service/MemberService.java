package com.synth.service;

import com.synth.domain.MemberVO;

public interface MemberService {

	void join(MemberVO vo);
	
	public String idCheck(String member_id);
}
