package spring.com.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import spring.com.dao.BookDAO;
import spring.com.dto.BasketVO;
import spring.com.dto.BookVO;

@Service
public class BookServiceImpl implements BookService {
 
    @Inject
    private BookDAO dao;

	@Override
	public int addBookBasket(String bookCover,String bookTitle,int bookPrice,
			int amount,int totalPrice,String userID) throws Exception {
		return dao.addBookBasket(bookCover,bookTitle,bookPrice,amount,totalPrice,userID);
	}
	
	public List<BasketVO> getBookBasketWhereId(String userID) throws Exception{
		return dao.getBookBasketWhereId(userID);
	}
	
	
	@Override
    public List<BookVO> getBooksByTitle(String title) throws Exception {
 
        return dao.getBooksByTitle(title);
    }
	
	@Override
    public List<BookVO> getBooksByTitleLimit(String title) throws Exception {
        return dao.getBooksByTitleLimit(title);
    }
	
	@Override
    public List<BookVO> getBooksByTitleLimitPage(String title,int page) throws Exception {
        return dao.getBooksByTitleLimitPage(title,page);
    }
	
	@Override
	public int getAllBookCount() throws Exception{
		
		return dao.getAllBookCount();
	}
	@Override
	public int getSearchBookCount(String title) throws Exception{
		
		return dao.getSearchBookCount(title);
	}

	@Override
	public BookVO getBooksByRegNo(String regNo) throws Exception {
		return dao.getBooksByRegNo(regNo);
	}
}
