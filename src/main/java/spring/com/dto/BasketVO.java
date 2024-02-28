package spring.com.dto;

public class BasketVO {
	private String bookCover;
	private String bookTitle;
	private int bookPrice;
	private int amount;
	private int totalPrice;
	private String userID;
	
	public BasketVO() {
		
	}
	
	public BasketVO(String bookCover,String bookTitle,int bookPrice,
			int amount,int totalPrice,String userID) {
		this.bookCover=bookCover;
		this.bookTitle=bookTitle;
		this.bookPrice=bookPrice;
		this.amount=amount;
		this.totalPrice=totalPrice;
		this.userID=userID;
	}
	
	public String getBookCover() {
		return bookCover;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public int getAmount() {
		return amount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public String getUserID() {
		return userID;
	}
	
	public void showBasketInfo() {
		System.out.println("bookCover:"+this.bookCover);
		System.out.println("bookTitle:"+this.bookTitle);
		System.out.println("bookPrice:"+this.bookPrice);
		System.out.println("amount:"+this.amount);
		System.out.println("totalPrice:"+this.totalPrice);
		System.out.println("userID:"+this.userID);
	}
}
