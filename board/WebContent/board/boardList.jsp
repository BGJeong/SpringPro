<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDBBean" %>
<%@ page import="board.BoardDataBean" %>
<%@ page import="java.util.*" %>
<%
	int page_size = 10;
	
	String pageNum = request.getParameter("page");
	if(pageNum == null){
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	
	int startRow = ( currentPage -1) * page_size +1;
	int endRow = currentPage * page_size;
	
	int count = 0;
	
	BoardDBBean dao = BoardDBBean.getInstance();
	count = dao.getCount();
	System.out.println(count);
	
	ArrayList<BoardDataBean> list = null;
	if(count > 0) {
		list = dao.getList(startRow, endRow);
	}
	System.out.println(list);
	
%>