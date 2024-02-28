package spring.com.controller;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.com.dto.BasketVO;
import spring.com.dto.BookVO;
import spring.com.service.BookService;
import spring.com.service.MemberService;
import java.util.Map;
import java.util.HashMap;


@Controller
public class BookController {
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	 
	@Inject
    private BookService service;
    
	@RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(
    		@RequestParam("searchText") String searchText, @RequestParam("page") int page,
    		Locale locale, Model model) throws Exception{
    	
        logger.info("search");
        System.out.println("controller search");
        System.out.println("-----------------");
        System.out.println("searchText:"+searchText);
        System.out.println("URLDecoder.decode(searchText,\"UTF-8\"):"+URLDecoder.decode(searchText,"UTF-8"));
        System.out.println("page:"+page);
        int curPage = page;
        System.out.println("curPage:"+curPage);
        System.out.println("-----------------");
        ArrayList<BookVO> bookList = new ArrayList<BookVO>();
        //bookList=(ArrayList<BookVO>) service.getBooksByTitle(searchText);
        //bookList=(ArrayList<BookVO>) service.getBooksByTitleLimit(searchText);
        bookList=(ArrayList<BookVO>) service.getBooksByTitleLimitPage(searchText,(page-1)*3);
        //(page-1)*3
        for(int i=0; i<bookList.size(); i++) {
        	bookList.get(i).showBookInfo();
        }
        int pagination[]= null;
        model.addAttribute("bookList",bookList);
        
        //int count=service.getAllBookCount();
        int count=service.getSearchBookCount(searchText);
        int booksPerPage=10;
        int startPage=1;
        
        int endPage=0;
        if( count%booksPerPage==0 ) {
        	endPage=(count/booksPerPage);
        }else {
        	endPage=(count/booksPerPage)+1;
        }

        System.out.println("count:"+count);
        System.out.println("startPage:"+startPage);
        System.out.println("endPage:"+endPage);
        System.out.println("-----------------------------------");
        pagination=new int[endPage];
        for(int i=0; i<pagination.length; i++) {
        	pagination[i]=(i+1);
        }

        model.addAttribute("pagination",pagination);
        model.addAttribute("searchText",searchText);
        model.addAttribute("startPage",startPage);
        model.addAttribute("endPage",endPage);
        model.addAttribute("curPage",curPage);
        return "searchResult/searchResult";
    }
	
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
    public String basket(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
        logger.info("basket");
        //selectBookBasketWhereUserId
        System.out.println("basket!");
        String userID=(String) session.getAttribute("id");
        
        if(userID==null) {
        	response.setContentType("text/html; charset=utf-8");
        	PrintWriter out = response.getWriter();
        	out.println("<script>alert('need login.'); </script>");
        	//need login
        	out.flush();
        	return "home";
        }
        
        System.out.println("userID:"+userID);
        ArrayList<BasketVO> basketList = null;
        int totalPrice=0;
        basketList=(ArrayList<BasketVO>) service.getBookBasketWhereId(userID);
        for(int i=0; i<basketList.size(); i++) {
        	basketList.get(i).showBasketInfo();
        	int bookPrice=basketList.get(i).getBookPrice();
        	int amount=basketList.get(i).getAmount();
        	int total=bookPrice*amount;
        	totalPrice+=total;
        }
        model.addAttribute("basketList",basketList);
        model.addAttribute("totalPrice",totalPrice);
        
        return "basket/basket";
    }
	
	@RequestMapping(value = "/addBasket", method = RequestMethod.POST)
    public String addBasket(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
        logger.info("basket");
        String bookCover=(String)request.getParameter("bookCover");
        String bookTitle=(String)request.getParameter("bookTitle");
        int bookPrice=Integer.parseInt(request.getParameter("bookPrice"));
        int amount=Integer.parseInt(request.getParameter("amount"));
        int totalPrice=Integer.parseInt(request.getParameter("totalPrice"));
        String userID=(String) session.getAttribute("id");
        System.out.println("bookCover:"+bookCover);
        System.out.println("bookTitle:"+bookTitle);
        System.out.println("bookPrice:"+bookPrice);
        System.out.println("amount:"+amount);
        System.out.println("totalPrice:"+totalPrice);
        System.out.println("userID:"+userID);
        
        service.addBookBasket(bookCover,bookTitle,bookPrice,amount,totalPrice,userID);
        //占쏙옙袂占쏙옙占� 占쌩곤옙
        
        return "basket/basket";
    }
	
