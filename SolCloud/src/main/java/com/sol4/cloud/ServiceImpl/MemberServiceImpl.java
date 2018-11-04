package com.sol4.cloud.ServiceImpl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol4.cloud.DAO.MemberDAO;
import com.sol4.cloud.Domain.Cloud;
import com.sol4.cloud.Service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;

	@Override
	public int login(Cloud m) {

		try {
			Cloud dbMember = mDAO.selectMemberById(m.getM_id());
			
			if (dbMember == null) {
				System.out.println("로그인 실패(미가입)");
				return 0;
			} else {
				if (m.getM_pw().equals(dbMember.getM_pw())) {
					System.out.println("로그인 성공");
					return 1;
				} else {
					System.out.println("비밀번호 오류");
					return 2;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB문제");
			return 3;
		}
	}

	@Override
	public int regMember(Cloud m) {
		
		String folderpath = "C:\\SolCloud\\" + m.getM_id();
		File file = new File(folderpath);
		
		if (!file.exists()) {
			file.mkdirs();
			System.out.println("폴더 생성 우아");
		}
		m.setM_directory(folderpath);
		mDAO.createCloud_Id(m);
		
		return mDAO.insertMember(m);
	}

	@Override
	public Cloud selectMember(String m_id) {
		return mDAO.selectMemberById(m_id);
	}

	@Override
	public void deleteMember(Cloud c) {
		String path = "C:\\SolCloud\\"+c.getM_id();
		File deleteFolder = new File(path);
		if(deleteFolder.exists()){
			File[] deleteFolderList = deleteFolder.listFiles();
			for (int j = 0; j < deleteFolderList.length; j++) {
				deleteFolderList[j].delete(); 
			}
			if(deleteFolderList.length == 0 && deleteFolder.isDirectory()){
				deleteFolder.delete();
			}
		}
		mDAO.deleteMember(c);
	}

	@Override
	public void dropMemberTable(Cloud c) {
		mDAO.dropMemberTable(c);
	}

	@Override
	public void updateMemberInfo(Cloud c) {
		mDAO.updateMemberInfo(c);
	}

	@Override
	public int checkInfo(Cloud c) {
		return mDAO.checkInfo(c);
	}

	@Override
	public void updatePW(Cloud c) {
		mDAO.updatePW(c);
	}

	@Override
	public List<Cloud> listAllMembers(int start, int end) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
	    // BETWEEN #{start}, #{end}에 입력될 값을 맵에 
	    map.put("start", start);
	    map.put("end", end);
		return mDAO.listAllMembers(map);
	}

	@Override
	public int checkMember() {
		return mDAO.checkMember();
	}
}
