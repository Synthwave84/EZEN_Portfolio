package com.synth.mapper;

import com.synth.domain.MemberVO;

public interface MemberMapper {
	
//	 회원 가입 관련 메소드
	
//	1) join. 회원관련 정보를 DB에 넘기는 데 사용
	void join(MemberVO vo);
//	2) join 시 DB에 회원 id가 중복되었는지의 여부를 검사.
	public String idCheck(String member_id);
//	3) login 준비 작업
	MemberVO login(String member_id);
}
