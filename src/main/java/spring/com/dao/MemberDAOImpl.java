package spring.com.dao;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import spring.com.dto.MemberVO;
 
@Repository
public class MemberDAOImpl implements MemberDAO {
 
    @Inject
    private SqlSession sqlSession;
    
    private static final String memberNamespace = "spring.com.mapper.memberMapper";

    public List<MemberVO> selectMember() throws Exception {
 
        return sqlSession.selectList(memberNamespace+".selectMember");
    }
    
    public boolean loginCheck(String id,String pw) throws Exception{
    	
    	String db_id=sqlSession.selectOne(memberNamespace+".loginCheck",pw);
    	System.out.println("dao���� ������ db_id:"+db_id);
    	if(db_id==null) {
    		return false;
    	}
    	
    	if(db_id.equals(id)==true) {
    		return true;
    	} else {
    		return false;
    	} 	
    }
    
    public int signUpMember(String name,String bornDate,String id,String pw,String email,String phoneNumber,String provider,String address) throws Exception{
    	MemberVO vo=new MemberVO(id,pw,name,bornDate,email,phoneNumber,provider,address);
    	int record = sqlSession.insert(memberNamespace+".signUpMember",vo);
    	//insert
    	return record;
    }
    
    public MemberVO readMember(String id) throws Exception{
    	MemberVO vo=sqlSession.selectOne(memberNamespace+".readMember",id);
    	return vo;
    }
    
    public int updatePassword(String id,String pw) throws Exception{
    	HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
    	int record = sqlSession.update(memberNamespace+".updatePassword",map);
    	return record;
    }
    
    public int updateMemberInfo(String id,String pw,String name,String bornDate,String email,String phoneNumber,String provider,String address) throws Exception{
    	MemberVO vo=new MemberVO(id,pw,name,bornDate,email,phoneNumber,provider,address);

    	int record = sqlSession.update(memberNamespace+".updateMemberInfo",vo);
    	return record;
    }

	public String duplicateIdCheck(String id) throws Exception {
		String result = sqlSession.selectOne(memberNamespace+".selectId",id);
		return result;
	}

	public MemberVO selectMemberById(String id) throws Exception{
		return sqlSession.selectOne(memberNamespace+".selectMemberWhereId",id);
	}
	
	public int registerMember(MemberVO vo) throws Exception{
    	int record = sqlSession.insert(memberNamespace+".registerMember",vo);
    	//insert
    	return record;
	}
}

	
