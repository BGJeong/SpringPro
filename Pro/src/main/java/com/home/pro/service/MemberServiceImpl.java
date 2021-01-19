package com.home.pro.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.pro.DAO.memberDAOImple;
import com.home.pro.DTO.memberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private memberDAOImple dao;
	public void insert(memberDTO dto) {
		dao.insert(dto);
	}
	public int idcheck(String id) {
		return dao.idcheck(id);
	}
	public memberDTO login(String userid){
		return dao.login(userid);
	}
	public memberDTO findpwd(String id) {
		return dao.findpwd(id);
	}
	public void edit(memberDTO dto) {
		dao.edit(dto);
	}
	public void deleteMember(String userid) {
		dao.deleteMember(userid);
	}
	public ArrayList<memberDTO> searchAction(String userid){
		return dao.searchAction(userid);
	}
	public int follow(Map<String, String> map) throws Exception{
		return dao.follow(map);
	}
}
