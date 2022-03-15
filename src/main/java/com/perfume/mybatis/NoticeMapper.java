package com.perfume.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.perfume.beans.BoardDTO;
import com.perfume.beans.Paging;

public interface NoticeMapper {

	public int insertContent(BoardDTO dto);
	
	public List<BoardDTO> getAllList(Paging pa);
	
	public int getAllCount();
	
	public int readCountUp(int b_number);
	
	public BoardDTO getContent(int b_number);
	
	public int updateContent(BoardDTO dto);
	
	public int deleteContent(int b_number);
	
	public List<BoardDTO> getSearchList(@Param("rowStart")int rowStart, @Param("rowEnd")int rowEnd, 
										@Param("category") String category, @Param("input") String input);
	
	public int getSearchCount(@Param("category") String category, @Param("input") String input);
}
