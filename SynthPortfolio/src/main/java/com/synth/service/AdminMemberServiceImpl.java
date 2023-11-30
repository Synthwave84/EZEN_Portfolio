package com.synth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.synth.domain.Criteria;
import com.synth.domain.MemberVO;
import com.synth.mapper.AdminMemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminMemberServiceImpl implements AdminMemberService{

	private final AdminMemberMapper adminMemberMapper;

	@Override
	public List<MemberVO> getMemberList(Criteria cri) {
		// TODO Auto-generated method stub
		return adminMemberMapper.getMemberList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adminMemberMapper.getTotalCount(cri);
	}


	
	
	
}
