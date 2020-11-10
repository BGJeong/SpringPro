<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<html>
<head><title>테이블의 레코드를 화면에 표시하는 예제</title></head>
<body>
  <h2>member1 테이블의 레코드를 화면에 표시하는 예제</h2>
  
  <a href="insertTestForm.jsp" class="btn btn-right">회원가입</a>
  <TABLE class="table" width="550" border="1">
  <thead class="thead-dark">
  <TR>
  	<th scope="col" width="100">아이디</th>
  	<th scope="col" width="100">패스워드</th>
  	<th scope="col" width="100">이름</th>
  	<th scope="col" width="100">가입일자</th>
  	<th scope="col" width="100">수정</th>
  	<th scope="col" width="100">삭제</th>
  </TR>
	</thead>
<%
  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;
  ResultSet rs01=null;
  int cnt=0;
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분 E요일");
  try{
	String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
    String dbId="scott";
    String dbPass="tiger";
	 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

	pstmt=conn.prepareStatement("select count(*) from member1");
	rs01=pstmt.executeQuery();
	if(rs01.next()){
		cnt = rs01.getInt(1);
	}	
	
	String sql= "select * from member1";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	while(rs.next()){
	  String id= rs.getString("id");
      String passwd= rs.getString("passwd");
      String name= rs.getString("name");
      Timestamp register=rs.getTimestamp("reg_date");

%>
     <TR>
  	   <TD width="100"><%=id%></TD>
  	   <TD width="100"><%=passwd%></TD>
  	   <TD width="100"><%=name%></TD>
  	   <TD width="250"><%=sdf.format(register)%></TD>
  	   <TD width="100">
  	   		<a class="btn btn-right" href="updateTestForm.jsp?id=<%=id%>">
  	  		 수정
  	   		</a>  	   
  	   </TD>
  	   <TD width="100">
  	   		<a class="btn btn-right" href="deleteTestForm.jsp?id=<%=id %>">
  	   		 삭제
  	   		</a>
  	   </TD>
    </TR>
<%  } 
  }catch(Exception e){ 
		e.printStackTrace();
  }finally{
	    if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
  }
%>
</TABLE>

총 회원수:<%=cnt %>명


</body>
</html>