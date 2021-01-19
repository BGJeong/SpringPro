package com.home.pro.service;

import java.util.ArrayList;
import java.util.Map;

import com.home.pro.DTO.memberDTO;

public interface MemberService {

	public void insert(memberDTO dto) throws Exception;
	public int idcheck(String id) throws Exception;
	public memberDTO login(String userid) throws Exception;
	public memberDTO findpwd(String id) throws Exception;
	public void edit(memberDTO dto) throws Exception;
	public void deleteMember(String userid) throws Exception;
	public ArrayList<memberDTO> searchAction(String userid) throws Exception;
	public int follow(Map<String, String> map) throws Exception;
}
