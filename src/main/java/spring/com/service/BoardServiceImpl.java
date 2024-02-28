package spring.com.service;

import java.util.List;

import javax.inject.Inject;

import spring.com.dao.BoardDAO;
import spring.com.dto.NestedComment;
import spring.com.dto.NoticeBoardVO;
import spring.com.dto.UserBoardComment;
import spring.com.dto.UserBoardVO;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
    private BoardDAO dao;
	
	@Override
	public List<NoticeBoardVO> getNoticeBoardList() throws Exception{		
		return dao.getNoticeBoardList();
	}

	@Override
	public List<NoticeBoardVO> getNoticeBoardListLimit(int page) throws Exception {
		return dao.getNoticeBoardListLimit(page);
	}

	@Override
	public int getNoticeBoardListCount() throws Exception {
		return dao.getNoticeBoardListCount();
	}

	@Override
	public NoticeBoardVO getNoticeBoardByNo(int no) throws Exception {
		return dao.getNoticeBoardByNo(no);
	}

	@Override
	public List<UserBoardVO> getUserBoardList() throws Exception {
		return dao.getUserBoardList();
	}

	@Override
	public List<UserBoardVO> getUserBoardListLimit(int page) throws Exception {
		return dao.getUserBoardListLimit(page);
	}

	@Override
	public int getUserBoardListCount() throws Exception {
		return dao.getUserBoardListCount();
	}
	
	@Override
	public UserBoardVO getUserBoardByNo(int no) throws Exception {
		return dao.getUserBoardByNo(no);
	}
	
	@Override
	public int userBoardWrite(UserBoardVO vo) throws Exception{
		return dao.userBoardWrite(vo);
	}
	
	@Override
	public int updateUserBoardByNo(UserBoardVO vo) throws Exception{
		return dao.updateUserBoardByNo(vo);
	}
	
	@Override
	public int deleteUserBoardByNo(int no) throws Exception{
		return dao.deleteUserBoardByNo(no);
	}
	/*댓글 관련*/
	@Override
	public List<UserBoardComment> getUserBoardComment(int no) throws Exception{
		return dao.getUserBoardComment(no);
	}
	
	@Override
	public List<UserBoardComment> getUserBoardCommentLimit(int no,int page) throws Exception{
		return dao.getUserBoardCommentLimit(no,page);
	}
	
	@Override
	public int getUserBoardCommentCount(int no) throws Exception{
		return dao.getUserBoardCommentCount(no);
	}
	
	@Override
	public int userBoardCommentWrite(UserBoardComment vo) throws Exception{
		return dao.userBoardCommentWrite(vo);
	}
	/*대댓글 관련*/
	@Override
	public List<NestedComment> getNestedComment(int cid) throws Exception{
		return dao.getNestedComment(cid);
	}
	
}
