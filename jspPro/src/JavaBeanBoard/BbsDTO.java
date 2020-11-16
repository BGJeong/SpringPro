package JavaBeanBoard;

import java.sql.Timestamp;

public class BbsDTO {
	private int bbsid;
	private String bbsTitle;
	private String bbsContent;
	private int bbsAvailable;
	private String id;
	private Timestamp reg_date_board;
	public Timestamp getReg_date_board() {
		return reg_date_board;
	}
	public void setReg_date_board(Timestamp reg_date_board) {
		this.reg_date_board = reg_date_board;
	}
	
	public int getBbsid() {
		return bbsid;
	}
	public void setBbsid(int bbsid) {
		this.bbsid = bbsid;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
