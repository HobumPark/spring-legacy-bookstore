package spring.com.dao;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import spring.com.dto.NestedComment;
import spring.com.dto.NoticeBoardVO;
import spring.com.dto.UserBoardComment;
import spring.com.dto.UserBoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
    private SqlSession sqlSession;

    private static final String boardNamespace = "spring.com.mapper.boardMapper";
    //noticeBoard
	@Override
	public List<NoticeBoardVO> getNoticeBoardList() throws Exception{		
		return sqlSession.selectList(boardNamespace+".selectNoticeBoard");
	}

	@Override
	public List<NoticeBoardVO> getNoticeBoardListLimit(int page) throws Exception {
		return sqlSession.selectList(boardNamespace+".selectNoticeBoardLimit",page);
	}

	@Override
	public int getNoticeBoardListCount() throws Exception {
		return sqlSession.selectOne(boardNamespace+".selectNoticeBoardCount");
	}

	@Override
	public NoticeBoardVO getNoticeBoardByNo(int no) throws Exception {
		return sqlSession.selectOne(boardNamespace+".selectNoticeBoardByNo",no);
	}
	//userBoard
	@Override
	public List<UserBoardVO> getUserBoardList() throws Exception {
		return sqlSession.selectList(boardNamespace+".selectUserBoard");
	}

	@Override
	public List<UserBoardVO> getUserBoardListLimit(int page) throws Exception {
		return sqlSession.selectList(boardNamespace+".selectUserBoardLimit",page);
	}

	@Override
	public int getUserBoardListCount() throws Exception {
		return sqlSession.selectOne(boardNamespace+".selectUserBoardCount");
	}
	
	@Override
	public UserBoardVO getUserBoardByNo(int no) throws Exception {
		return sqlSession.selectOne(boardNamespace+".selectUserBoardByNo",no);
	}
	
	@Override
	public int userBoardWrite(UserBoardVO vo) throws Exception{
		
		return sqlSession.insert(boardNamespace+".insertUserBoard",vo);
	}
	
	@Override
	public int updateUserBoardByNo(UserBoardVO vo) throws Exception{

		return sqlSession.update(boardNamespace+".updateUserBoard",vo);
	}
	
	@Override
	public int deleteUserBoardByNo(int no) throws Exception{
		return sqlSession.delete(boardNamespace+".deleteUserBoard",no);
	}
	/*댓글 관련*/
	@Override
	public List<UserBoardComment> getUserBoardComment(int no) throws Exception{
		return sqlSession.selectList(boardNamespace+".selectUserBoardCommentList",no);
	}
	
	@Override
	public List<UserBoardComment> getUserBoardCommentLimit(int no,int page) throws Exception{
		HashMap map = new HashMap();

		map.put("no", no);
		map.put("page", page);
		
		return sqlSession.selectList(boardNamespace+".selectUserBoardCommentListLimit",map);
	}
	
	@Override
	public int getUserBoardCommentCount(int no) throws Exception{
		return sqlSession.selectOne(boardNamespace+".selectUserBoardCommentListCount",no);
	}
	
	@Override
	public int userBoardCommentWrite(UserBoardComment vo) throws Exception{
		return sqlSession.insert(boardNamespace+".insertUserBoardComment",vo);
	}
	/*대댓글 관련*/
	@Override
	public List<NestedComment> getNestedComment(int cid) throws Exception{
		return sqlSession.selectList(boardNamespace+".selectNestedCommentList",cid);
	}
}
