package com.synth.service;

import org.springframework.stereotype.Service;

import com.synth.domain.MemberVO;
import com.synth.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;

//	1) 회원정보를 DB에 전달하기 위한 메소드 
	@Override
	public void join(MemberVO vo) {
		memberMapper.join(vo);
	}
//	2) 회원ID가 DB상 존재하는지 여부를 체크하기 위한 메소드
	@Override
	public String idCheck(String member_id) {
		return memberMapper.idCheck(member_id);
	}
}
