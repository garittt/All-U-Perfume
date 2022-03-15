package com.perfume.controller;


import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.perfume.beans.AbsSurveyDTO;
import com.perfume.beans.FileInfo;
import com.perfume.beans.PerfumeDTO;
import com.perfume.beans.NoteDTO;
import com.perfume.service.PerfumeService;
import com.perfume.service.SurveyService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import oracle.net.ano.Service;

@Controller
@Slf4j
@Log4j
@RequestMapping("/survey/")
public class SurveyController {
	
	@Autowired
	private SurveyService service;
	
	@Autowired
	private PerfumeService service2;
	
	//설문 시작 페이지
	@RequestMapping("surveyStart")
	public String surveyStart(){
		return "survey/surveyStart";
	}
	//구체적 설문 페이지
	@RequestMapping("accSurvey")
	public String accSurvey(){
		return "survey/accSurvey";
	}
	//구체적 설문 결과 페이지
	@RequestMapping("accSurveyResult")
	public String accResult(NoteDTO ndto, Model model, String pageNum){
		//노트테이블에서 노트 번호 뽑아오기
		List<String> accList = service.SurveyNoteNumCheck(ndto);
		//퍼퓸 테이블에 노트번호 넣어서 검색하기, 서비스에서 반복문으로 검색
		List<PerfumeDTO> perfumeList = service.SurveyAccNoteResult(accList);
		model.addAttribute("result",perfumeList);
		//브랜드 넘기기
	    List<String> brandNameList = new ArrayList();
	    for ( int i = 0 ; i< perfumeList.size() ; i++) {
	            PerfumeDTO a = perfumeList.get(i);
	            String aa = a.getD_number();
	            brandNameList.add(aa);
	      } //서비스에서 반복문으로 검색
	    List<PerfumeDTO> brandName = service.SurveyBrandSearch(brandNameList);
	    model.addAttribute("brand",brandName);	 
		return "survey/accSurveyResult";
	}
	//추상적 설문 페이지
	@RequestMapping("absSurvey")
	public String absSurvey(Model model, AbsSurveyDTO adto){
		model.addAttribute("first", service.SurveyAbsSurvey1()); 
		return "survey/absSurvey";
	}
	//추상적 설문 페이지2
	@RequestMapping("absSurvey2")
	public String absSurvey2(Model model, AbsSurveyDTO adto){
		model.addAttribute("second", service.SurveyAbsSurvey2());
		return "survey/absSurvey2";
	}
	//추상적 설문 페이지3
	@RequestMapping("absSurvey3")
	public String absSurvey3(Model model, AbsSurveyDTO adto){
		model.addAttribute("third", service.SurveyAbsSurvey3());
		return "survey/absSurvey3";
	}
	//추상적 설문 페이지4
	@RequestMapping("absSurvey4")
	public String absSurvey4(Model model, AbsSurveyDTO adto){
		model.addAttribute("fourth", service.SurveyAbsSurvey4(adto.getThird())); //bind 칼럼을 통해 이전 결과의 부모분류를 가져옴
		return "survey/absSurvey4";
	}
	//추상적 설문 페이지5
	@RequestMapping("absSurvey5")
	public String absSurvey5(Model model, AbsSurveyDTO adto){
		model.addAttribute("fifth", service.SurveyAbsSurvey5(adto.getFourth()));//bind 칼럼을 통해 이전 결과의 부모분류를 가져옴
		return "survey/absSurvey5";
	}
	//추상적 설문 답안 확인 후 결과로 넘김
	@RequestMapping("absSurveyConfirm")
	public String absSurveyComfirm(Model model, AbsSurveyDTO adto , String gender, String season){
		model.addAttribute("survey1",service.SurveyAbsSurveyResult1(adto.getGender())); 
		model.addAttribute("survey2",service.SurveyAbsSurveyResult2(adto.getSeason())); 
		model.addAttribute("survey3",service.SurveyAbsSurveyResult3(adto.getThird())); 
		model.addAttribute("survey4",service.SurveyAbsSurveyResult4(adto.getFourth())); 
		model.addAttribute("survey5",service.SurveyAbsSurveyResult5(adto.getFifth())); 
		model.addAttribute("gender", gender);
		model.addAttribute("season", season);
		return "survey/absSurveyConfirm";
	}
	//추상적 설문 결과 확인 페이지 
	@RequestMapping("absSurveyResult")
    public String absResult(Model model, AbsSurveyDTO adto , NoteDTO ndto , PerfumeDTO pdto, String gender , String season) {
//      note테이블의 대분류를 perfume테이블의 각 노트 번호와 매칭, 설문 결과 노트를 가져와서 콤마 기준으로 자르고 리스트에 저장
        String note = adto.getNote();
        model.addAttribute("notePr", note);
        List<String> surveyNote = Arrays.asList(note.split(",")); 
//      note테이블의 대분류 리스트를 이용해 각 대분류에 해당하는 자식 노트를 리스트에 저장
        List<String> noteList = service.SurveyAbsNoteNumCheck(surveyNote);
//      자식 노트가 담긴 리스트를 perfume테이블에서 문자열 비교를 통해 향수 정보 검색 
        int absListSize = noteList.size();
		 String[] n_number = noteList.toArray(new String[absListSize]);
		 List perfumeList = service.SurveyAbsNoteResult(n_number, gender, season);
         model.addAttribute("result",perfumeList); 
        
//        브랜드 이름 가져오기 
        List<String> brandNameList = new ArrayList();
        for ( int i = 0 ; i< perfumeList.size() ; i++) {
            PerfumeDTO aaa = (PerfumeDTO) perfumeList.get(i);
            String aaaa = aaa.getD_number();
            brandNameList.add(aaaa);
        }
        List<PerfumeDTO> brandName = service.SurveyBrandSearch(brandNameList);
        model.addAttribute("brand",brandName);
         
        return "/survey/absSurveyResult";
    }
	
}
