package spring.com.dto;

public class NestedComment {
	private int cid;
	private int ncid;
	private String writer;
	private String contents;
	
	public NestedComment(int cid,int ncid,String writer,String contents) {
		this.cid=cid;
		this.ncid=ncid;
		this.writer=writer;
		this.contents=contents;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getNcid() {
		return ncid;
	}

	public void setNcid(int ncid) {
		this.ncid = ncid;
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
}
