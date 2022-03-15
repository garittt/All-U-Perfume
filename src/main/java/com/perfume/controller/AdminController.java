package com.perfume.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.perfume.beans.InquiryDTO;
import com.perfume.beans.MemberDTO;
import com.perfume.beans.Pagemaker;
import com.perfume.beans.Paging;
import com.perfume.beans.ReviewDTO;
import com.perfume.beans.AdminDTO;
import com.perfume.service.AdminService;
import com.perfume.service.PerfumeService;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;




@Controller
@Slf4j
@Log4j
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private PerfumeService pservice;
	
	

	
	@RequestMapping("main")
	public String main() {
		return "admin/main";
	}
	
	@RequestMapping("login")
	public String login() {
		return "admin/login";
	}

	@RequestMapping("loginPro")
	public String loginPro(AdminDTO Adto, HttpSession session) {
		if(service.adminAdminLoginCheck(Adto)==1) {
			session.setAttribute("aid", Adto.getAid());
		}
		return "admin/loginPro";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin/logout";
	}
	
	@RequestMapping("review")
    public String review(Model model, ReviewDTO rdto, Paging pa) {
        Pagemaker pagemaker = new Pagemaker();
        pagemaker.setPa(pa);
        model.addAttribute("pageMaker",pagemaker);
        pagemaker.setTotalCount(pservice.getAReviewC(rdto));
        model.addAttribute("pa", pa);
        model.addAttribute("getAReview",pservice.getAReview(pa));

        return "admin/review_admin";
    }

    @RequestMapping("reviewDe")
    public @ResponseBody int reviewDe(HttpServletRequest re) {
        int result = 0;
        String[] ajaxMsg = re.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
            result += pservice.reDel(ajaxMsg[i]);
        }
        System.out.println();
        return result;
    }

//	1:1문의 전체 목록 
	@RequestMapping("inquiry")
	public String inquiry(Model model ,String pageNum, InquiryDTO idto) {
		int pageSize = 10;
			if(pageNum == null) {
				pageNum ="1";
			}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number=0;
	    count = service.listCount();
	    List articleList = null;
	    if(count > 0) {
	    	articleList = service.listPage(startRow, endRow);
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
		return "admin/inquiry";
	}
	
//	1:1 문의 삭제
	@RequestMapping("inquiryDelete")
	public String inquiryDelete(Model model , int num) {
		service.inquiryDelete(num);	
		return "redirect:inquiry";
	}
	
//	1:1 문의 내용보기
	@RequestMapping("inquiryContent")
	public String inquiryContent( Model model , int num ) {
		model.addAttribute("inquiry", service.inquiryContent(num));	
		return "admin/inquiryContent";
	}
	
//	1:1 문의 답변
	@RequestMapping("inquiryAnswer")
	public String inquiryAnswer( Model model , InquiryDTO idto) {
		model.addAttribute("num", idto.getNum());
		service.inquiryAnswer(idto);
		return "redirect:inquiryAnswerPro";
	}

//	1:1 문의 답변 완성
	@RequestMapping("inquiryAnswerPro")
	public String inquiryAnswerPro( Model model , InquiryDTO idto) {
		model.addAttribute("num", idto.getNum());
		return "admin/inquiryAnswerPro";
	}
		
	@RequestMapping("manageMem")
	public String manageMem(Model model, Paging pa) {
		model.addAttribute("list", service.searchMem(pa));
		Pagemaker pm = new Pagemaker();
		pm.setPa(pa);
		pm.setTotalCount(service.countMem());
		model.addAttribute("pa", pa);
		model.addAttribute("count", service.countMem());
		model.addAttribute("pageMaker", pm);
		return"admin/manageMem";
		}
		
	@RequestMapping("manageMemPro")
	public String manageMemPro(Model model, MemberDTO mdto) {
		mdto = service.checkMem(mdto);
		int result = service.memDelete(mdto.getId());
			if(result == 1) {
				model.addAttribute("result", result);
			}
		return"admin/manageMemPro";
		}


}
