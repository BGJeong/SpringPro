package mem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	StringBuffer query;
	
	private static MemDAO instance;
	private MemDAO() {}
	public static MemDAO getInstance() {
		if(instance == null) {
			instance = new MemDAO();
		}
		return instance;
	}
	public Connection getConnection() throws Exception {
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		Connection con = ds.getConnection();
		return con;
	}

	public void disconnection() throws Exception {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
	
	public int joinMem(MemDTO user) throws Exception {
		int result = 0;
		query = new StringBuffer("insert into mem values (");
		query.append("mem_seq.nextval, ?, ?, ?, 'Y', 'N', 'name','nick', ");
		query.append("'N', sysdate, null, 'N', null) ");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, user.getMem_uid());
		pstmt.setString(2, user.getMem_email());
		pstmt.setString(3, user.getMem_passwd());
		result = pstmt.executeUpdate();
		disconnection();
		return result;
	}
	
	public int login(String id, String passwd) throws Exception {
		query = new StringBuffer("select mem_passwd from mem where mem_uid = ?");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			if(rs.getString(1).equals(passwd)) {
				return 1;
			} else {
				return 0;
			}
		}
		disconnection();
		return -1;
	}
	
	public MemDTO mypage(String id) throws Exception {
		query = new StringBuffer("select * from mem where mem_uid = ?");
		MemDTO user = new MemDTO();
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			user.setMem_uid(rs.getString(2));
			user.setMem_email(rs.getString(3));
			user.setMem_passwd(rs.getString(4));
			user.setMem_regtime(rs.getDate(10));
		}
		disconnection();
		return user;
	}
	public int checkUserName(String id) throws Exception {
		query = new StringBuffer("select mem_uid from mem where mem_uid=?");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return 1;
		} else {
			return 0;
		}
	}
	public String getPass(String id) throws Exception {
		String p = "";
		query = new StringBuffer("select mem_passwd from me where mem_uid = ?");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			p = rs.getString(1);
		} 
		return p;
	}
}
