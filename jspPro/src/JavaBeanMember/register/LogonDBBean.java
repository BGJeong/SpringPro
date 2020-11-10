package JavaBeanMember.register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
		if (rs != null) {
			rs.close();
		}
		pstmt.close();
		conn.close();
	}

	public int insertMember(LogonDataBean ldb) throws Exception {
		conn = getConnection();
		query = new StringBuffer("insert into member2"); 
		query.append(" values(?, ?, ?, ?, ?, ?, ?, sysdate)");
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, ldb.getId());
		pstmt.setString(2, ldb.getPasswd());
		pstmt.setString(3, ldb.getName());
		pstmt.setString(4, ldb.getJumin1());
		pstmt.setString(5, ldb.getJumin2());
		pstmt.setString(6, ldb.getEmail());
		pstmt.setString(7, ldb.getBlog());
		int result = pstmt.executeUpdate();
		disconnection();
		return result;
	}

	public ArrayList<LogonDataBean> selectMember() throws Exception {
		conn = getConnection();
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		query = new StringBuffer("select * from member2");
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
		conn = getConnection();
		query = new StringBuffer("select * from member2");
		query.append(" where id = ?");
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
		conn = getConnection();
		query = new StringBuffer("UPDATE member2 ");
		query.append("SET passwd = ?, name = ?, jumin1 = ?, jumin2 = ?");
		query.append(", email = ?, blog = ?, reg_date=sysdate ");
		query.append("WHERE id = ? ");
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, bean.getPasswd());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getJumin1());
		pstmt.setString(4, bean.getJumin2());
		pstmt.setString(5, bean.getEmail());
		pstmt.setString(6, bean.getBlog());
		pstmt.setString(7, bean.getId());
		int result = pstmt.executeUpdate();
		disconnection();
		return result;
	}
	
	public int delete(LogonDataBean bean) throws Exception {
		conn = getConnection();
		query = new StringBuffer("DELETE FROM member2 ");
		query.append("where id = ?");
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, bean.getId());
		int result = pstmt.executeUpdate();
		disconnection();
		return result;
	}
	
	public int login(String id, String passwd) throws Exception {
		conn = getConnection();
		query = new StringBuffer("select passwd from member2");
		query.append(" where id = ?");
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
}










