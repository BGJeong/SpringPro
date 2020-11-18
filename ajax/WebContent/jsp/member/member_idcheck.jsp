<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.*" %>
<%
 request.setCharacterEncoding("UTF-8");
 
 String id=request.getParameter("memid"); 
 System.out.println("id="+id);// id="test";
 
 MemberDAOImpl md=new MemberDAOImpl();

 int re=md.checkMemberId(id);
 //1이면 중복 -1이면 사용가능 아이디

 out.println(re);
%>
 