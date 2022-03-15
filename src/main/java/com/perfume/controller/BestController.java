package com.perfume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.perfume.beans.BoardDTO;
import com.perfume.beans.CommentDTO;
import com.perfume.beans.Pagemaker;
import com.perfume.beans.Paging;
import com.perfume.service.BestService;


@Controller
@RequestMapping("/best/")
public class BestController {

	@Autowired
	private BestService service;
	
	@RequestMapping("list")
	public String list(Model model, Paging pa) {
		model.addAttribute("list", service.getAllList(pa));
		Pagemaker pm = new Pagemaker();
		pm.setPa(pa);
		pm.setTotalCount(service.getAllCount());
		model.addAttribute("pa", pa);
		model.addAttribute("count", service.getAllCount());
		model.addAttribute("pageMaker", pm);
		return "best/list";
	}
	
	@RequestMapping("searchList")
	public String search(Model model, Paging pa, String category, String input) {
		model.addAttribute("list", service.getSearchList(pa, category, input));
		Pagemaker pm = new Pagemaker();
		pm.setPa(pa);
		pm.setTotalCount(service.getSearchCount(category, input));
		model.addAttribute("pa", pa);
		model.addAttribute("count", service.getSearchCount(category, input));
		model.addAttribute("pageMaker", pm);
		model.addAttribute("category", category);
		model.addAttribute("input", input);
		return "best/search";
	}
	
	@RequestMapping("write")
	public String write() {
		return "best/write";
	}
	
	@RequestMapping("writePro")
	public @ResponseBody int wrtiePro(@RequestBody BoardDTO dto) {
		int result = 0;
		System.out.println(dto);
		result = service.insertContent(dto);
		return result;
	}
	
	@RequestMapping("readcountUp")
	public String readcountUp(int b_number, RedirectAttributes rttr) {
		service.readCountUp(b_number);
		rttr.addAttribute("b_number", b_number);
		
		return "redirect:content";
	}
	
	@RequestMapping("content")
	public String content(int b_number, Model model, CommentDTO commentDTO) {
		model.addAttribute("boardDTO", service.getContent(b_number));
		BoardDTO dto = service.getContent(b_number);
		commentDTO.setBoardnum(dto.getBoardnum());
		commentDTO.setBno(dto.getB_number());
		model.addAttribute("commentDTO", service.getComment(commentDTO));
		model.addAttribute("commentCount", service.getCommentCount(commentDTO));
		return "best/content";
	}
	
	@RequestMapping("update")
	public String update(int b_number, Model model) {
		model.addAttribute("boardDTO", service.getContent(b_number));
		return "best/update";
	}
	
	@RequestMapping("updatePro")
	public @ResponseBody int updatePro(@RequestBody BoardDTO dto) {
		System.out.println(dto);
		int result = 0;
		result = service.updateContent(dto);
		
		return result;
	};
	
	@RequestMapping("delete")
	public @ResponseBody int delete(int b_number) {
		int result = 0;
		result = service.deleteContent(b_number);
		
		return result;
	}
	
	@RequestMapping("commentPro")
	public @ResponseBody int commentPro(@RequestBody CommentDTO dto , Model model) {
		int result = 0;
		int ref = dto.getCno();
		int re_step = dto.getRe_step();
			if(dto.getCno() != 0) {
				re_step = service.maxReNumber(dto.getRef())+1;
				dto.setRef(dto.getCno());
				dto.setRe_step(re_step);
			} else {
				ref = service.maxNumber()+1;
				dto.setRef(ref);
				}
		result = service.insertComment(dto);
		return result;
	}
	
	@RequestMapping("updateComment")
	public @ResponseBody int updateComment(@RequestBody CommentDTO dto) {
		int result = 0;
		result = service.updateComment(dto);
		
		return result;
	}
	
	@RequestMapping("deleteComment")
	public @ResponseBody int deleteComment(int cno) {
		int result = 0;
		result = service.deleteComment(cno);
		
		return result;
	}
	
}
