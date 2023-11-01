package com.synth.service;

import org.springframework.stereotype.Service;

import com.synth.domain.MemberVO;
import com.synth.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;

	@Override
	public void join(MemberVO vo) {
		memberMapper.join(vo);
	}
}
