package spring.com.controller;

import java.io.File;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import spring.com.dto.MemberVO;
import spring.com.dto.NoticeBoardVO;
import spring.com.dto.UserBoardComment;
import spring.com.dto.UserBoardVO;
import spring.com.service.BoardService;
import spring.com.service.MemberService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
    private BoardService service;
	
	@Inject
    private MemberService mem_service;
	
	@RequestMapping(value = "/customer_center", method = RequestMethod.GET)
    public String customerCenter(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
        System.out.println("/customer_center");
        return "customerCenter/customerCenter";
    }
	
	@RequestMapping(value = "/board/notice", method = RequestMethod.GET)
    public String noticeBoardMain(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
        System.out.println("/board/notice");
        int page=0;
        int curPage=0;
        if(request.getParameter("page") == null) {
        	page=1;
        	curPage=1;
        }else {
        	page=Integer.parseInt((String)request.getParameter("page"));
        	curPage=page;
        }
        System.out.println("page"+page);
        page = (page-1)*10;
        System.out.println("page:"+page);
        //service.getNoticeBoardList();
        //ArrayList<NoticeBoardVO> noticeBoardList=(ArrayList<NoticeBoardVO>) service.getNoticeBoardList();
        ArrayList<NoticeBoardVO> noticeBoardList=(ArrayList<NoticeBoardVO>) service.getNoticeBoardListLimit(page);
        //ArrayList<NoticeBoardVO> noticeBoardList = new ArrayList<NoticeBoardVO>();
        /*
        noticeBoardList.add(new NoticeBoardVO(12, "�젣紐�12", "�궡�슜12", "怨좉컼�꽱�꽣", "2022-12-01"));
        noticeBoardList.add(new NoticeBoardVO(11, "�젣紐�11", "�궡�슜11", "怨좉컼�꽱�꽣", "2022-11-01"));
        noticeBoardList.add(new NoticeBoardVO(10, "�젣紐�10", "�궡�슜10", "怨좉컼�꽱�꽣", "2022-10-01"));
        noticeBoardList.add(new NoticeBoardVO(9, "�젣紐�9", "�궡�슜9", "怨좉컼�꽱�꽣", "2022-09-01"));
        noticeBoardList.add(new NoticeBoardVO(8, "�젣紐�8", "�궡�슜8", "怨좉컼�꽱�꽣", "2022-08-01"));
        noticeBoardList.add(new NoticeBoardVO(7, "�젣紐�7", "�궡�슜7", "怨좉컼�꽱�꽣", "2022-07-01"));
        noticeBoardList.add(new NoticeBoardVO(6, "�젣紐�6", "�궡�슜6", "怨좉컼�꽱�꽣", "2022-06-01"));
        noticeBoardList.add(new NoticeBoardVO(5, "�젣紐�5", "�궡�슜5", "怨좉컼�꽱�꽣", "2022-05-01"));
        noticeBoardList.add(new NoticeBoardVO(4, "�젣紐�4", "�궡�슜4", "怨좉컼�꽱�꽣", "2022-04-01"));
        noticeBoardList.add(new NoticeBoardVO(3, "�젣紐�3", "�궡�슜3", "怨좉컼�꽱�꽣", "2022-03-01"));
        noticeBoardList.add(new NoticeBoardVO(2, "�젣紐�2", "�궡�슜2", "怨좉컼�꽱�꽣", "2022-02-01"));
        noticeBoardList.add(new NoticeBoardVO(1, "�젣紐�1", "�궡�슜1", "怨좉컼�꽱�꽣", "2022-01-01"));
        */
        int pageCount=10;
        //int noticeSize=noticeBoardList.size();
        int noticeSize=service.getNoticeBoardListCount();
        System.out.println("noticeSize:"+noticeSize);
        int endPage=0;
        if(noticeSize%10 == 0) {
        	endPage=noticeSize/pageCount;
        }else {
        	endPage=noticeSize/pageCount+1;
        }
        int pageArr[]=new int[endPage];
        for(int i=0; i<pageArr.length; i++) {
        	pageArr[i]=(i+1);
        }
        System.out.println("endPage:"+endPage);
        model.addAttribute("noticeBoardList",noticeBoardList);
        model.addAttribute("pageArr",pageArr);
        model.addAttribute("curPage",curPage);
        
        return "board/noticeBoardMain";
    }
	
	@RequestMapping(value = "/board/notice/view", method = RequestMethod.GET)
    public String noticeBoardView(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
        System.out.println("/board/notice/view");
        
        int no=Integer.parseInt( (String)request.getParameter("no") );
        System.out.println("no:"+no);
        
        NoticeBoardVO noticeView=service.getNoticeBoardByNo(no);
        model.addAttribute("noticeView",noticeView);
        
        return "board/noticeBoardView";
    }
	
	/*사용자*/
	@RequestMapping(value = "/board/user", method = RequestMethod.GET)
    public String userBoardMain(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
        System.out.println("/board/user");
        int page=0;
        int curPage=0;
        if(request.getParameter("page") == null) {
        	page=1;
        	curPage=1;
        }else {
        	page=Integer.parseInt((String)request.getParameter("page"));
        	curPage=page;
        }
        System.out.println("page"+page);
        page = (page-1)*10;
        System.out.println("page:"+page);
        
        ArrayList<UserBoardVO> userBoardList = (ArrayList<UserBoardVO>) service.getUserBoardListLimit(page);
        /*
        ArrayList<UserBoardVO> userBoardList = new ArrayList<UserBoardVO>();
        
        userBoardList.add(new UserBoardVO(12, "asdf1234","asdf4321","源�泥좎닔","�젣紐�12", "�궡�슜12",  "2022-12-01"));
        userBoardList.add(new UserBoardVO(11, "asdf1234","asdf4321","源�泥좎닔","�젣紐�11", "�궡�슜11",  "2022-11-01"));
        userBoardList.add(new UserBoardVO(10, "asdf1234","asdf4321","源�泥좎닔","�젣紐�10", "�궡�슜10",  "2022-10-01"));
        userBoardList.add(new UserBoardVO(9, "asdf1234","asdf4321","源�泥좎닔","�젣紐�9", "�궡�슜9",  "2022-09-01"));
        userBoardList.add(new UserBoardVO(8, "asdf1234","asdf4321","源�泥좎닔","�젣紐�8", "�궡�슜8",  "2022-08-01"));
        userBoardList.add(new UserBoardVO(7, "asdf1234","asdf4321","源�泥좎닔","�젣紐�7", "�궡�슜7",  "2022-07-01"));
        userBoardList.add(new UserBoardVO(6, "asdf1234","asdf4321","源�泥좎닔","�젣紐�6", "�궡�슜6",  "2022-06-01"));
        userBoardList.add(new UserBoardVO(5, "asdf1234","asdf4321","源�泥좎닔","�젣紐�5", "�궡�슜5",  "2022-05-01"));
        userBoardList.add(new UserBoardVO(4, "asdf1234","asdf4321","源�泥좎닔","�젣紐�4", "�궡�슜4",  "2022-04-01"));
        userBoardList.add(new UserBoardVO(3, "asdf1234","asdf4321","源�泥좎닔","�젣紐�3", "�궡�슜3",  "2022-03-01"));
        userBoardList.add(new UserBoardVO(2, "asdf1234","asdf4321","源�泥좎닔","�젣紐�2", "�궡�슜2",  "2022-02-01"));
        userBoardList.add(new UserBoardVO(1, "asdf1234","asdf4321","源�泥좎닔","�젣紐�1", "�궡�슜1",  "2022-01-01"));
        */
        int pageCount=10;
        //int noticeSize=userBoardList.size();
        int noticeSize=service.getUserBoardListCount();
        int endPage=0;
        if(noticeSize%10 == 0) {
        	endPage=noticeSize/pageCount;
        }else {
        	endPage=noticeSize/pageCount+1;
        }
        int pageArr[]=new int[endPage];
        for(int i=0; i<pageArr.length; i++) {
        	pageArr[i]=(i+1);
        }
        model.addAttribute("userBoardList",userBoardList);
        model.addAttribute("pageArr",pageArr);
        model.addAttribute("curPage",curPage);
        
        return "board/userBoardMain";
    }
	
	@RequestMapping(value = "/board/user/view", method = RequestMethod.GET)
    public String userBoardView(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
        System.out.println("/board/user/view");
        int no=Integer.parseInt( (String)request.getParameter("no") );
        System.out.println("no:"+no);
        
        UserBoardVO userView=service.getUserBoardByNo(no);
        model.addAttribute("userView",userView);
        
        //List<UserBoardComment> userBoardComment=service.getUserBoardComment(no);
        //model.addAttribute("userBoardComment",userBoardComment);
        
        List<UserBoardComment> userBoardComment=service.getUserBoardCommentLimit(no,0);
        model.addAttribute("userBoardComment",userBoardComment);
        //pass comment
        
        int count = service.getUserBoardCommentCount(no);
        int page = count/5;
        if(count%5 != 0) {
        	page=page+1;
        }
        int pageArr[] = new int[page];
        
        for(int i=0; i<pageArr.length; i++) {
        	pageArr[i]=(i+1);
        }
        model.addAttribute("pageArr",pageArr);
        model.addAttribute("no",no);
        
        System.out.println(userBoardComment);
        return "board/userBoardView";
    }
	
	@RequestMapping(value = "/fileDownload", method = RequestMethod.GET)
    public void downloadFile(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
        
		System.out.println("/fileDownload");
        //요청 잘 들어왔는지 출력 확인
		
		String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/upload");
		System.out.println("업로드 실제 경로 : " + path);
        //저장 경로 확인
		
		String fileName=request.getParameter("fileName");
        System.out.println("파일 이름: " + fileName);
        //클라이언트로부터 전달받은 파일이름 확인
        
        File downloadFile = new File(path+fileName);
        //저장된 경로의 파일을 읽어와 파일 객체 생성
        
        byte fileByte[] = FileUtils.readFileToByteArray(downloadFile);
        //파일을 byte 배열로 변환한다.
        
        response.setContentType("application/octet-stream");
        //"application/octet-stream" 은 자바에서 사용하는 파일 다운로드 응답 형식으로, 어플리케이션 파일이 리턴된다고 설정한다.
        response.setContentLength(fileByte.length);
        
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName,"UTF-8") +"\";");
        //"attachment;fileName="을 사용하면 다운로드시 파일 이름을 지정해줄 수 있다.
        response.setHeader("Content-Transfer-Encoding", "binary");
        // "application/octet-stream"은 binary 데이터이기 때문에 binary로 인코딩해준다.
        
        response.getOutputStream().write(fileByte);
        response.getOutputStream().flush();
        response.getOutputStream().close();
    }
	
	@RequestMapping(value = "/board/user/write", method = RequestMethod.GET)
    public String userBoardWrite(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
        System.out.println("/board/user/write(GET)");
        
       
        String session_id = (String)session.getAttribute("id");
        System.out.println("session_id:"+session_id);
        
        MemberVO memberVO = mem_service.selectMemberById(session_id);
        System.out.println(memberVO);
        String name = memberVO.getName();
        System.out.println("name:"+name);
        model.addAttribute("name",name);
        
        return "board/userBoardWrite";
    }
	
	@RequestMapping(value = "/board/user/write", method = RequestMethod.POST)
    public String userBoardWriteAction(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,@RequestParam("file") MultipartFile file,Locale locale, Model model) throws Exception{
        System.out.println("/board/user/write(post)");
        request.setCharacterEncoding("utf-8");
        
        String fileName = file.getOriginalFilename();
		System.out.println("fileName:"+fileName);  
		
        String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/upload/");
		System.out.println("업로드 실제 경로 : " + path);
        
		String fullPath=path+fileName;
		System.out.println(fullPath);
		file.transferTo(new File(fullPath));
		
		//File target = new File(path, fileName);
		//FileCopyUtils.copy(file.getBytes(), target);
        
        LocalDate now = LocalDate.now();
        System.out.println("now:"+now);
        
        String strNow= now.toString();
        
        String titleInput=(String)request.getParameter("title-input");
        System.out.println("titleInput:"+titleInput);
        
        String textarea=(String)request.getParameter("textarea");
        System.out.println("textarea:"+textarea);
        
        String session_id = (String)session.getAttribute("id");
        System.out.println("session_id:"+session_id);
        
        MemberVO memberVO = mem_service.selectMemberById(session_id);
        System.out.println(memberVO);
        String name = memberVO.getName();
        System.out.println("name:"+name);
        
        UserBoardVO writeVO = new UserBoardVO();
        writeVO.setId(session_id);
        writeVO.setName(name);
        writeVO.setPassword("1111");
        writeVO.setTitle(titleInput);
        writeVO.setContents(textarea);
        writeVO.setWriteDate(strNow);
        writeVO.setFileAttach("Yes");
        writeVO.setFileName(fileName);
        
        service.userBoardWrite(writeVO);
        
        return "board/userBoardMain";
    }
	
	//회원 게시글 수정 - 페이지 이동
	@RequestMapping(value = "/board/user/update", method = RequestMethod.GET)
    public String userBoardUpdateMove(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		
        System.out.println("/board/user/update (GET)");
       
        int no=Integer.parseInt( (String)request.getParameter("no") );
        System.out.println("no:"+no);
        
        UserBoardVO userView=service.getUserBoardByNo(no);
        model.addAttribute("userView",userView);
        //수정페이지로만 이동
        return "board/userBoardUpdate";
	}
	
	
	//회원 게시글 수정 - 데이터 수정 
	@RequestMapping(value = "/board/user/update", method = RequestMethod.POST)
    public String userBoardUpdateAction(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		
        System.out.println("/board/user/update (POST)");
        request.setCharacterEncoding("utf-8");
        
        int no = Integer.parseInt( (String)request.getParameter("no") );
       
        String title = (String)request.getParameter("title");
        String textarea = (String)request.getParameter("textarea");	
        
        System.out.println("no:"+no);
        System.out.println("title:"+title);
        System.out.println("textarea:"+textarea);
        
        UserBoardVO userBoardVO=service.getUserBoardByNo(no);
        userBoardVO.setTitle(title);
        userBoardVO.setContents(textarea);
        
        service.updateUserBoardByNo(userBoardVO);
        
        return "board/userBoardMain";
	}
	
	//회원 게시글 수정 - 파일 삭제
	@RequestMapping(value = "/board/user/file/delete", method = RequestMethod.GET, 
	produces = "application/json; charset=utf8")
	@ResponseBody // 자바 객체를 HTTP 응답 본문의 객체로 변환
	public Object userBoardFileDelete(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		
        System.out.println("/board/user/update (GET)");
        request.setCharacterEncoding("utf-8");
        System.out.println("file delete");
        String fileName=request.getParameter("fileName");
        System.out.println(fileName);
        
        String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/upload/");
		System.out.println("업로드 실제 경로 : " + path);
        
		String fullPath=path+fileName;
		System.out.println(fullPath);
    	
    	//현재 게시판에 존재하는 파일객체를 만듬
		File file = new File(fullPath);
		file.delete(); // 파일 삭제	
		System.out.println("file delete success!");
		
        Map<String, String> map = new HashMap<String,String>(); 
        map.put("msg","ok");

        return map;
	}
	
	@RequestMapping(value = "/board/user/delete", method = RequestMethod.GET)
    public String userBoardDeleteAction(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		
        System.out.println("/board/user/delete");
        int no=Integer.parseInt( (String)request.getParameter("no") );	
        System.out.println("no:"+no);
        
        //사용자 게시글 상세조회에서 첨부여부를 확인하고
        UserBoardVO vo=service.getUserBoardByNo(no);
        String fileAttach=vo.getFileAttach();
        if(fileAttach.equals("Yes")==true) {
        	
        	String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/upload/");
    		System.out.println("업로드 실제 경로 : " + path);
            
    		String fullPath=path+vo.getFileName();
    		System.out.println(fullPath);
        	
        	//현재 게시판에 존재하는 파일객체를 만듬
    		File file = new File(fullPath);
    		file.delete(); // 파일 삭제	
    		System.out.println("file delete success!");
        }
        //file remove
        
        service.deleteUserBoardByNo(no);
        
        return "board/userBoardMain";
	}
	
	/*댓글관련*/
	@RequestMapping(value = "/board/user/comment/add", method = RequestMethod.POST, 
			produces = "application/json; charset=utf8")
	@ResponseBody // 자바 객체를 HTTP 응답 본문의 객체로 변환
    public Object userBoardCommentInsertAction(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model,@RequestParam Map<String, Object> paramMap) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		
        System.out.println("/board/user/comment/add");
        
        String jsonData=(String)request.getParameter("jsonData");
        System.out.println("jsonData:"+jsonData);
        
        JSONParser jsonParse = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParse.parse(jsonData);
        System.out.println("jsonObj:"+jsonObj);
        System.out.println("no:"+jsonObj.get("no"));
        System.out.println("comment:"+jsonObj.get("comment"));
        System.out.println("id:"+jsonObj.get("id"));
        
        int no= Integer.parseInt((String) jsonObj.get("no"));
        String comment = (String) jsonObj.get("comment");
        String id = (String) jsonObj.get("id");
        System.out.println("id:"+id);
        System.out.println("no:"+no);
        
        MemberVO memberVO =  mem_service.selectMemberById(id);
        String name=memberVO.getName();
        
        System.out.println("name:"+name);
        
        UserBoardComment vo = new UserBoardComment(no,name,comment);
        
        service.userBoardCommentWrite(vo);
        
        //response.setContentType("String");
        Map<String, String> map = new HashMap<String,String>(); 
        map.put("msg","ok");

        return map;
        /*
        String jsonData = paramMap.get("jsonData").toString();
        JSONParser jsonParse = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParse.parse(jsonData);
        System.out.println("jsonObj:"+jsonObj);
		*/
        /*
        String comment = (String)request.getParameter("register-comment-input");
        String session_id = (String)request.getParameter("session_id");
        int no = Integer.parseInt( (String)request.getParameter("boardNo") );
        String id = session_id;
        
        MemberVO memberVO =  mem_service.selectMemberById(id);
        String name=memberVO.getName();
        
        System.out.println("comment:"+comment);  
        System.out.println("session_id:"+session_id);
        System.out.println("no:"+no);
        System.out.println("name:"+name);
        UserBoardComment vo = new UserBoardComment(no,name,comment);
        
        service.userBoardCommentWrite(vo);
        
        //댓글 객체 구성요소
        //원글번호, 글쓴이 아이디, 글쓴이 이름, 내용
        request.setAttribute("no", no);
        */
        //return "board/userBoardMain";
	}
	
	@RequestMapping(value = "/board/user/comment", method = RequestMethod.GET, 
			produces = "application/json; charset=utf8")
	@ResponseBody // 자바 객체를 HTTP 응답 본문의 객체로 변환
    public Object userBoardCommentList(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model,@RequestParam Map<String, Object> paramMap) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		
        System.out.println("/board/user/comment");
        
        String commentInfo=(String)request.getParameter("commentInfo");
        
        JSONParser jsonParse = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParse.parse(commentInfo);
        System.out.println("jsonObj:"+jsonObj);
        System.out.println("bno:"+jsonObj.get("bno"));
        System.out.println("page:"+jsonObj.get("page"));
        

        int bno = Integer.parseInt(String.valueOf(jsonObj.get("bno")));
        int page = Integer.parseInt(String.valueOf(jsonObj.get("page")));
        int startIndex=0;
        System.out.println("parseInt complete!");
        System.out.println("bno:"+bno);
        System.out.println("page:"+page);
        
        startIndex = (page-1)*5;
        
        List<UserBoardComment> userBoardComment=service.getUserBoardCommentLimit(bno,startIndex);
        for(int i=0; i<userBoardComment.size(); i++) {
        	userBoardComment.get(i).showInfo();
        }
        
        JSONArray jArray = new JSONArray();//배열이 필요할때
        
        try {
        
        for (int i = 0; i < userBoardComment.size(); i++)//배열
        {
            JSONObject sObject = new JSONObject();//배열 내에 들어갈 json
            sObject.put("bno", userBoardComment.get(i).getBno());
            sObject.put("cid", userBoardComment.get(i).getCid());
            sObject.put("writer", userBoardComment.get(i).getWriter());
            sObject.put("contents", userBoardComment.get(i).getContents());
            jArray.add(sObject);
        }
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        String jArrayStr = jArray.toString();
  
		Map<String, String> map = new HashMap<String,String>(); 
        map.put("msg",jArrayStr);
        
        return map;
	}
	

	/*관리자*/
	@RequestMapping(value = "/board/manager", method = RequestMethod.GET)
    public String boardMain(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
        System.out.println("/board/manager");
        return "board/managerBoardMain";
    }
	
	@RequestMapping(value = "/board/manager/write", method = RequestMethod.GET)
    public String boardWrite(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		 System.out.println("/board/manager/write"); 
		 
        return "board/managerBoardWrite";
    }
	
	@RequestMapping(value = "/board/manager/view", method = RequestMethod.GET)
    public String boardView(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		System.out.println("/board/manager/view");  
		
        return "board/managerBoardView";
    }
	
	@RequestMapping(value = "/one_to_one_question", method = RequestMethod.GET)
    public String oneToOneQuestion(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		System.out.println("/one_to_one_question");  
		
        return "oneToOne/oneToOneQuestion";
    }
	
	@RequestMapping(value = "/one_to_one_list", method = RequestMethod.GET)
    public String oneToOneList(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		System.out.println("/one_to_one_list");  
		
        return "oneToOne/oneToOneList";
    }
	
	@RequestMapping(value = "/one_to_one/file_upload", method = RequestMethod.POST)
    public String oneToOneFileUpload(HttpServletRequest request,HttpServletResponse response,
    		@RequestParam("file") MultipartFile file,HttpSession session,Locale locale, Model model) throws Exception{
		System.out.println("/one_to_one/file_upload");  
		
		
		String fileName = file.getOriginalFilename();
		System.out.println("fileName:"+fileName);  
		
        String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/upload");
		System.out.println("업로드 실제 경로 : " + path);
        
		file.transferTo(new File(path+fileName));
		
		/*
        //경로 생성
        if ( ! new File(uploadPath).exists()) {
        	//디렉토리 생성
        	System.out.println("directory make!");
            new File(uploadPath).mkdirs();
        }
        //파일 복사
        try {
            FileCopyUtils.copy(file.getBytes(), target);
            model.addAttribute("file", file);
        } catch(Exception e) {
            e.printStackTrace();
            model.addAttribute("file", "error");
        }
        */
        return "oneToOne/oneToOneList";
    }
	
	
	
}
