package spring.com.dto;

public class UserBoardVO {
	private int no;
	private String id;
	private String password;
	private String name;
	private String title;
	private String contents;
	private String writeDate;
	private int hits;
	private int commentCount;
	private String fileAttach;
	private String fileName;
	
	public UserBoardVO() {
			
	}
	
	public UserBoardVO(int no,String id,String password,String name,
			String title,String contents,String writeDate,int hits,
			int commentCount,String fileAttach,String fileName) {
		this.no=no;
		this.id=id;
		this.password=password;
		this.name=name;
		this.title=title;
		this.contents=contents;
		this.writeDate=writeDate;
		this.hits=hits;
		this.commentCount=commentCount;
		this.fileAttach=fileAttach;
		this.fileName=fileName;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	public int getCommentCount() {
		return commentCount;
	}
	
	public void setCommenctCount(int commentCount) {
		this.commentCount=commentCount;
	}
	
	public String getFileAttach() {
		return fileAttach;
	}
	
	public void setFileAttach(String fileAttach) {
		this.fileAttach = fileAttach;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public void showNoticeBoardInfo() {
		System.out.println("no:"+no);
		System.out.println("id:"+id);
		System.out.println("password:"+password);
		System.out.println("name:"+name);
		System.out.println("title"+title);
		System.out.println("contents:"+contents);
		System.out.println("writeDate:"+writeDate);
		System.out.println("hits:"+hits);
		System.out.println("commentCount:"+commentCount);
	}
	
}
