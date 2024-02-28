package spring.com.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.com.dto.MemberVO;
import spring.com.service.MemberService;

@Controller
public class MemberController {
	
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    
    @Inject
    private MemberService service;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String Root(Locale locale, Model model) throws Exception{
 
        return "home";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String Home(Locale locale, Model model) throws Exception{
 
        logger.info("home");
        
        List<MemberVO> memberList = service.selectMember();
        //service.loginCheck();
        model.addAttribute("memberList", memberList);
        //view占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
        return "home";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String Login(Locale locale, Model model) throws Exception{
 
        logger.info("login");
        System.out.println("controller login");
        return "login/login";
    }
    
  
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String loginCheck(
    		@RequestParam("id") String id,
    		@RequestParam("pw") String pw,
    		Locale locale, Model model,HttpServletRequest request,
    		HttpSession session) throws Exception {
    	logger.info("logincheck");

    	boolean result = service.loginCheck(id,pw);
    	
    	System.out.println("id:"+id);
    	System.out.println("pw:"+pw);
    	System.out.println("result:"+result);
    	
    	if(result==true) {
    		session.setAttribute("id", id);
    		System.out.println("id:"+id);
    		String session_id = (String)session.getAttribute("id");
    		System.out.println("session_id:"+session_id);
    		return "home";//go home
    	} else if(result==false) {
    		return "login/login";
    	}
		return "login/login";
    }
    
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutSession(Locale locale, Model model,
    		HttpSession session) throws Exception {
    	logger.info("logout");
    	
    	session.removeAttribute("id");
    	
    	return "home";
    }
    
    @RequestMapping(value="/signup", method = RequestMethod.GET)
    public String SignUpPage(Locale locale, Model model) throws Exception {
    	logger.info("signup");
    	
    	return "member/joinMain";
    }
    
    @RequestMapping(value="/signup", method = RequestMethod.POST)
    public String SignUpDB(
    		@RequestParam("name") String name,
    		@RequestParam("bornDate") String bornDate,
    		@RequestParam("id") String id,
    		@RequestParam("pw") String pw,
    		@RequestParam("email") String email,
    		@RequestParam("phone-first") String phoneFirst,
    		@RequestParam("phone-middle") String phoneMiddle,
    		@RequestParam("phone-back") String phoneBack,
    		@RequestParam("provider") String provider,
    		@RequestParam("address") String address,
    		Locale locale, Model model,HttpServletRequest request) throws Exception {
    	logger.info("signup");
    	
    	String phoneNumber=phoneFirst+"-"+phoneMiddle+"-"+phoneBack;
    	
    	System.out.println("signup parameter");
    	System.out.println("id:"+id);
    	System.out.println("pw:"+pw);
    	int record=service.signUpMember(name,bornDate,id,pw,email,phoneNumber,provider,address);
    	if(record==1) {
    		return "home";
    	}
    	return "joinMain";
    }
    
    @RequestMapping(value="/ID_Check", method = RequestMethod.POST)
    public String ID_Check(
    		@RequestParam("id") String id,
    		Locale locale, Model model,HttpServletRequest request) throws Exception {

    	System.out.println("占쏙옙占싱듸옙 체크");

    	
    	return "home";
    }
    
    @RequestMapping(value="/update", method = RequestMethod.GET)
    public String update(
    		Locale locale, Model model,HttpServletRequest request,
    		HttpSession session) throws Exception {
    		
    	model.addAttribute("memberVO", 
    			service.readMember((String)session.getAttribute("id")));
    	
    	return "member/updateForm";
	}
    
    @RequestMapping(value="/update", method = RequestMethod.POST)
    public String updateVO(
    		Locale locale, Model model,HttpServletRequest request,HttpServletResponse response,
    		HttpSession session) throws Exception {
    	request.setCharacterEncoding("UTF-8");
    	String id=(String)request.getParameter("id");
    	String pw=(String)request.getParameter("pw");
    	String name=(String)request.getParameter("name");
    	String bornDate=(String)request.getParameter("bornDate");
    	String email=(String)request.getParameter("email");
    	String phoneFirst=(String)request.getParameter("phone-first");
    	String phoneMiddle=(String)request.getParameter("phone-middle");
    	String phoneBack=(String)request.getParameter("phone-back");
    	
    	String phoneNumber=phoneFirst+"-"+phoneMiddle+"-"+phoneBack;
    	
    	String provider=(String)request.getParameter("provider");
    	String address=(String)request.getParameter("address");

    	System.out.println("id:"+id);
    	System.out.println("pw:"+pw);
    	System.out.println("name:"+name);
    	System.out.println("bornDate:"+bornDate);
    	System.out.println("email:"+email);
    	System.out.println("phoneNumber:"+phoneNumber);
    	System.out.println("provider:"+provider);
    	System.out.println("address:"+address);
    	String addressSplit[] = address.split("|");
    	
    	System.out.println("address[0]:"+addressSplit[0]);
    	System.out.println("address[1]:"+addressSplit[1]);
    	System.out.println("address[2]:"+addressSplit[2]);
    	
    	service.updateMemberInfo(id,pw,name,bornDate,email,phoneNumber,provider,address);
    	
    	return "home";
	}
    
    @RequestMapping(value="/registerPage", method = RequestMethod.GET)
    public String registerPage(
    		Locale locale, Model model,HttpServletRequest request,
    		HttpSession session) throws Exception {
    	
    	return "member/registerPage";
	}
    
    @RequestMapping(value="/joinStep1", method = RequestMethod.GET)
    public String joinStep(
    		Locale locale, Model model,HttpServletRequest request,
    		HttpSession session) throws Exception {
    	
    	return "member/joinStep1";
	}
    
    @RequestMapping(value="/sendSms", method = RequestMethod.POST)
    public void sendSms(
    		Locale locale, Model model,HttpServletRequest request,
    		HttpSession session) throws Exception {
    	System.out.println("SMS占쏙옙占쏙옙 확占쏙옙!");
    	/*
    	String genCertNum=(String)request.getParameter("genCertNum");
    	String sendTo=(String)request.getParameter("sendTo");
    	
    	String api_key = "NCSAVIL7NRA0GVK2";//占쏙옙占쏙옙占쏙옙 API KEY
        String api_secret = "YLD079ZHXOB9D8CD9MSIRRYS249SM6EY";//占쏙옙占쏙옙占쏙옙 API SECRET
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", sendTo);    // 占쏙옙占쏙옙占쏙옙화占쏙옙호 01012345678
        params.put("from", "01025087298");    // 占쌩쏙옙占쏙옙화占쏙옙호. 占쌓쏙옙트占시울옙占쏙옙 占쌩쏙옙,占쏙옙占쏙옙 占싼댐옙 占쏙옙占쏙옙 占쏙옙호占쏙옙 占싹몌옙 占쏙옙
        params.put("type", "SMS");
        params.put("text", "占쏙옙占쏙옙占쏙옙占쏙옙 占쌨댐옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙호:"+genCertNum);
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        } 
    	 
    	
    	System.out.println(genCertNum);
    	*/
    	//return "member/joinStep";
	}
    
    @RequestMapping(value="/joinStep2", method = RequestMethod.GET)
    public String certCheck(
    		Locale locale, Model model,HttpServletRequest request,HttpServletResponse response,
    		HttpSession session) throws Exception {
    	
    	String genCertNum=(String)request.getParameter("genCertNum");
    	String inputCertNum=(String)request.getParameter("inputCertNum");
    	System.out.println("占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙호:"+genCertNum);
    	System.out.println("占쌉뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙호:"+inputCertNum);
    	/*
    	String name=request.getParameter("name");
    	String birth=request.getParameter("birth");
    	String phoneNum=request.getParameter("phoneNum");
    	System.out.println("name:"+name);
    	System.out.println("birth:"+birth);
    	System.out.println("phoneNum:"+phoneNum);
    	*/
    	if(genCertNum.equals(inputCertNum)==true) {//占쏙옙占쏙옙
    		System.out.println("占쏙옙占쏙옙占쏙옙호 占쏙옙치!");
    		return "member/joinStep2";
    	}else {
    		System.out.println("占쏙옙占쏙옙占쏙옙호 占쏙옙占쏙옙치!");
    		return "member/joinStep1";
    	}	
    	
    	//response.sendRedirect("member/joinStep2");
	}
    
    @RequestMapping(value="/joinStep2", method = RequestMethod.POST)
    public String joinStep2(
    		Locale locale, Model model,HttpServletRequest request,
    		HttpSession session) throws Exception {
    	System.out.println("/joinStep2, POST占쏙옙占�");
    	String genCertNum=(String)request.getParameter("genCertNum");
    	String inputCertNum=(String)request.getParameter("inputCertNum");
    	System.out.println("占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙호:"+genCertNum);
    	System.out.println("占쌉뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙호:"+inputCertNum);
    	/*
    	String name=request.getParameter("name");
    	String birth=request.getParameter("birth");
    	String phoneNum=request.getParameter("phoneNum");
    	System.out.println("name:"+name);
    	System.out.println("birth:"+birth);
    	System.out.println("phoneNum:"+phoneNum);
    	*/
    	if(genCertNum.equals(inputCertNum)==true) {//占쏙옙占쏙옙
    		System.out.println("占쏙옙占쏙옙占쏙옙호 占쏙옙치!");
    		return "member/joinStep2";
    	}else {
    		System.out.println("占쏙옙占쏙옙占쏙옙호 占쏙옙占쏙옙치!");
    		return "member/joinStep1";
    	}

	}
    
    
    //joinStep3SignForm
    @RequestMapping(value="/joinStep3SignForm", method = RequestMethod.POST)
    public String joinStep3SignForm(
    		Locale locale, Model model,HttpServletRequest request,
    		HttpSession session) throws Exception {
    	System.out.println("회占쏙옙占쏙옙占쏙옙 占쏙옙 占싱듸옙!");
    	
    	return "member/joinStep3SignForm";
	}
    
    //signUpCheck
    @RequestMapping(value="/signUpCheck", method = RequestMethod.POST)
    public String signUpCheck(
    		Locale locale, Model model,HttpServletRequest request,
    		HttpSession session) throws Exception {
    	System.out.println("회占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙!");
    	String id=(String)request.getParameter("id");
    	String pw=(String)request.getParameter("pw");
    	System.out.println("id"+id);
    	System.out.println("pw"+pw);
    	
    	return "member/joinStep3SignForm";
	}
    
    @RequestMapping(value="/idDuplicateCheckForm", method = RequestMethod.GET)
    public String idDuplicateCheckForm(
    		Locale locale, Model model,HttpServletRequest request,
    		HttpSession session) throws Exception {

    	return "member/idDuplicateCheckForm";
	}
    
    @RequestMapping(value="/idDuplicateCheck", method = RequestMethod.GET,
    		produces = "application/json; charset=utf8")
    @ResponseBody // 자바 객체를 HTTP 응답 본문의 객체로 변환
    public Object idDuplicateCheck(
    		Locale locale, Model model,HttpServletRequest request,
    		HttpServletResponse response,
    		HttpSession session) throws Exception {
    	
    	System.out.println("/idDuplicateCheck");
    	String id=(String)request.getParameter("id");
    	System.out.println("id:"+id);
    	String result=service.duplicateIdCheck(id);
    	System.out.println("result:"+result);
    	
    	//response.setContentType("String");
    	Map<String, String> map = new HashMap<String,String>(); 
    	//HttpHeaders headers = new HttpHeaders();
    	//headers.add("content-type", "application/json; charset=UTF-8");		
        if(result == null) {
        	map.put("msg","ok");
        }else {
        	map.put("msg","not");
        }
    	
    	return map;
    	//service.
	}
    
    
    @RequestMapping(value="/register", method = RequestMethod.POST)
    public String register(
    		Locale locale, Model model,HttpServletRequest request,
    		HttpSession session) throws Exception {
    	request.setCharacterEncoding("UTF-8");
    	System.out.println("/register");
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	String name = request.getParameter("name");
    	String phoneFirst = request.getParameter("phone-first");
    	String phoneMiddle = request.getParameter("phone-middle");
    	String phoneBack = request.getParameter("phone-back");
    	String zoneCode = request.getParameter("zone-code");
    	String address = request.getParameter("address");
    	String detailAddress = request.getParameter("detail-address");
    	String emailAddress = request.getParameter("email-address");
    	String emailDomain = request.getParameter("email-domain");
    	String emailAccept = request.getParameter("email-accept");
    	String year = request.getParameter("year");
    	String month = request.getParameter("month");
    	String day = request.getParameter("day");
    	
    	System.out.println("id:"+id);
    	System.out.println("pw:"+pw);
    	System.out.println("name:"+name);
    	System.out.println("phoneFirst:"+phoneFirst);
    	System.out.println("phoneMiddle:"+phoneMiddle);
    	System.out.println("phoneBack:"+phoneBack);
    	System.out.println("zonecode:"+zoneCode);
    	System.out.println("address:"+address);
    	System.out.println("detailAddress:"+detailAddress);
    	System.out.println("emailAddress:"+emailAddress);
    	System.out.println("emailDomain:"+emailDomain);
    	System.out.println("emailAccept:"+emailAccept);
    	System.out.println("year:"+year);
    	System.out.println("month:"+month);
    	System.out.println("day:"+day);
    	
    	String bornDate = year+"-"+month+"-"+day;
    	String email = emailAddress+"@"+emailDomain;
    	String phoneNumber=phoneFirst+"-"+phoneMiddle+"-"+phoneBack;
    	String fullAddress = zoneCode+"|"+address+"|"+detailAddress;
    	MemberVO vo = new MemberVO(name,bornDate,id,pw,email,phoneNumber,"LG U+",fullAddress);	
    	service.registerMember(vo);
    	
    	return "home";
	}
    
}
