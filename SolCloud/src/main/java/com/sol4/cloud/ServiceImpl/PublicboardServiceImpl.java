package com.sol4.cloud.ServiceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sol4.cloud.DAO.PublicboardDAO;
import com.sol4.cloud.Domain.Cloud;
import com.sol4.cloud.Service.PublicboardService;

@Service
public class PublicboardServiceImpl implements PublicboardService {

	@Autowired
	private PublicboardDAO nDAO;

	@Override
	public void writePublicboardPost(Cloud c) {
		nDAO.writePublicboardPost(c);
	}

	@Override
	public void deletePublicboardPost(Cloud c) {
		nDAO.deletePublicboardPost(c);
	}

	@Override
	public void updatePublicboardPost(Cloud c) {
		nDAO.updatePublicboardPost(c);
	}

	@Override
	public int checkFile(Cloud c) {
		return nDAO.checkFile(c);
	}

	@Override
	public List<Cloud> getPublicboard(Cloud c) throws Exception {
		return nDAO.getPublicboard(c);
	}

	@Override
	public List<Cloud> listAllPublicboard(int start, int end, String searchOption, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    map.put("start", start);
	    map.put("end", end);
		return nDAO.listAllPublicboard (map);
	}

	@Override
	public int checkPublicboard() {
		return nDAO.checkPublicboard();
	}

	@Override
	public List<Cloud> getShareFile(Cloud c) throws Exception {
		return nDAO.getShareFile(c);
	}

	@Override
	public void updateViewCnt(Cloud c) throws Exception {
		nDAO.updateViewCnt(c);
	}
}