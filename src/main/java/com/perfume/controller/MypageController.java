package com.perfume.controller;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.perfume.beans.InquiryDTO;
import com.perfume.beans.PerfumeDTO;
import com.perfume.beans.ReviewDTO;
import com.perfume.service.MemberService;
import com.perfume.service.MypageService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Setter(onMethod_=@Autowired)
	private MypageService service;
	
	@Autowired
	private MemberService serviceM; 
	
//	마이페이지 메인
	@RequestMapping("main")
	public String wishList(HttpSession session, Model model ) {
		String id = (String)session.getAttribute("id");
		String kid = (String)session.getAttribute("kid");
			if(id != null) {
				model.addAttribute("MemberDTO", serviceM.memberUserInfo(id));
			} else if(kid != null) {
				model.addAttribute("MemberDTO", serviceM.memberUserInfo(kid));
			}
		return "mypage/main";
	}
	
//	메인-디테일 페이지에서 위시리스트 등록하기 
	@RequestMapping("registration")
	public String registration(Model model, PerfumeDTO pdto, String writer) {
		int check = service.wishRegisterCh(pdto.getF_number(),writer);
			if(check == 0) {
				service.wishRegister(pdto.getF_number(),writer);
				int check1 = 1;
				model.addAttribute("check", check1);
			}else {
				int check1 = 0 ;
				model.addAttribute("check", check1);
			}
		model.addAttribute("f_name", pdto.getF_name());
		model.addAttribute("p_number", pdto.getP_number());
		return "mypage/registration";
	}
	
//	설문 결과에서 위시리스트 등록하기
	@RequestMapping("serveyRegistration")
	public String serveyRegistration(Model model, PerfumeDTO pdto, @RequestParam String writer ,@RequestParam List<String> chk) {
		List<String> list1 = new ArrayList(); //새로 등록된 향수 번호 리스트  
		List<String> list2 = new ArrayList(); //이미 있는 향수 번호 리스트
		for( int i = 0  ; i < chk.size() ; i++) {
			String f_number = chk.get(i);
			int check = service.wishRegisterCh(f_number,writer);
				if(check == 0) {
					service.wishRegister(f_number,writer);
					list1.add(chk.get(i));
				}else {
					list2.add(chk.get(i));
				}
		}
		model.addAttribute("content1",service.wishSearch(list1));
		model.addAttribute("content2",service.wishSearch(list2));
		//새로 등록된 향수 정보
			if(list1.size() != 0) { 
				model.addAttribute("content1",service.wishSearch(list1));
			}
			//이미 있는 향수 정보 
			if(list2.size() != 0) {	
				model.addAttribute("content2",service.wishSearch(list2));
			}
		return "mypage/serveyRegistration";
	}
	
//	위시리스트 리스트
	@RequestMapping("wishList")
	public String wishList(HttpSession session, Model model, PerfumeDTO pdto) {
		String id = (String)session.getAttribute("id");
		String kid = (String)session.getAttribute("kid");
		List f_number = new ArrayList();
		List<PerfumeDTO> wishList = new ArrayList();
			if(id != null) {
				f_number = service.wishList(id);
			} else if(kid != null) {
				f_number = service.wishList(kid);
			}	
		model.addAttribute("content", service.wishSearch(f_number));
		return "mypage/wishList";
	}
	
//	위시리스트 삭제
	@RequestMapping("wishListDelete")
	public String wishListDelete(RedirectAttributes re,String writer, String f_number) {
		service.wishListDelete(writer, f_number);
		return "redirect:wishList";
	}
	
	@RequestMapping("wishListDeleteCk")
	public String wishListDeleteCk(RedirectAttributes re,String writer, @RequestParam List<String> chk) {
		for( int i = 0  ; i < chk.size() ; i++) {
			String f_number = chk.get(i);
			service.wishListDelete(writer, f_number);
		}
		return "redirect:wishList";
	}
	
//	1:1문의 리스트 나오는 페이지 1:1문의 메인
	@RequestMapping("inquiry")
	public String inquiry(HttpSession session , String pageNum ,Model model ,InquiryDTO idto ) {
		String id = (String)session.getAttribute("id");
		String kid = (String)session.getAttribute("kid");
		
		int pageSize = 10;
		
			if(pageNum == null) {
				pageNum ="1";
			}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number=0;
	    String userid = null;
		    if(id != null) {
		    	userid = id;
		    	count = service.inquiryCount(id);
			} else if(kid != null) {
				userid = kid;
				count = service.inquiryCount(kid);
			}
	    List articleList = null;
		    if(count > 0) {
					articleList = service.inquirySearch(userid , startRow, endRow);
		    }
	    number = count -(currentPage -1)*pageSize;
	    model.addAttribute("pageSize",pageSize);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("currentPage",currentPage);
	    model.addAttribute("startRow",startRow);
	    model.addAttribute("endRow",endRow);
	    model.addAttribute("count",count);
	    model.addAttribute("number",number);
	    model.addAttribute("articleList",articleList);
		return "mypage/inquiry";
	}
	
