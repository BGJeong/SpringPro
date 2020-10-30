<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.Mongo" %>
<%@ page import="com.mongodb.DB" %>
<%@ page import="com.mongodb.DBCollection" %>
<%@ page import="com.mongodb.DBCursor" %>
<%@ page import="com.mongodb.DBObject" %>
<%@ page import="com.mongodb.BasicDBObject" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");

	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	
	Mongo mongo = null;
	DB db = null;
	DBCollection dbcol = null;
	BasicDBObject data = null;
	List list = new ArrayList();
	
	try {
		mongo = new Mongo("localhost", 27017);
		db = mongo.getDB("test");
		dbcol = db.getCollection("board");	
		
		data = new BasicDBObject();			
		data.append("name", name);
		data.append("subject", subject);
		data.append("content", content);
		
		list.add(data);	
		
		dbcol.insert(list);
		
	} catch (Exception e) {
		System.out.println("에러 발생");
	}finally{		
		try{
			if(mongo != null) mongo.close();
		}catch(Exception e){}
	}	
%>  

<%=name %><br>
<%=subject %><br>
<%=content %><br> 

<script>
	alert("저장 성공");
	location.href="mongolist.jsp";
</script>
 