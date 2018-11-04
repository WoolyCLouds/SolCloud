package com.sol4.cloud.ServiceImpl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol4.cloud.DAO.BoardDAO;
import com.sol4.cloud.Domain.Cloud;
import com.sol4.cloud.Service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDAO;

	@Override
	public double usedCapacity(Cloud c) {
		return bDAO.usedCapacity(c);
	}
	
	@Override
	public int uploadFile(Cloud c) {
		return bDAO.uploadFile(c);
	}

	@Override
	public int deleteFile(Cloud c) {
		File file = new File("C:\\SolCloud\\"+c.getM_id()+"\\"+c.getF_name());
        if(file.exists()){
            if(file.delete()){
                System.out.println("파일삭제 성공");
            }else{
                System.out.println("파일삭제 실패");
            }
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }
		return bDAO.deleteFile(c);
	}

	@Override
	public int checkFile(Cloud c) {
		return bDAO.checkFile(c);
	}

	@Override
	public List<Cloud> listAll(int start, int end, Cloud c) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("f_name", c.getF_name());
	    map.put("m_id", c.getM_id());
	    // BETWEEN #{start}, #{end}에 입력될 값을 맵에 
	    map.put("start", start);
	    map.put("end", end);
		return bDAO.listAll(map);
	}

	@Override
	public void updateShare(Cloud c) {
		bDAO.updateShare(c);
	}

	@Override
	public List<Cloud> getBoard(Cloud c) throws Exception {
		return bDAO.getBoard(c);
	}

	@Override
	public List<Cloud> getPublicboardbyID(Cloud c) throws Exception {
		return bDAO.getPublicboardbyID(c);
	}
}