//	1:1 문의 글쓰기 
	@RequestMapping("inquirInsert")
	public String inquirInsert() {
		return "mypage/inquirInsert";
	}
	
	@RequestMapping("inquirInsertPro")
	public String inquirInsertPro(Model model ,InquiryDTO idto , String id ) {
		model.addAttribute("result", service.inquiryInsert(idto));
		return "mypage/inquirInsertPro";
	}
	
//	1:1 문의  내용보기
	@RequestMapping("inquirContent")
	public String inquirContent( Model model , int num ) {
		model.addAttribute("inquiry", service.inquiryContent(num));	
		return "mypage/inquirContent";
	}
	

//	1:1 문의 삭제
	@RequestMapping("inquiryDelete")
	public String inquiryDelete(Model model , int num) {
		service.inquiryDelete(num);	
		return "redirect:inquiry";
	}
	
//	1:1 문의 수정
	@RequestMapping("inquiryUpdate")
	public String inquiryUpdate(Model model , int num) {
		model.addAttribute("inquiry", service.inquiryContent(num));	
		return "mypage/inquiryUpdate";
	}
	
	@RequestMapping("inquiryUpdatePro")
	public String inquiryUpdatePro(Model model ,InquiryDTO idto) {
		model.addAttribute("result", service.inquiryUpdate(idto));
		model.addAttribute("num", idto.getNum());
		return "mypage/inquiryUpdatePro";
	}
	
//	내가 작성한 글 
	@RequestMapping("myContent")
	public String myContent() {	
		return "mypage/myContent";
	}
	
	
	
//	내가 작성한 글 QA 보러가기 
	@RequestMapping("myContentQA")
	public String myContentQA(Model model , HttpSession session , String pageNum) {
		String id = (String)session.getAttribute("id");
		String kid = (String)session.getAttribute("kid");
		int pageSize = 10;
		
			if(pageNum == null) {
				pageNum ="1";
			}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number=0;
	    String userid = null;
		    if(id != null) {
		    	userid = id;
			} else if(kid != null) {
				userid = kid;
			}
	    count = service.myContQACount(userid);
	    List articleList = null;
		    if(count > 0) {
					articleList = service.myContQAList(userid, startRow, endRow);
		    }
	    number = count -(currentPage -1)*pageSize;
	    model.addAttribute("pageSize",pageSize);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("currentPage",currentPage);
	    model.addAttribute("startRow",startRow);
	    model.addAttribute("endRow",endRow);
	    model.addAttribute("count",count);
	    model.addAttribute("number",number);
	    model.addAttribute("articleList",articleList);	
		return "mypage/myContentQA"; 
	}
	
//	내가 작성한 글  향수 추천 보러가기 
	@RequestMapping("myContentRecmd")
	public String myContentRecmd(Model model ,  HttpSession session , String pageNum) {
		String id = (String)session.getAttribute("id");
		String kid = (String)session.getAttribute("kid");
		
		int pageSize = 10;
		
			if(pageNum == null) {
				pageNum ="1";
			}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number=0;
	    String userid = null;
		    if(id != null) {
		    	userid = id;
			} else if(kid != null) {
				userid = kid;
			}
	    count = service.myContRecCount(userid);
	    List articleList = null;
		    if(count > 0) {
		    	articleList = service.myContRecList(userid, startRow, endRow);
		    }
	    number = count -(currentPage -1)*pageSize;
	    model.addAttribute("pageSize",pageSize);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("currentPage",currentPage);
	    model.addAttribute("startRow",startRow);
	    model.addAttribute("endRow",endRow);
	    model.addAttribute("count",count);
	    model.addAttribute("number",number);
	    model.addAttribute("articleList",articleList);
		return "mypage/myContentRecmd";
	}
	
//	내가 작성한 글 향수 리뷰 보러가기 
	@RequestMapping("myContentReview")
	public String myContentReview(Model model , HttpSession session , ReviewDTO rdto, PerfumeDTO pdto , String pageNum) {
		String id = (String)session.getAttribute("id");
		String kid = (String)session.getAttribute("kid");
		int pageSize = 10;
			if(pageNum == null) {
				pageNum ="1";
			}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number=0;
	    String userid = null;
		    if(id != null) {
		    	userid = id;
			} else if(kid != null) {
				userid = kid;
			}
	    count = service.myContRecCount(userid);
	    List articleList = null;
		    if(count > 0) {
					articleList = service.myContRecList(userid, startRow, endRow);
		    }
	    number = count -(currentPage -1)*pageSize;
	    model.addAttribute("pageSize",pageSize);
	    model.addAttribute("pageNum",pageNum);
	    model.addAttribute("currentPage",currentPage);
	    model.addAttribute("startRow",startRow);
	    model.addAttribute("endRow",endRow);
	    model.addAttribute("count",count);
	    model.addAttribute("number",number);
	    model.addAttribute("articleList",articleList);
		return "mypage/myContentReview";
	}
}