	@RequestMapping(value = "/daegu", method = RequestMethod.GET)
    public String daeguIntroduce(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
       
        
        return "introduce/introduceDaegu";
    }
	
	@RequestMapping(value = "/bookDetailView", method = RequestMethod.GET)
    public String bookDetailView(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		String regNo=(String)request.getParameter("regNo");
		System.out.println("regNo:"+regNo);
		BookVO bookVO=service.getBooksByRegNo(regNo);
		
		
		String publishingDate=bookVO.getPublishingDate();
		System.out.println("publishingDate:"+publishingDate);
		StringTokenizer stk=new StringTokenizer(publishingDate,"-");
		System.out.println(stk);
		System.out.println();
			
		System.out.println("total tokens:"+stk.countTokens());
		
		System.out.println("================tokens==================");
		
		String year = stk.nextToken();
		String month = stk.nextToken();
		String day = stk.nextToken();
		
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("day",day);
		
		model.addAttribute("bookDetail",bookVO);
		
        return "detail/bookDetailView";
    }
	
	@RequestMapping(value = "/recommend_search_word", method = RequestMethod.GET)
    public Object recommendSearchWord(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		
        System.out.println("/recommend_search_word");
        String searchWord=(String)request.getParameter("searchWord");
    	System.out.println("searchWord:"+searchWord);
    	
    	ArrayList<BookVO> bookList = new ArrayList<BookVO>();
    	bookList=(ArrayList<BookVO>) service.getBooksByTitle(searchWord);
    	
    	//response.setContentType("String");
    	Map<String, String> map = new HashMap<String,String>(); 
    	//HttpHeaders headers = new HttpHeaders();
    	//headers.add("content-type", "application/json; charset=UTF-8");		
        if(bookList.size() != 0) {
        	map.put("msg","yes");
        }else {
        	map.put("msg","no");
        }
    	
    	return map;
    	//service.
	}
	
	@RequestMapping(value = "/buy_book", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
    public Object basketToBuyPage(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model,@RequestParam Map<String, Object> paramMap) throws Exception{
		
		request.setCharacterEncoding("utf-8");
        System.out.println("/buy_book");
        String jsonData=(String)request.getParameter("jsonData");
        System.out.println(jsonData);
        
        JSONParser jsonParse = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParse.parse(jsonData);
        System.out.println("jsonObj:"+jsonObj);
        System.out.println("no:"+jsonObj.get("no"));
        System.out.println("comment:"+jsonObj.get("comment"));
        System.out.println("id:"+jsonObj.get("id"));
        	
        
        Map<String, String> map = new HashMap<String,String>(); 
    	//HttpHeaders headers = new HttpHeaders();
    	//headers.add("content-type", "application/json; charset=UTF-8");		
        if(true) {
        	map.put("msg","yes");
        }else {
        	map.put("msg","no");
        }
    	
    	return map;
	}
	
	@RequestMapping(value = "/buy_page", method = RequestMethod.GET)
    public String buyPage(HttpServletRequest request,HttpServletResponse response,
    		HttpSession session,Locale locale, Model model) throws Exception{
		
        System.out.println("/buy_book");
        String userID=(String) session.getAttribute("id");
        
        if(userID==null) {
        	response.setContentType("text/html; charset=utf-8");
        	PrintWriter out = response.getWriter();
        	out.println("<script>alert('need login.'); </script>");
        	//need login
        	out.flush();
        	return "home";
        }
        
        ArrayList<BasketVO> basketList = null;
        int totalPrice=0;
        basketList=(ArrayList<BasketVO>) service.getBookBasketWhereId(userID);
        for(int i=0; i<basketList.size(); i++) {
        	basketList.get(i).showBasketInfo();
        	int bookPrice=basketList.get(i).getBookPrice();
        	int amount=basketList.get(i).getAmount();
        	int total=bookPrice*amount;
        	totalPrice+=total;
        }
        model.addAttribute("basketList",basketList);
        model.addAttribute("totalPrice",totalPrice);
        
        return "buy/buyPage";
	}
}
