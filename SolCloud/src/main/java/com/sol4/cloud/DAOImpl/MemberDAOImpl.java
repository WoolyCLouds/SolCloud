package com.sol4.cloud.DAOImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol4.cloud.DAO.MemberDAO;
import com.sol4.cloud.Domain.Cloud;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession ss;

	@Override
	public int insertMember (Cloud m) {
		return ss.getMapper(MemberDAO.class).insertMember(m);
	}

	@Override
	public Cloud selectMemberById (String m_id) {
		return ss.getMapper(MemberDAO.class).selectMemberById( m_id);
	}

	@Override
	public void createCloud_Id(Cloud m) {
		ss.getMapper(MemberDAO.class).createCloud_Id(m);
	}

	@Override
	public void deleteMember(Cloud c) {
		ss.getMapper(MemberDAO.class).deleteMember(c);
	}

	@Override
	public void dropMemberTable(Cloud c) {
		ss.getMapper(MemberDAO.class).dropMemberTable(c);
	}

	@Override
	public void updateMemberInfo(Cloud c) {
		ss.getMapper(MemberDAO.class).updateMemberInfo(c);
	}

	@Override
	public int checkInfo(Cloud c) {
		return ss.getMapper(MemberDAO.class).checkInfo(c);
	}

	@Override
	public void updatePW(Cloud c) {
		ss.update("updatePW", c);
	}

	@Override
	public List<Cloud> listAllMembers (Map<String, Object> map) throws Exception {
		return ss.selectList("listAllMembers", map);
	}

	@Override
	public int checkMember() {
		return ss.getMapper(MemberDAO.class).checkMember();
	}	
}
