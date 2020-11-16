package JavaBeanMember.register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class LogonDBBean {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	StringBuffer query;
	private static LogonDBBean instance;

	public static LogonDBBean getInstance() {
		if (instance == null) {
			instance = new LogonDBBean();
		}
		return instance;
	}

	public Connection getConnection() throws Exception {
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "scott";
		String dbPass = "tiger";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		return con;
	}

	public void disconnection() throws Exception {
		if (rs != null)	rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}

	public int insertMember(LogonDataBean user) throws Exception {
		int result = 0;
		query = new StringBuffer("insert into member2"); 
		query.append(" values(?, ?, ?, ?, ?, ?, ?, sysdate)");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPasswd());
		pstmt.setString(3, user.getName());
		pstmt.setString(4, user.getJumin1());
		pstmt.setString(5, user.getJumin2());
		pstmt.setString(6, user.getEmail());
		pstmt.setString(7, user.getBlog());
		result = pstmt.executeUpdate();
		disconnection();
		return result;
	}

	public ArrayList<LogonDataBean> selectMember() throws Exception {
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		query = new StringBuffer("select * from member2");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			LogonDataBean user = new LogonDataBean();
			user.setId(rs.getString(1));
			user.setPasswd(rs.getString(2));
			user.setName(rs.getString(3));
			user.setJumin1(rs.getString(4));
			user.setJumin2(rs.getString(5));
			user.setEmail(rs.getString(6));
			user.setBlog(rs.getString(7));
			user.setReg_date(rs.getTimestamp(8));
			list.add(user);
		}
		disconnection();
		return list;
	}

	public LogonDataBean updateForm(String id) throws Exception {
		query = new StringBuffer("select * from member2");
		query.append(" where id = ?");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		LogonDataBean user = new LogonDataBean();
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			user.setId(rs.getString(1));
			user.setPasswd(rs.getString(2));
			user.setName(rs.getString(3));
			user.setJumin1(rs.getString(4));
			user.setJumin2(rs.getString(5));
			user.setEmail(rs.getString(6));
			user.setBlog(rs.getString(7));
			user.setReg_date(rs.getTimestamp(8));
		}
		disconnection();
		return user;
	}
	
	public int update(LogonDataBean bean) throws Exception {
		int result = 0;
		query = new StringBuffer("UPDATE member2 ");
		query.append("SET passwd = ?, name = ?, jumin1 = ?, jumin2 = ?");
		query.append(", email = ?, blog = ?, reg_date=sysdate ");
		query.append("WHERE id = ? ");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, bean.getPasswd());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getJumin1());
		pstmt.setString(4, bean.getJumin2());
		pstmt.setString(5, bean.getEmail());
		pstmt.setString(6, bean.getBlog());
		pstmt.setString(7, bean.getId());
		result = pstmt.executeUpdate();
		disconnection();
		return result;
	}
	
	public int delete(LogonDataBean bean) throws Exception {
		int result = 0;
		query = new StringBuffer("DELETE FROM member2 ");
		query.append("where id = ?");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, bean.getId());
		result = pstmt.executeUpdate();
		disconnection();
		return result;
	}
	
	public int login(String id, String passwd) throws Exception {
		query = new StringBuffer("select passwd from member2");
		query.append(" where id = ?");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			if(rs.getString(1).equals(passwd)) {
				return 1;
			}else {
				return 0;
			}
		}
		disconnection();
		return -1;
	}
	
	public LogonDataBean myPage(String id) throws Exception{
		query = new StringBuffer("select * from member2 where id = ?");
		LogonDataBean user = new LogonDataBean();
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			user.setId(rs.getString(1));
			user.setPasswd(rs.getString(2));
			user.setName(rs.getString(3));
			user.setJumin1(rs.getString(4));
			user.setJumin2(rs.getString(5));
			user.setEmail(rs.getString(6));
			user.setBlog(rs.getString(7));
			user.setReg_date(rs.getTime(8));
		}
		disconnection();
		return user;
	}
}










