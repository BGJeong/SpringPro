<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY년 MM월 dd일 / hh시mm분ss초 E요일");
	
	Timestamp ts = new Timestamp(System.currentTimeMillis());
	
	Calendar c = Calendar.getInstance();
	int y = c.get(Calendar.YEAR);
	int m = c.get(Calendar.MONTH)+1;
	int dd = c.get(Calendar.DAY_OF_MONTH);
	int h = c.get(Calendar.HOUR_OF_DAY);
	int mm = c.get(Calendar.MINUTE);
	int ss = c.get(Calendar.SECOND);
	
	int week = c.get(Calendar.DAY_OF_MONTH);
	String[] weekend = {"일", "월", "화", "수", "목","금","토"};
%>
<%= sdf.format(d) %><br>
<%= ts %><br>
<%=week %>
<%=y%>-<%=m%>-<%=dd%>  <%=h%>:<%=mm%>:<%=ss%>

