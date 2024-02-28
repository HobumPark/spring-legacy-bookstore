package spring.com.dao;

import java.util.List;
import spring.com.dto.MemberVO;
 
public interface MemberDAO {
    
    public List<MemberVO> selectMember() throws Exception;
    
    public boolean loginCheck(String id,String pw) throws Exception;
    
    public int signUpMember(String name,String bornDate,String id,String pw,String email,String phoneNumber,String provider,String address) throws Exception;

	public MemberVO readMember(String id) throws Exception;
	
	public int updatePassword(String id,String pw) throws Exception;

	public int updateMemberInfo(String name,String bornDate,String id,String pw,String email,String phoneNumber,String provider,String address) throws Exception;
	
	public String duplicateIdCheck(String id) throws Exception;
	
	public MemberVO selectMemberById(String id) throws Exception;

	public int registerMember(MemberVO vo) throws Exception;
	
}
