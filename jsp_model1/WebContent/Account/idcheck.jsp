<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mem.MemDAO"%>
<%	
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("username");
	MemDAO dao = MemDAO.getInstance();
	int result = dao.checkUserName(name);
%>
<%=result%>