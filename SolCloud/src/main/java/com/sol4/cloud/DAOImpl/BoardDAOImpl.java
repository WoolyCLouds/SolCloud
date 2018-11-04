package com.sol4.cloud.DAOImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol4.cloud.DAO.BoardDAO;
import com.sol4.cloud.Domain.Cloud;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession ss;

	@Override
	public double usedCapacity(Cloud c) {
		return ss.getMapper(BoardDAO.class).usedCapacity(c);
	}

	@Override
	public int uploadFile(Cloud c) {
		return ss.insert("uploadFile", c);
	}

	@Override
	public int deleteFile(Cloud c) {
		return ss.delete("deleteFile", c);
	}

	@Override
	public int checkFile(Cloud c) {
		return ss.getMapper(BoardDAO.class).checkFile(c);
	}

	@Override
	public List<Cloud> listAll(Map<String, Object> map) throws Exception {
		return ss.selectList("listAll", map);
	}

	@Override
	public void updateShare(Cloud c) {
		ss.getMapper(BoardDAO.class).updateShare(c);
	}

	@Override
	public List<Cloud> getBoard(Cloud c) throws Exception {
		return ss.selectList("getBoard", c);
	}

	@Override
	public List<Cloud> getPublicboardbyID(Cloud c) throws Exception {
		return ss.selectList("getPublicboardbyID", c);
	}
}
