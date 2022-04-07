package com.campkok.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.customer.model.vo.DmVO;
import com.campkok.customer.model.vo.PointVO;
import com.campkok.customer.model.vo.ReservationVO;
import com.campkok.customer.model.vo.ReviewVO;
import com.campkok.customer.model.vo.UserVO;

@Repository
public class CustomerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public UserVO selectOneCutomer(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.mypage", userNo);
	}

	public int updateCustomer(UserVO u) {
		// TODO Auto-generated method stub
		return sqlSession.update("customer.updateCustomer", u);
	}

	public ArrayList<ReservationVO> selectOneReserve(int userNo) {
		// TODO Auto-generated method stub
		List<ReservationVO> list = sqlSession.selectList("customer.reserveInfo", userNo);
		return (ArrayList<ReservationVO>) list;
	}

	public ArrayList<ReservationVO> useSelectList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<ReservationVO> list = sqlSession.selectList("customer.useInfo", map);
		return (ArrayList<ReservationVO>) list;
	}

	public int useTotalCount(int userNo) {
		// TODO Auto-generated method stub
		List<ReservationVO> list = sqlSession.selectList("customer.totalUse", userNo);
		return list.size();
	}

	public ArrayList<ReviewVO> reviewSelectList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<ReviewVO> list = sqlSession.selectList("customer.reviewInfo", map);
		return (ArrayList<ReviewVO>) list;
	}

	public int reviewTotalCount(String userId) {
		// TODO Auto-generated method stub
		List<ReviewVO> list = sqlSession.selectList("customer.totalReview", userId);
		return list.size();
	}

	public ArrayList<PointVO> pointList(int userNo) {
		// TODO Auto-generated method stub
		List<PointVO> list = sqlSession.selectList("customer.pointInfo", userNo);
		return (ArrayList<PointVO>) list;
	}

	public ArrayList<DmVO> selectDmList(String userId) {
		// TODO Auto-generated method stub
		List<DmVO> list = sqlSession.selectList("customer.dmList", userId);
		return (ArrayList<DmVO>) list;
	}

	public int insertDM(DmVO dm) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customer.inserDM",dm);
	}

	public int deleteDm(int dmNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("customer.deleteDm", dmNo);
	}

	public DmVO selectOneDm(int dmNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.selectDm", dmNo);
	}

	public int updateDm(int dmNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("customer.updateDm", dmNo);
	}

	public int deleteCustomer(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("customer.deleteCustomer", userNo);
	}

}
