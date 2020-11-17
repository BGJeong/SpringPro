package board;

import java.sql.Date;

public class BoardDTO {
	private int boardid;
	private String boardtitle;
	private String boardcontent;
	private int boardavailable;
	private String mem_uid;
	private Date reg_date_board;
	public int getBoardid() {
		return boardid;
	}
	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public int getBoardavailable() {
		return boardavailable;
	}
	public void setBoardavailable(int boardavailable) {
		this.boardavailable = boardavailable;
	}
	public String getMem_uid() {
		return mem_uid;
	}
	public void setMem_uid(String mem_uid) {
		this.mem_uid = mem_uid;
	}
	public Date getReg_date_board() {
		return reg_date_board;
	}
	public void setReg_date_board(Date reg_date_board) {
		this.reg_date_board = reg_date_board;
	}
	
	
}
