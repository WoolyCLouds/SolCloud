package com.sol4.cloud.Service;

import java.util.List;

import com.sol4.cloud.Domain.Cloud;

public interface BoardService {
	
	// 클라우드 리스트
	List<Cloud> getPublicboardbyID(Cloud c) throws Exception;
	
	// 사용자 자신이 공유 해놓은 리스트 
	List<Cloud> getBoard (Cloud c) throws Exception;
	
	// 사용한 용량
	double usedCapacity(Cloud c);
	
	// 파일 업로드
	int uploadFile(Cloud c);
	
	// 파일 삭제
	int deleteFile(Cloud c);
	
	// 파일 확인
	int checkFile(Cloud c);
	
	// 모든 리스트 불러옴
	List<Cloud> listAll(int start, int end, Cloud c) throws Exception;
	
	// 파일 공유 
	void updateShare(Cloud c);
	
}
