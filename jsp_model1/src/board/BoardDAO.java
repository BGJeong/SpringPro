package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;

public class BoardDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	StringBuffer query;
	private static BoardDAO instance;
	private BoardDAO() {}
	public static BoardDAO getInstance() {
		if (instance == null) {
			instance = new BoardDAO();
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
		query=new StringBuffer("insert into board");
		query.append(" values(brd_seq.NEXTVAL, ?, ?, 0, ?, sysdate)");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, id);
		result = pstmt.executeUpdate();
		disconnection();
		return result;
	}

	public ArrayList<BoardDTO> getList(int startRow, int endRow) throws Exception{
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		query = new StringBuffer("select * from ");
		query.append("(select rownum rn, boardid, boardtitle, boardcontent, boardavailable, mem_uid, reg_date_board from ");
		query.append("(select * from board order by boardid desc)) where rn between ? and ?");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, endRow);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			BoardDTO user = new BoardDTO();
			user.setBoardid(rs.getInt("boardid"));
			user.setBoardtitle(rs.getString("boardtitle"));
			user.setBoardcontent(rs.getString("boardcontent"));
			user.setBoardavailable(rs.getInt("boardavailable"));
			user.setMem_uid(rs.getNString("mem_uid"));
			user.setReg_date_board(rs.getDate("reg_date_board"));
			list.add(user);
		}
		disconnection();
		return list;
	}
	
	public int getCount() throws Exception {
		query = new StringBuffer("select count(*) from board");
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	
	public BoardDTO getView(int Bbsid) throws Exception {
		query = new StringBuffer("select * from board where boardid = ?");
		BoardDTO user = new BoardDTO();
		conn = getConnection();
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, Bbsid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			user.setBoardid(rs.getInt(1));
			user.setBoardtitle(rs.getString(2));
			user.setBoardcontent(rs.getString(3));
			user.setBoardavailable(rs.getInt(4));
			user.setMem_uid(rs.getString(5));
			user.setReg_date_board(rs.getDate(6));
			disconnection();
			return user;
		}
		return null;
	}

	public int updateAction(String bbstitle, String bbscontent, int bbsid) throws Exception {
		int result = 0;
		query = new StringBuffer("update board set boardtitle=?, boardcontent=?, reg_date_board=sysdate ");
		query.append("where boardid=?");
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
		query = new StringBuffer("delete from board where boardid = ?");
		conn = getConnection();
		pstmt=conn.prepareStatement(query.toString());
		pstmt.setInt(1, bbsid);
		result = pstmt.executeUpdate();
		disconnection();
		return result;
	}
	
	
	
}