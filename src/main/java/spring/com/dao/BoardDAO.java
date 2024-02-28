package spring.com.dao;

import java.util.List;

import spring.com.dto.NestedComment;
import spring.com.dto.NoticeBoardVO;
import spring.com.dto.UserBoardComment;
import spring.com.dto.UserBoardVO;

public interface BoardDAO {
	public List<NoticeBoardVO> getNoticeBoardList() throws Exception;

	public List<NoticeBoardVO> getNoticeBoardListLimit(int page) throws Exception;
	
	public int getNoticeBoardListCount() throws Exception;
	
	public NoticeBoardVO getNoticeBoardByNo(int no) throws Exception;
	
	public List<UserBoardVO> getUserBoardList() throws Exception;
	
	public List<UserBoardVO> getUserBoardListLimit(int page) throws Exception;
	
	public int getUserBoardListCount() throws Exception;
	
	public UserBoardVO getUserBoardByNo(int no) throws Exception;
	
	public int userBoardWrite(UserBoardVO vo) throws Exception;
	
	public int updateUserBoardByNo(UserBoardVO vo) throws Exception;
	
	public int deleteUserBoardByNo(int no) throws Exception;
	/*댓글 관련*/
	public List<UserBoardComment> getUserBoardComment(int no) throws Exception;
	
	public List<UserBoardComment> getUserBoardCommentLimit(int no,int page) throws Exception;
	
	public int getUserBoardCommentCount(int no) throws Exception;
	
	public int userBoardCommentWrite(UserBoardComment vo) throws Exception;
	
	public List<NestedComment> getNestedComment(int cid) throws Exception;

}
