package com.synth.service;

import java.util.List;

import com.synth.domain.Criteria;
import com.synth.domain.MemberVO;

public interface AdminMemberService {

	public List<MemberVO> getMemberList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
