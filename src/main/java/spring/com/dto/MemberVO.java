package spring.com.dto;

public class MemberVO {
	private String name;
	private String bornDate;
    private String id;
    private String pw;
    private String email;
    private String phoneNumber;
    private String provider;
    private String address;
    
    public MemberVO() {

    }
    
    public MemberVO(String name,String bornDate,String id,String pw,
    		String email,String phoneNumber,String provider,
    		String address) {
    	this.name=name;
    	this.id=id;
    	this.pw=pw;
    	this.bornDate=bornDate;
    	this.email=email;
    	this.phoneNumber=phoneNumber;
    	this.provider=provider;
    	this.address=address;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBornDate() {
		return bornDate;
	}

	public void setBornDate(String bornDate) {
		this.bornDate = bornDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmailFront() {
		String emailFront="";
		String []tokens=email.split("@");
		emailFront=tokens[0];
		return emailFront;
	}
	
	public String getEmailBack() {
		String emailBack="";
		String []tokens=email.split("@");
		emailBack=tokens[1];
		return emailBack;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public String getPhoneNumberFront() {
		String phoneNumberFront="";
		String []tokens=phoneNumber.split("-");
		phoneNumberFront=tokens[0];
		return phoneNumberFront;
	}
	public String getPhoneNumberMiddle() {
		String phoneNumberMiddle="";
		String []tokens=phoneNumber.split("-");
		phoneNumberMiddle=tokens[1];
		return phoneNumberMiddle;
	}
	public String getPhoneNumberBack() {
		String phoneNumberBack="";
		String []tokens=phoneNumber.split("-");
		phoneNumberBack=tokens[2];
		return phoneNumberBack;
	}
	
	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}
	
	public String getZonecode() {
		String zonecode="";
		String []tokens=address.split("[|]");
		zonecode=tokens[0];
		return zonecode;
	}
	
	public String getMainAddress() {
		String mainAddress="";
		String []tokens=address.split("[|]");
		for(int i=0;i<tokens.length;i++){
			System.out.println(tokens[i]);
		}
		mainAddress=tokens[1];
		return mainAddress;
	}
	
	public String getDetailAddress() {
		String detailAddress="";
		String []tokens=address.split("[|]");
		for(int i=0;i<tokens.length;i++){
			System.out.println(tokens[i]);
		}
		detailAddress=tokens[2];
		return detailAddress;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
    
   
}
