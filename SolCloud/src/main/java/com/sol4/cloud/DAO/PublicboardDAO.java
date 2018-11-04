package com.sol4.cloud.DAO;

import java.util.List;
import java.util.Map;

import com.sol4.cloud.Domain.Cloud;

public interface PublicboardDAO {
	
	// 공유 게시판 글쓰기
	void writePublicboardPost (Cloud c);
	
	// 공유 게시판 글삭제
	void deletePublicboardPost (Cloud c);
	
	// 공유 게시판 글갱신
	void updatePublicboardPost (Cloud c);
	
	// 공유게시판 게시글 파일 확인
	int checkFile (Cloud c);
	
	// 공유 게시글 체크
	int checkPublicboard ();
	
	// 파일 공유
	List<Cloud> getShareFile (Cloud c) throws Exception;
	
	// 공유 게시판 특정 사용자 리스트
	List<Cloud> getPublicboard (Cloud c) throws Exception;
	
	// 공유 게시판 전체 리스트
	List<Cloud> listAllPublicboard (Map<String, Object> map) throws Exception;
	
	// 공유 게시글 조회수
	void updateViewCnt (Cloud c) throws Exception;

	
}
