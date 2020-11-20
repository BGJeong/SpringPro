// DAO(Data Access Object)
package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	
	// 싱글톤 : 객체 생성을 1번만 수행
	private static BoardDBBean instance = new BoardDBBean();
	StringBuffer query;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	// Connection Pool에서 컨넥션을 구해오는 메소드
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		return  ds.getConnection();
	}
	public void disconnection() throws Exception {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
	
	//글작성
	public int writeAction(BoardDataBean user) throws Exception {
		int result=0;
		query = new StringBuffer("insert into board0 values ");
		query.append("(board0_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?)");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, user.getWriter());
		pstmt.setString(2, user.getEmail());
		pstmt.setString(3, user.getSubject());
		pstmt.setString(4, user.getPasswd());
		pstmt.setInt(5, user.getReadcount());
		pstmt.setString(6, user.getContent());
		pstmt.setString(7, user.getIp());
		result = pstmt.executeUpdate();
		disconnection();
		return result;
	}
	public ArrayList<BoardDataBean> getList() throws Exception {
		query = new StringBuffer("select * from board0 order by num desc");
		conn = getConnection();
		ArrayList<BoardDataBean> list = new ArrayList<BoardDataBean>();
		pstmt = conn.prepareStatement(query.toString());
		rs = pstmt.executeQuery();
		while(rs.next()) {
			BoardDataBean user = new BoardDataBean();
			user.setNum(rs.getInt(1));
			user.setWriter(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setSubject(rs.getString(4));
			user.setPasswd(rs.getString(5));
			user.setReg_date(rs.getTimestamp(6));
			user.setReadcount(rs.getInt(7));
			user.setContent(rs.getString(8));
			user.setIp(rs.getString(9));
			list.add(user);
		}
		disconnection();
		return list;
	}

	public int getCount() throws Exception {
		query = new StringBuffer("select count(*) from board0");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return rs.getInt(1);
		}
		disconnection();
		return 0;
	}
	
	public ArrayList<BoardDataBean> getList(int startRow, int endRow) throws Exception {
		ArrayList<BoardDataBean> list = new ArrayList<BoardDataBean>();
		
		return list;
	}
}
