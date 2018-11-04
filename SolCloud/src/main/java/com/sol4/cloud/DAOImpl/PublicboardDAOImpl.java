package com.sol4.cloud.DAOImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol4.cloud.DAO.PublicboardDAO;
import com.sol4.cloud.Domain.Cloud;

@Repository
public class PublicboardDAOImpl implements PublicboardDAO {

	@Autowired
	private SqlSession ss;
	
	@Override
	public void writePublicboardPost(Cloud c) {
		ss.getMapper(PublicboardDAO.class).writePublicboardPost(c);
	}

	@Override
	public void deletePublicboardPost(Cloud c) {
		ss.getMapper(PublicboardDAO.class).deletePublicboardPost(c);
	}

	@Override
	public void updatePublicboardPost(Cloud c) {
		ss.getMapper(PublicboardDAO.class).updatePublicboardPost(c);
	}

	@Override
	public int checkFile(Cloud c) {
		return ss.getMapper(PublicboardDAO.class).checkFile(c);
	}

	@Override
	public List<Cloud> getPublicboard(Cloud c) throws Exception {
		return ss.selectList("getPublicboard", c);
	}

	@Override
	public List<Cloud> listAllPublicboard (Map<String, Object> map) throws Exception {
		return ss.selectList("listAllPublicboard", map);
	}

	@Override
	public int checkPublicboard() {
		return ss.getMapper(PublicboardDAO.class).checkPublicboard();
	}

	@Override
	public List<Cloud> getShareFile (Cloud c) throws Exception {
		return ss.selectList("getShareFile", c);
	}

	@Override
	public void updateViewCnt(Cloud c) throws Exception {
		ss.getMapper(PublicboardDAO.class).updateViewCnt(c);
	}
}
