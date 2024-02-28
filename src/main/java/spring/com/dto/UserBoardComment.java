package spring.com.dto;

public class UserBoardComment {
	private int bno;
	private int cid;
	private String writer;
	private String contents;
	
	public UserBoardComment() {
		
	}
	
	public UserBoardComment(int bno,String writer,String contents) {
		this.bno=bno;
		this.writer=writer;
		this.contents=contents;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public void showInfo() {
		System.out.println("bno:"+bno);
		System.out.println("cid:"+cid);
		System.out.println("writer"+writer);
		System.out.println("contents:"+contents);
	}
}
