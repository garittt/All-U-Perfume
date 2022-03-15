package com.perfume.mybatis;

import com.perfume.beans.PerfumeDTO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.perfume.beans.AbsSurveyDTO;
import com.perfume.beans.BrandDTO;
import com.perfume.beans.NoteDTO;


public interface SurveyMapper {

	public List<String> noteNumCheck(NoteDTO ndto);
	
	public List<PerfumeDTO> accNoteResult(NoteDTO ndto);
	
	public List<PerfumeDTO> brandSearch(BrandDTO bdto);
	
	public List<AbsSurveyDTO> absSurvey1();
	
	public List<AbsSurveyDTO> absSurvey2();
	
	public List<AbsSurveyDTO> absSurvey3();
	
	public List<AbsSurveyDTO> absSurvey4(String third);
	
	public List<AbsSurveyDTO> absSurvey5(String fourth);
	
	public List<AbsSurveyDTO> absSurveyResult1(String gender);
	
	public List<AbsSurveyDTO> absSurveyResult2(String season);
	
	public List<AbsSurveyDTO> absSurveyResult3(String third);
	
	public List<AbsSurveyDTO> absSurveyResult4(String fourth);
	
	public List<AbsSurveyDTO> absSurveyResult5(String fifth);
	
	public List<String> absNoteNumCheck(NoteDTO ndto);
		
	public int getPerfumeCount(NoteDTO ndto);
	
										//param은 xml의 매개변수를 지정하는 역할!
	public List<PerfumeDTO> absNoteResult (@Param("n_number") String[] n_number,
											@Param("gender")String gender,
											@Param("season") String season);
	
}
