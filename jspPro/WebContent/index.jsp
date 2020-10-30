<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Ex.ExClass" %>
<%
	int a = 10;
String s = "jsp";
String s2 = new String("jsp");
String s3 = "jsp";
boolean b;
if (s == s3) {
	b = true;
} else {
	b = false;
}

String[] str = { "자바", "jsp", "oracle" };
%>
출력 :
<%=s%><br>
정수 :
<%=b%><br>
<%
	for (int i = 0; i < str.length; i++) {
%>
<%=str[i]%>
<%
	}
%>

<%
	
%>
















