package com.campkok.customer.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.customer.model.dao.UserDao;
import com.campkok.customer.model.vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDao dao;

	// 회원가입 
	public int insertUser(UserVO u) {
		int result = dao.insertUser(u);
		return result;
	}

	// 로그인
	public UserVO selectOneUser(UserVO u) {
		return dao.selectOneUser(u);
	}
	
	// 아이디 중복체크
	public UserVO checkId(UserVO u) {
		return dao.checkId(u);
	}

	// 아이디 찾기
	public UserVO findUserId(UserVO u) {
		return dao.findUserId(u);
	}
	
	// 비밀번호 찾기
	public UserVO findUserPw(UserVO u) {
		return dao.findUserPw(u);
	}
}
