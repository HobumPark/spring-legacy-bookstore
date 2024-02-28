package spring.com.dao;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import spring.com.dto.BasketVO;
import spring.com.dto.BookVO;

@Repository
public class BookDAOImpl implements BookDAO {
	
	@Inject
    private SqlSession sqlSession;

    private static final String bookNamespace = "spring.com.mapper.bookMapper";
    
    public int addBookBasket(String bookCover,String bookTitle,int bookPrice,
			int amount,int totalPrice,String userID){
		BasketVO vo = new BasketVO(bookCover,bookTitle,bookPrice,amount,totalPrice,userID);
		return sqlSession.insert(bookNamespace+".insertBasket",vo);
	}
    
    @Override
    public List<BasketVO> getBookBasketWhereId(String userID){
    	return sqlSession.selectList(bookNamespace+".selectBookBasketWhereUserId",userID);
    }
    
    @Override
	public List<BookVO> getBooksByTitle(String title) {
		return sqlSession.selectList(bookNamespace+".selectBooksByTitle",title);
	}
	
	@Override
	public List<BookVO> getBooksByTitleLimit(String title) {
		return sqlSession.selectList(bookNamespace+".selectBooksByTitleLimit",title);
	}
	
	@Override
	public List<BookVO> getBooksByTitleLimitPage(String title,int page) {	
		HashMap map = new HashMap();

		map.put("title", title);
		map.put("page", page);
		return sqlSession.selectList(bookNamespace+".selectBooksByTitleLimitPage",map);
	}
	
	@Override
	public int getAllBookCount() {
		return sqlSession.selectOne(bookNamespace+".selectCount");
	}
	
	@Override
	public int getSearchBookCount(String title) throws Exception{
		
		return sqlSession.selectOne(bookNamespace+".selectCountByTitle",title);
	}

	@Override
	public BookVO getBooksByRegNo(String regNo) throws Exception {
		return sqlSession.selectOne(bookNamespace+".selectCountByRegNo",regNo);
	}
}
