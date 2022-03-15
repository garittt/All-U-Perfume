package com.perfume.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.perfume.beans.BoardDTO;
import com.perfume.beans.Pagemaker;
import com.perfume.beans.Paging;
import com.perfume.service.QService;

@Controller
@RequestMapping("/q/")
public class QController {

	@Autowired
	private QService service;
	
	@RequestMapping("list")
	public String list(Model model, Paging pa, BoardDTO dto) {
		model.addAttribute("list", service.getAllList(pa, dto));
		Pagemaker pm = new Pagemaker();
		pm.setPa(pa);
		pm.setTotalCount(service.getAllCount(dto));
		model.addAttribute("pa", pa);
		model.addAttribute("count", service.getAllCount(dto));
		model.addAttribute("pageMaker", pm);
		return "q/list";
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
		return "q/search";
	}
	
	@RequestMapping("write")
	public String write() {
		return "q/write";
	}
	
	@RequestMapping("writePro")
	public @ResponseBody int wrtiePro(@RequestBody BoardDTO dto) {
		int result = 0;
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
	public String content(int b_number, Model model) {
		model.addAttribute("boardDTO", service.getContent(b_number));
		return "/q/content";
	}
	
	@RequestMapping("update")
	public String update(int b_number, Model model) {
		model.addAttribute("boardDTO", service.getContent(b_number));
		return "/q/update";
	}
	
	@RequestMapping("updatePro")
	public @ResponseBody int updatePro(@RequestBody BoardDTO dto) {
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
	
	@RequestMapping("answer")
	public String answer(Model model, int b_number) {
		model.addAttribute("b_number",b_number);
		return "/q/answer";
	}
	
	@RequestMapping("answerIn")
	public @ResponseBody int answerIn(BoardDTO dto) {
		int result = 0;
		result = service.insertAn(dto);
		return result;
	}
	
}
