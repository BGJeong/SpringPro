package JavaBeanBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BbsDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	StringBuffer query;
	private static BbsDAO instance;
	private BbsDAO() {}
	public static BbsDAO getInstance() {
		if (instance == null) {
			instance = new BbsDAO();
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
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}

	public int writeAction(String title, String content, String id) throws Exception {
		int result = 0;
		query=new StringBuffer("insert into board2");
		query.append(" values(tmp_seq2.NEXTVAL, ?, ?, 0, ?, sysdate)");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, id);
		result = pstmt.executeUpdate();
		disconnection();
		return result;
	}

	public ArrayList<BbsDTO> getList(int startRow, int endRow) throws Exception{
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		query = new StringBuffer("select * from ");
		query.append("(select rownum rn, bbsid, bbstitle, bbscontent, bbsavailable, id, reg_date_board from ");
		query.append("(select * from board2 order by bbsid desc)) where rn between ? and ?");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			BbsDTO user = new BbsDTO();
			user.setBbsid(rs.getInt("bbsid"));
			user.setBbsTitle(rs.getString("bbstitle"));
			user.setBbsContent(rs.getString("bbscontent"));
			user.setBbsAvailable(rs.getInt("bbsavailable"));
			user.setId(rs.getNString("id"));
			user.setReg_date_board(rs.getTimestamp("reg_date_board"));
			list.add(user);
		}
		disconnection();
		return list;
	}
	
	public int getCount() throws Exception {
		query = new StringBuffer("select count(*) from board2");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	
	public BbsDTO getView(int Bbsid) throws Exception {
		query = new StringBuffer("select * from board2 where bbsid = ?");
		BbsDTO user = new BbsDTO();
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, Bbsid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			user.setBbsid(rs.getInt(1));
			user.setBbsTitle(rs.getString(2));
			user.setBbsContent(rs.getString(3));
			user.setBbsAvailable(rs.getInt(4));
			user.setId(rs.getString(5));
			user.setReg_date_board(rs.getTimestamp(6));
			disconnection();
			return user;
		}
		return null;
	}

	public int updateAction(String bbstitle, String bbscontent, int bbsid) throws Exception {
		int result = 0;
		query = new StringBuffer("update board2 set bbstitle=?, bbscontent=?, reg_date_board=sysdate ");
		query.append("where bbsid=?");
		conn = getConnection();
		pstmt=conn.prepareStatement(query.toString());
		pstmt.setString(1, bbstitle);
		pstmt.setString(2, bbscontent);
		pstmt.setInt(3, bbsid);
		result = pstmt.executeUpdate();
		disconnection();
		return result;
	}

	public int deleteAction(int bbsid) throws Exception {
		int result = 0;
		query = new StringBuffer("update board2 set bbsavailable=1 where bbsid = ?");
		conn = getConnection();
		pstmt=conn.prepareStatement(query.toString());
		pstmt.setInt(1, bbsid);
		result = pstmt.executeUpdate();
		disconnection();
		return result;
	}
	
	
	
}