<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	public int add(int a , int b) {
		int c = a +b;
		return c;
	}
	public int subtract(int a, int b){
		int c= a-b;
		return c;
	}
	public int multiply(int a, int b){
		int c=a*b;
		return c;
	}
%>

<% 
	int result1 = add(1,3); 
	int result2 = subtract(3,1);
	int result3 = multiply(2,4);
%>
<%= result1 %>
<%= result2 %>
<%= result3 %>