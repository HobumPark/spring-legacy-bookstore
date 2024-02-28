package spring.com.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


public class KyoboMemberVO {
	@Pattern(regexp="\\S{2,8}", message="이름을 공백없이 2~6자로 입력해주세요.")
	private String name;
	private String bornDate;
	private String phoneNum;
	private String id;
	private String password;
	private String email;
	
	public KyoboMemberVO() {
		
	}
	
	public KyoboMemberVO(String name,String bornDate,String phoneNum,
			String id,String password,String email) {
		this.name=name;
		this.bornDate=bornDate;
		this.phoneNum=phoneNum;
		this.id=id;
		this.password=password;
		this.email=email;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	
	public String getBornDate() {
		return bornDate;
	}
	public void setBornDate(String bornDate) {
		this.bornDate=bornDate;
	}
	
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum=phoneNum;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id=id;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
}
