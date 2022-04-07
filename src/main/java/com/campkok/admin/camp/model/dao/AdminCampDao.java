package com.campkok.admin.camp.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.camp.model.vo.Camp;
import com.campkok.admin.camp.model.vo.CampEnv;
import com.campkok.admin.camp.model.vo.CampFile;

@Repository
public class AdminCampDao {
	@Autowired
	private SqlSessionTemplate session;

	/* 
	 * ***************************************************************************
	 * Camp Info List
	 * ***************************************************************************
	*/
	// ******************** CampEnvInfo ********************
	public CampEnv selectCampEnvInfo(int campNo) {
		return session.selectOne("adminCamp.selectCampEnvInfo", campNo);
	}

	// ******************** CampFiles ********************
	public ArrayList<CampFile> selectCampFiles(int campNo) {
		List<CampFile> list = session.selectList("adminCamp.selectCampFiles", campNo);

		return (ArrayList<CampFile>) list;
	}

	// ******************** CampInfo ********************
	public int getTotalCampCount() {
		return session.selectOne("adminCamp.getTotalCampCount");
	}

	public int getTotalSearchCampCount(String searchCategory, String search) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("searchCategory", searchCategory);
		map.put("search", search);

		return session.selectOne("adminCamp.getSearchCampInfoCount", map);
	}

	public Camp selectCampInfo(int campNo) {
		return session.selectOne("adminCamp.getCampInfo", campNo);
	}

	public Camp selectCampInfo(String userId) {
		return session.selectOne("adminCamp.selectCampInfo", userId);
	}

	public ArrayList<Camp> selectCampInfoList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<Camp> list = session.selectList("adminCamp.selectCampInfoList", map);

		return (ArrayList<Camp>) list;
	}

	public ArrayList<Camp> searchCampInfoList(int start, int end, String searchCategory, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("searchCategory", searchCategory);
		map.put("search", search);

		List<Camp> list = session.selectList("adminCamp.searchCampInfoList", map);

		return (ArrayList<Camp>) list;
	}

	public int insertCampInfo(Camp camp) {
		return session.insert("adminCamp.insertCampInfo", camp);
	}

	public int insertCampFiles(CampFile campFile) {
		return session.insert("adminCamp.insertCampFile", campFile);
	}

	public int insertCampEnv(CampEnv campEnv) {
		return session.insert("adminCamp.insertCampEnv", campEnv);
	}

	public int deleteCampInfo(int campNo) {
		return session.delete("adminCamp.deleteCampInfo", campNo);
	}

	/* 
	 * ***************************************************************************
	 * Temp Camp Info List
	 * ***************************************************************************
	*/
	public int getTempCampCount() {
		return session.selectOne("tempCampInfo.getTempCampCount");
	}

	// ******************** Temp Camp Env ********************
	public CampEnv selectTempCampEnv(int campNo) {
		return session.selectOne("tempCampInfo.selectTempCampEnvInfo", campNo);
	}

	// ******************** Temp Camp Files ********************
	public int getTotalSearchTempCampCount(String searchCategory, String search) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("searchCategory", searchCategory);
		map.put("search", search);

		return session.selectOne("tempCampInfo.getSearchTempCampCount", map);
	}

	public ArrayList<CampFile> selectTempCampFiles(int campNo) {
		List<CampFile> list = session.selectList("tempCampInfo.selectTempCampFiles", campNo);

		return (ArrayList<CampFile>) list;
	}

	public int getTotalTempCampCount() {
		return session.selectOne("tempCampInfo.getTempCampInfoCount");
	}

	public Camp selectTempCampInfo(int campNo) {
		return session.selectOne("tempCampInfo.selectTempCamp", campNo);
	}

	public ArrayList<Camp> selectTempCampInfoList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<Camp> list = session.selectList("tempCampInfo.selectTempCampList", map);

		return (ArrayList<Camp>) list;
	}

	public ArrayList<Camp> searchTempCampInfoList(int start, int end, String searchCategory, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("searchCategory", searchCategory);
		map.put("search", search);

		List<Camp> list = session.selectList("tempCampInfo.searchTempCampInfoList", map);

		return (ArrayList<Camp>) list;
	}

	public int deleteTempCampInfo(int campNo) {
		return session.delete("tempCampInfo.deleteTempCampInfo", campNo);
	}

}
