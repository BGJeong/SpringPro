<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.Mongo"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.DBObject"%>
<%@ page import="com.mongodb.BasicDBObject"%>

<%-- MongoDB CLI 창에서 검색
    > show dbs          		데이터베이스 목록
    > use test          		test 데이터베이스 선택
    > show collections			collection 목록 
	> db.board.find().pretty()
--%>

<a href="mongoForm.jsp">글쓰기</a><br><br>

<%
	Mongo mongo = null;
	DB db = null;
	DBCollection dbcol = null;
	DBCursor cursor = null;

	try {
		mongo = new Mongo("localhost", 27017);
		db = mongo.getDB("test");

		dbcol = db.getCollection("board");				
		
		cursor = dbcol.find();
		while (cursor.hasNext()) {
			DBObject result = cursor.next();
			out.println(result+"<br>");
//			System.out.println(result);
		}
		
	} catch (Exception e) {
		System.out.println("에러 발생");
	} finally {
		try {
			if (cursor != null)	cursor.close();
		} catch (Exception e) {}		
		try{
			if(mongo != null) mongo.close();
		}catch(Exception e){}
	}
	
%>

