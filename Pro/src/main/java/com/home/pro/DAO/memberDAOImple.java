package com.home.pro.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.pro.DTO.memberDTO;

@Repository
public class memberDAOImple implements memberDAO{
	@Autowired
	private SqlSession sqlsession;
	
	public void insert(memberDTO dto){
		sqlsession.insert("memberns.member_insert", dto);
	}
	public int idcheck(String id) {
		int result = 0;
		memberDTO dto  =  sqlsession.selectOne("memberns.member_idcheck", id);
		if(dto != null){
			result = 1;
		}
		return result;
	}
	public memberDTO login(String userid) {
		return sqlsession.selectOne("memberns.member_idcheck", userid);
	}
	public memberDTO findpwd(String id) {
		return sqlsession.selectOne("memberns.member_findpwd", id); 
	}
	public void edit(memberDTO dto) {
		sqlsession.update("memberns.member_edit", dto);
	}
	public void deleteMember(String userid) {
		sqlsession.delete("memberns.member_delete", userid);
	}
	public ArrayList<memberDTO> searchAction(String userid) {
		ArrayList<memberDTO> list =  (ArrayList) sqlsession.selectList("memberns.memberSearch", userid);
		return list;
	}

	public int follow(Map<String, String> map){
		return sqlsession.insert("memberns.follow", map);
	}
}
