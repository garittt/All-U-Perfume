package com.perfume.controller;

import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.perfume.beans.FileInfo;
import com.perfume.beans.Pagemaker;
import com.perfume.beans.Paging;
import com.perfume.beans.PerfumeDTO;
import com.perfume.beans.ReviewDTO;
import com.perfume.service.PerfumeService;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Log4j
@Controller
@RequestMapping("/main/")
public class PerfumeController {
	
	@Autowired
	private PerfumeService service;
	
	@Autowired
	private FileInfo fileinfo;
	
	//메인페이지
	@RequestMapping("list")
	public String list(Model model, Paging pa, PerfumeDTO dto, ReviewDTO rdto) {
		model.addAttribute("list",service.listPage(pa));
		model.addAttribute("prank",service.perlikeRank(dto));
		model.addAttribute("rerank",service.relikeRank(rdto));
		model.addAttribute("unrerank",service.reunlikeRank(rdto));
		Pagemaker pagemaker = new Pagemaker();
		pagemaker.setPa(pa);
		pagemaker.setTotalCount(service.listCount());
		model.addAttribute("pa", pa);
		model.addAttribute("pageMaker", pagemaker);
		return "perfume/perfumePage";
	}
	
	
	//검색 페이지 
	@RequestMapping("search")
	public String search(Model model,PerfumeDTO dto, Paging pa, RedirectAttributes re, ReviewDTO rdto, 
			@RequestParam(required = false) String c_gender, @RequestParam(required = false) String c_season ) { 
		model.addAttribute("prank",service.perlikeRank(dto));
		model.addAttribute("rerank",service.relikeRank(rdto));
		model.addAttribute("unrerank",service.reunlikeRank(rdto));
		String choose = dto.getChoose();
		String [] gender = dto.getC_gender();
		String [] season = dto.getC_season();
			if(choose != null && gender == null && season == null ) {
				if(dto.getKeyword() != null) {
					model.addAttribute("keyword",service.keyword(dto, pa));
					model.addAttribute("choose",dto.getChoose());
					model.addAttribute("key",dto.getKeyword());
					Pagemaker pagemaker = new Pagemaker();
					pagemaker.setPa(pa);
					model.addAttribute("pageMaker",pagemaker);
					pagemaker.setTotalCount(service.keyCount(dto));
					model.addAttribute("pa", pa);
					return "perfume/perfumekPage";
				}
			}else{ 
				if(c_gender != null) {	
				model.addAttribute("cate",service.cate(dto,pa));	
				model.addAttribute("choose",dto.getChoose());
				model.addAttribute("key",dto.getKeyword());
				model.addAttribute("c_gender",c_gender);
				Pagemaker pagemaker = new Pagemaker();
				pagemaker.setPa(pa);
				model.addAttribute("pageMaker",pagemaker);
				pagemaker.setTotalCount(service.cateCount(dto));
				model.addAttribute("pa", pa);
				return "perfume/perfumePagePro";
			}
			if(c_season != null) {
				model.addAttribute("cate",service.cate(dto,pa));	
				model.addAttribute("choose",dto.getChoose());
				model.addAttribute("key",dto.getKeyword());
				model.addAttribute("c_season",c_season);
				Pagemaker pagemaker = new Pagemaker();
				pagemaker.setPa(pa);
				model.addAttribute("pageMaker",pagemaker);
				pagemaker.setTotalCount(service.cateCount(dto));
				model.addAttribute("pa", pa);
				return "perfume/perfumePagePro";
				}
			}
			return "perfume/perfumePagePro";	
	}
	
		
	
	
	//상품상세페이지
	@RequestMapping("detail")
	public String detail(Model model, PerfumeDTO perfume, ReviewDTO rdto, Paging pa, String re) {
		model.addAttribute("getDetail",service.getDetail(perfume));
		List<PerfumeDTO> detail = service.getDetail(perfume);
		PerfumeDTO a = detail.get(0);
		
		model.addAttribute("brand",service.brand(a.getD_number()).getD_name());
		model.addAttribute("brandP",service.brand(a.getD_number()).getD_picsmall());
		String top = a.getTopnote_num();
	    String heart = a.getHeartnote_num();
	    String base = a.getBasenote_num();
		    if( top != null) {
		        List<String> topnote = Arrays.asList(top.split("-"));
		        model.addAttribute("topnote",service.note(topnote));
		    }
	
		    if( heart != null) {
		        List<String> heartnote = Arrays.asList(heart.split("-"));
		        model.addAttribute("heartnote",service.note(heartnote));
		    }
	
		    if( base != null) {
		        List<String> basenote = Arrays.asList(base.split("-"));
		        model.addAttribute("basenote",service.note(basenote));
		    }
	    model.addAttribute("getReview",service.getReview(rdto));
		return "perfume/perfumeDetail";
	}
	
	
	//리뷰x 상세페이지
	@RequestMapping("sdetail")
	public String sdetail(Model model, PerfumeDTO perfume,  ReviewDTO rdto) {
		model.addAttribute("getDetail",service.getDetail(perfume));
		List<PerfumeDTO> detail = service.getDetail(perfume);
		PerfumeDTO a = detail.get(0);
		model.addAttribute("brand",service.brand(a.getD_number()).getD_name());
		model.addAttribute("brandP",service.brand(a.getD_number()).getD_picsmall());
		String top = a.getTopnote_num();
	    String heart = a.getHeartnote_num();
	    String base = a.getBasenote_num();
		    if( top != null) {
		        List<String> topnote = Arrays.asList(top.split("-"));
		        model.addAttribute("topnote",service.note(topnote));
		    }
		    if( heart != null) {
		        List<String> heartnote = Arrays.asList(heart.split("-"));
		        model.addAttribute("heartnote",service.note(heartnote));
		    }
		    if( base != null) {
		        List<String> basenote = Arrays.asList(base.split("-"));
		        model.addAttribute("basenote",service.note(basenote));
		    }
		return "perfume/perfumesDetail";
	
	}
	
	
	//향수리뷰
	@RequestMapping("review")
	public String review(
	ReviewDTO rdto, PerfumeDTO perfume, RedirectAttributes re ,HttpServletRequest request, Model model)  {
		int rchLike = service.rchLike(rdto);
			if (rchLike == 0 ) {
				service.reviewInsert(rdto);
				service.rchInsert(rdto);
			}else if(rchLike >= 1) {
				request.setAttribute("msg", "하나의 향수에는 한번의 리뷰만 등록 할 수 있습니다");
				request.setAttribute("p_number",perfume.getP_number());
				request.setAttribute("f_name",perfume.getF_name());
				return "perfume/alert";
			}
		re.addAttribute("p_number",perfume.getP_number());
		re.addAttribute("f_name",perfume.getF_name());
		return "redirect:detail";
	}


				
	//향수 좋아요	
	@RequestMapping("perlike")
	public @ResponseBody int perlike(Model model,RedirectAttributes re, PerfumeDTO perfume, ReviewDTO rdto){
		int perlikeCh = service.perLikeCh(rdto);
		int result = 0;
			if (perlikeCh == 0){
				service.perInsert(rdto, perfume);
				service.perLike(perfume);
				result = 1;
			}else if (perlikeCh >= 1){
				result = 0;
				}
		re.addAttribute("p_number",perfume.getP_number());
		re.addAttribute("f_name",perfume.getF_name());	
		return result;
	}
	
	
	//리뷰좋아요
	@RequestMapping("like")
	public @ResponseBody int like(Model model,RedirectAttributes re, PerfumeDTO perfume, ReviewDTO rdto){
		int chlike = service.chLike(rdto);
		int result = 0;
			if (chlike == 0){
				service.chInsert(rdto);
				service.like(rdto);
				result = 1;
			}else if (chlike >= 1){
				result = 0;
					
				}
		re.addAttribute("p_number",perfume.getP_number());
		re.addAttribute("f_name",perfume.getF_name());
		return result;
	}
	
