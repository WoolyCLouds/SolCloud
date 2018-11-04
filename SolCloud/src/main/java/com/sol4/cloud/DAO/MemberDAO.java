package com.sol4.cloud.DAO;

import java.util.List;
import java.util.Map;

import com.sol4.cloud.Domain.Cloud;

public interface MemberDAO {
	
	// 회원가입
	int insertMember (Cloud m);
	void createCloud_Id (Cloud m);

	// 회원 선택
	Cloud selectMemberById (String m_id);
	
	// 회원 삭제
	void deleteMember (Cloud c);
	
	// 회원 DB 삭제
	void dropMemberTable (Cloud c);
	
	// 회원 정보 갱신
	void updateMemberInfo(Cloud c);
	
	// 비밀번호 찾기-회원 정보 확인
	int checkInfo (Cloud c);
	int checkMember ();
	
	// 비밀번호 재설정
	void updatePW (Cloud c);

	// 회원 리스트
	public List<Cloud> listAllMembers (Map<String, Object> map) throws Exception;
	
}
