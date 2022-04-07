package com.campkok.admin.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.campkok.admin.user.model.vo.User;

@Repository
public class AdminUserDao {
	@Autowired
	private SqlSessionTemplate session;

	// ********** Client Info **********
	public int getTotalClientInfo() {
		return session.selectOne("adminUserInfo.getClientInfoCount");
	}

	public int getTotalSearchClientInfo(String searchCategory, String search) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("searchCategory", searchCategory);
		map.put("search", search);

		return session.selectOne("adminUserInfo.getSearchClientInfoCount", map);
	}

	public User selectClientInfo(int userNo) {
		return session.selectOne("adminUserInfo.selectClientInfo", userNo);
	}

	public ArrayList<User> selectClientInfoList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<User> list = session.selectList("adminUserInfo.selectClientInfoList", map);

		return (ArrayList<User>) list;
	}

	public ArrayList<User> getSearchClientInfoList(int start, int end, String searchCategory, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("searchCategory", searchCategory);
		map.put("search", search);

		List<User> list = session.selectList("adminUserInfo.getSearchClientInfoList", map);

		return (ArrayList<User>) list;
	}

	@Transactional
	public int updateClientInfo(User clientInfo) {
		return session.update("adminUserInfo.updateClientInfo", clientInfo);
	}

	@Transactional
	public int deleteClientInfo(int userNo) {
		return session.delete("adminUserInfo.deleteClientInfo", userNo);
	}

	// ********** CEO Info **********
	public int getTotalCeoInfo() {
		return session.selectOne("adminUserInfo.getCeoInfoCount");
	}

	public int getSearchCeoInfoCount(String searchCategory, String search) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("searchCategory", searchCategory);
		map.put("search", search);

		return session.selectOne("adminUserInfo.getSearchCeoInfoCount", map);
	}

	public User selectCeoInfo(int userNo) {
		return session.selectOne("adminUserInfo.selectCeoInfo", userNo);
	}

	public User selectCeoInfo(String ceoId) {
		return session.selectOne("adminUserInfo.getCeoInfo", ceoId);
	}

	public ArrayList<User> selectCeoInfoList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<User> list = session.selectList("adminUserInfo.selectCeoInfoList", map);

		return (ArrayList<User>) list;
	}

	public ArrayList<User> getSearchCeoInfoList(int start, int end, String searchCategory, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("searchCategory", searchCategory);
		map.put("search", search);

		List<User> list = session.selectList("adminUserInfo.getSearchCeoInfoList", map);

		return (ArrayList<User>) list;
	}

	public int updateCeoInfo(User ceoInfo) {
		return session.update("adminUserInfo.updateCeoInfo", ceoInfo);
	}

	public int deleteCeoInfo(int userNo) {
		return session.delete("adminUserInfo.deleteCeoInfo", userNo);
	}

}
