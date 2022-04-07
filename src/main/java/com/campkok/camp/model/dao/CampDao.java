package com.campkok.camp.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.notice.model.vo.ClientNotice;
import com.campkok.camp.model.vo.CampEnv;
import com.campkok.camp.model.vo.CampNoticeVO;
import com.campkok.camp.model.vo.CampResVO;
import com.campkok.camp.model.vo.CampRoomVO;
import com.campkok.camp.model.vo.CampVO;
import com.campkok.camp.model.vo.FileTBL;
import com.campkok.camp.model.vo.Rent;
import com.campkok.camp.model.vo.ReviewVO;
import com.campkok.camp.model.vo.UserVO;

@Repository
public class CampDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public CampRoomVO selectRoomInfo(int roomNo) {
		return sqlSession.selectOne("camp.selectRoomInfo",roomNo);
	}

	public CampVO selectCampInfo(int campNo) {		
		return sqlSession.selectOne("camp.selectCampInfo",campNo);
	}

	public int campRes(HashMap<String, Object> map) {
		return sqlSession.insert("camp.campRes",map);
	}

	public UserVO selectUserPoint(int userNo) {
		return sqlSession.selectOne("camp.selectUserPoint",userNo);
	}

	public int userPointUpdate(HashMap<String, Object> map) {
		return sqlSession.update("camp.updateUserPoint",map);
	}

	public int totalPoint(int userNo) {
		return sqlSession.selectOne("camp.totalPoint",userNo);
	}

	public int pointUpdate(HashMap<String, Object> map) {
		return sqlSession.insert("camp.insertPoint",map);
	}

	public int insertComment(HashMap<String, Object> map) {
		return sqlSession.insert("camp.insertComment",map);
	}

	public ArrayList<ReviewVO> selectAllComment(int campNo) {
		List<ReviewVO> commentList = sqlSession.selectList("camp.selectAllComment",campNo); 
		return (ArrayList<ReviewVO>)commentList;
	}

	public int getTotalCampNotice() {
		return sqlSession.selectOne("camp.getCampNoticeCount");
	}

	public ArrayList<CampNoticeVO> selectCampNoticeList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<CampNoticeVO> list = sqlSession.selectList("camp.selectCampNoticeList", map);
		return (ArrayList<CampNoticeVO>) list;
	}

	public CampNoticeVO selectCampNotice(int campNoticeNo) {
		return sqlSession.selectOne("camp.selectCampNotice",campNoticeNo);
	}

	public ArrayList<CampResVO> selectCampResList(int roomNo) {
		List<CampResVO> campResList = sqlSession.selectList("camp.selectCampResList",roomNo);
		return (ArrayList<CampResVO>)campResList;
	}

	public int commentDelete(int revNo) {
		return sqlSession.delete("camp.commentDelete",revNo);
	}

	public int commentUpdate(int revNo) {
		return sqlSession.update("camp.commentUpdate",revNo);
	}

	public UserVO selectUserPoint(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("camp.selectUser",userId);
	}

	public int insertPoint(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("camp.insertPointReview",map);
	}

	public int updateUserPoint(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("camp.updateUserPoint2",userNo);
	}
	
	public UserVO selectOneUser(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("camp.selectOneUser", userNo);
	}

	public int insertCamp(CampVO c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("camp.insertCampVO",c);
	}

	public CampVO selectOneCamp(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("camp.selectOneCamp", userId);
	}

	public int insertCampEnv(CampEnv ce) {
		// TODO Auto-generated method stub
		return sqlSession.insert("camp.insertCampEnv",ce);
	}

	public int insertCampSeq() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("camp.insertCampSeq");
	}

	public int insertRent(Rent r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("camp.insertRent",r);
	}

	public int insertFileTBL(FileTBL ft) {
		// TODO Auto-generated method stub
		return sqlSession.insert("camp.insertFileTBL",ft);
	}


}
