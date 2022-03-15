package com.perfume.service;

import org.springframework.stereotype.Service;

import com.perfume.beans.AbsSurveyDTO;
import com.perfume.beans.BrandDTO;
import com.perfume.beans.NoteDTO;
import com.perfume.beans.PerfumeDTO;
import com.perfume.mybatis.SurveyMapper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Service
public class SurveyServiceImpl implements SurveyService {
	
	@Setter(onMethod_=@Autowired)
	private SurveyMapper mapper;

	
	@Override
	public List<String> SurveyNoteNumCheck(NoteDTO ndto) {
		return mapper.noteNumCheck(ndto);
	}

	@Override
	public List<PerfumeDTO> SurveyAccNoteResult(List<String> list) {
		List<PerfumeDTO> perfumeList = new ArrayList();
		NoteDTO ndto = new NoteDTO();
		for(int i = 0; i < list.size(); i++) {
			ndto.setN_number(list.get(i));
			perfumeList.addAll(mapper.accNoteResult(ndto));
		}
		
		return perfumeList;
	}
	
	@Override
    public List<PerfumeDTO> SurveyBrandSearch(List<String> list) {
        List<PerfumeDTO> brandName = new ArrayList();
        BrandDTO bdto = new BrandDTO();
        for(int i = 0; i < list.size(); i++) {
            bdto.setD_number(list.get(i));
            brandName.addAll(mapper.brandSearch(bdto));
        }
        return brandName;
    }

	@Override
	public List<AbsSurveyDTO> SurveyAbsSurvey1() {
		return mapper.absSurvey1();
	}

	@Override
	public List<AbsSurveyDTO> SurveyAbsSurvey2() {
		return mapper.absSurvey2();
	}

	@Override
	public List<AbsSurveyDTO> SurveyAbsSurvey3() {
		return mapper.absSurvey3();
	}

	@Override
	public List<AbsSurveyDTO> SurveyAbsSurvey4(String third) {
		return mapper.absSurvey4(third);
	}

	@Override
	public List<AbsSurveyDTO> SurveyAbsSurvey5(String fourth) {
		return mapper.absSurvey5(fourth);
	}

	@Override
	public List<AbsSurveyDTO> SurveyAbsSurveyResult1(String gender) {
		return mapper.absSurveyResult1(gender);
	}

	@Override
	public List<AbsSurveyDTO> SurveyAbsSurveyResult2(String season) {
		return mapper.absSurveyResult2(season);
	}

	@Override
	public List<AbsSurveyDTO> SurveyAbsSurveyResult3(String third) {
		return mapper.absSurveyResult3(third);
	}

	@Override
	public List<AbsSurveyDTO> SurveyAbsSurveyResult4(String fourth) {
		return mapper.absSurveyResult4(fourth);
	}

	@Override
	public List<AbsSurveyDTO> SurveyAbsSurveyResult5(String fifth) {
	
		return mapper.absSurveyResult5(fifth);
	}

	@Override
	public List<String> SurveyAbsNoteNumCheck(List<String> list) {
		List<String> noteList = new ArrayList();
		NoteDTO ndto = new NoteDTO();
		for (int i = 0 ; i < list.size() ; i++) {
			ndto.setNoteSearch(list.get(i));
			noteList.addAll(mapper.absNoteNumCheck(ndto));
		}
		return noteList;
	}

	@Override
	public List<PerfumeDTO> SurveyAbsNoteResult(String[] n_number , String gender , String season) {		
		return mapper.absNoteResult(n_number, gender, season);
	}
		
}
