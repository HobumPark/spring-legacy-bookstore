package spring.com.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import spring.com.dao.MemberDAO;
import spring.com.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
 
    @Inject
    private MemberDAO dao;
    
    @Override
    public List<MemberVO> selectMember() throws Exception {
 
        return dao.selectMember();
    }

	@Override
	public boolean loginCheck(String id,String pw) throws Exception {
		
		return dao.loginCheck(id,pw);
	}
	
	@Override
	public int signUpMember(String name,String bornDate,String id,String pw,String email,String phoneNumber,String provider,String address) throws Exception {
		
		return dao.signUpMember(name,bornDate,id,pw,email,phoneNumber,provider,address);
	}
	
	@Override
	public MemberVO readMember(String id) throws Exception{
		
		return dao.readMember(id);
	}

	@Override
	public int updatePassword(String id,String pw) throws Exception {
		return dao.updatePassword(id,pw);
	} 
	
	@Override
	public int updateMemberInfo(String id,String pw,String name,String bornDate,String email,String phoneNumber,String provider,String address) throws Exception {
		return dao.updateMemberInfo(id,pw,name,bornDate,email,phoneNumber,provider,address);
	} 
	
	@Override
	public String duplicateIdCheck(String id) throws Exception{
		return dao.duplicateIdCheck(id);
	}
	
	@Override
	public MemberVO selectMemberById(String id) throws Exception{
		return dao.selectMemberById(id);
	}
	
	@Override
	public int registerMember(MemberVO vo) throws Exception{
		return dao.registerMember(vo);
	}
}
