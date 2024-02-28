package spring.com.dto;

public class NoticeBoardVO {
	private int no;
	private String title;
	private String contents;
	private String type;
	private String writeDate;
	private int hits;
	
	public NoticeBoardVO() {
		
	}
	
	public NoticeBoardVO(int no,String title,String contents,
			String type,String writeDate,int hits) {
		this.no=no;
		this.title=title;
		this.contents=contents;
		this.type=type;
		this.writeDate=writeDate;
		this.hits=hits;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	
	public int getHits() {
		return hits;
	}


	public void setHits(int hits) {
		this.hits = hits;
	}
	
	public void showNoticeBoardInfo() {
		System.out.println("no:"+no);
		System.out.println("title"+title);
		System.out.println("contents:"+contents);
		System.out.println("type:"+type);
		System.out.println("writeDate:"+writeDate);
		System.out.println("hits:"+hits);
	}
}
