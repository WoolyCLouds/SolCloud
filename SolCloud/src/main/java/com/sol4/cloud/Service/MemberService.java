package com.sol4.cloud.Service;

import java.util.List;

import com.sol4.cloud.Domain.Cloud;

public interface MemberService {

	// 로그인
	int login (Cloud m);
	
	// 회원가입
	int regMember (Cloud m);
	
	Cloud selectMember (String m_id);
	
	// 회원 삭제
	void deleteMember (Cloud c);

	// 회원 DB 테이블 삭제
	void dropMemberTable (Cloud c);
	
	// 회원 정보 갱신
	void updateMemberInfo(Cloud c);
	
	// 회원 정보 확인
	int checkInfo (Cloud c);
	
	// 회원 비밀번호 재설정
	void updatePW (Cloud c);
	
	// 회원 확인
	int checkMember ();
	
	// 회원 전체 리스트
	public List<Cloud> listAllMembers (int start, int end) throws Exception;
	
}
