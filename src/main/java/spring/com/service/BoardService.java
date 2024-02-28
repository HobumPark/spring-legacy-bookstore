package spring.com.service;

import java.util.List;

import spring.com.dto.NoticeBoardVO;
import spring.com.dto.UserBoardVO;
import spring.com.dto.UserBoardComment;
import spring.com.dto.NestedComment;

public interface BoardService {
	List<NoticeBoardVO> getNoticeBoardList() throws Exception;
	
	List<NoticeBoardVO> getNoticeBoardListLimit(int page) throws Exception;
	
	int getNoticeBoardListCount() throws Exception;
	
	NoticeBoardVO getNoticeBoardByNo(int no) throws Exception;
	
	List<UserBoardVO> getUserBoardList() throws Exception;
	
	List<UserBoardVO> getUserBoardListLimit(int page) throws Exception;
	
	int getUserBoardListCount() throws Exception;
	
	UserBoardVO getUserBoardByNo(int no) throws Exception;
	
	int userBoardWrite(UserBoardVO vo) throws Exception;
	
	int updateUserBoardByNo(UserBoardVO vo) throws Exception;
	
	int deleteUserBoardByNo(int no) throws Exception;
	
	/*댓글관련*/
	List<UserBoardComment> getUserBoardComment(int no) throws Exception;
	
	List<UserBoardComment> getUserBoardCommentLimit(int no,int page) throws Exception;
	
	int getUserBoardCommentCount(int no) throws Exception;
	
	int userBoardCommentWrite(UserBoardComment vo) throws Exception;
	
	/*대댓글관련*/
	List<NestedComment> getNestedComment(int cid) throws Exception;
	
	
	
}
