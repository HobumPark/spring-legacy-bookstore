package spring.com.dto;

public class BookVO {
	private String regNo;
	private String title;
	private String subTitle;
	private String author;
	private String publishingCompany;
	private String publishingDate;
	private double userRating;
	private int price;
	private int discountedPrice;
	private int ebookPrice;
	private String coverImg;
	
	public BookVO() {
		
	}
	
	public BookVO(String regNo,String title,String subTitle,String author
	,String publishingCompany,String publishingDate,double userRating,int price,
	int discountedPrice,int ebookPrice,String coverImg) {
		this.regNo=regNo;
		this.title=title;
		this.subTitle=subTitle;
		this.author=author;
		this.publishingCompany=publishingCompany;
		this.publishingDate=publishingDate;
		this.userRating=userRating;
		this.price=price;
		this.discountedPrice=discountedPrice;
		this.ebookPrice=ebookPrice;
		this.coverImg=coverImg;
	}
	
	public String getRegNo() {
        return regNo;
    }
 
    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }
	
	public String getTitle() {
        return title;
    }
 
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getSubTitle() {
        return subTitle;
    }
    
    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }
    
    public String getAuthor() {
        return author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    
    public String getPublishingCompany() {
        return publishingCompany;
    }
    
    public void setPublishingCompany(String publishingCompany) {
        this.publishingCompany = publishingCompany;
    }
    
    public String getPublishingDate() {
        return publishingDate;
    }
    
    public void setPublishingDate(String publishingDate) {
        this.publishingDate = publishingDate;
    }
	
    public double getUserRating() {
        return userRating;
    }
    
    public void setUserRating(double userRating) {
        this.userRating = userRating;
    }
    
    public double getPrice() {
        return price;
    }
    
    public void setPrice(int price) {
        this.price = price;
    }
    
    public double getDiscountedPrice() {
        return discountedPrice;
    }
    
    public void setDiscountedPrice(int discountedPrice) {
        this.discountedPrice = discountedPrice;
    }
    
    public double getEbookPrice() {
        return ebookPrice;
    }
    
    public void setEbookPrice(int ebookPrice) {
        this.ebookPrice = ebookPrice;
    }
    
    public String getCoverImg() {
        return coverImg;
    }
    
    public void setCoverImg(String coverImg) {
        this.coverImg = coverImg;
    }
    
	public void showBookInfo() {
		System.out.printf("title:%s\n", title);
		System.out.printf("subTitle:%s\n", subTitle);
		System.out.printf("author:%s\n", author);
		System.out.printf("publishingCompany:%s\n", publishingCompany);
		System.out.printf("publishingDate:%s\n", publishingDate);
		System.out.printf("userRating:%s\n", userRating);
		System.out.printf("price:%s\n", price);
		System.out.printf("discountedPrice:%s\n", discountedPrice);
		System.out.printf("ebookPrice:%s\n", ebookPrice);
		System.out.printf("coverImg:%s\n", coverImg);
	}
}