	//리뷰 싫어요
	@RequestMapping("unlike")
	public @ResponseBody int unlike(Model model,RedirectAttributes re, PerfumeDTO perfume, ReviewDTO rdto){
		int chlike = service.chLike(rdto);
		int result = 0;
			if (chlike == 0){
				service.chInsert(rdto);
				service.unLike(rdto);
				result = 1;
			}else if (chlike >= 1){
				result = 0;
			}
		re.addAttribute("p_number",perfume.getP_number());
		re.addAttribute("f_name",perfume.getF_name());
		return result;
	}
	
	//리뷰 지우기 
	@RequestMapping("reDel")
	public @ResponseBody int reDel( ReviewDTO rdto) {
		int mydel = service.reMyDel(rdto);	
		return mydel;
	}
	
	//리뷰수정 위해 가지고오기
	@RequestMapping("reviewRe")
	public String reviewRe(ReviewDTO rdto, Model model) {
		model.addAttribute("reviewGet",service.reviewGet(rdto));
		return "perfume/reviewRe";
	}
	
	//리뷰 수정
	@RequestMapping("reRe")
	public @ResponseBody int reRe(ReviewDTO rdto) {
		int reRe = service.reviewRe(rdto);
		return reRe;
	}
	
	//내 리뷰가지고 오기
	@RequestMapping("myReview")
	public String myReview(ReviewDTO rdto, Model model, Paging pa) {
		model.addAttribute("myreview",service.getMRveiw(rdto,pa));
		String writer = rdto.getWriter();
		model.addAttribute("writer",writer);
		Pagemaker pagemaker = new Pagemaker();
		pagemaker.setPa(pa);
		pagemaker.setTotalCount(service.getMRveiwC(rdto));
		model.addAttribute("pa", pa);
		model.addAttribute("pageMaker", pagemaker);
		return"mypage/myReview";
	}
}
