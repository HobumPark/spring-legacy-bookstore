package spring.com.dao;

import java.util.List;

import spring.com.dto.BasketVO;
import spring.com.dto.BookVO;

public interface BookDAO {

	public int addBookBasket(String bookCover,String bookTitle,int bookPrice,
			int amount,int totalPrice,String userID) throws Exception;
    
	public List<BasketVO> getBookBasketWhereId(String userID) throws Exception;
	
	public List<BookVO> getBooksByTitle(String title) throws Exception;
	
	public BookVO getBooksByRegNo(String regNo) throws Exception;
	
	public List<BookVO> getBooksByTitleLimit(String title) throws Exception;
	
	public int getAllBookCount() throws Exception;
	
	public int getSearchBookCount(String title) throws Exception;
	
	public List<BookVO> getBooksByTitleLimitPage(String title,int page);

}
