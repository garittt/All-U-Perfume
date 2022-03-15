package com.perfume.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.perfume.beans.BoardDTO;
import com.perfume.beans.InquiryDTO;
import com.perfume.beans.PerfumeDTO;
import com.perfume.beans.ReviewDTO;
import com.perfume.beans.WishDTO;



public interface MypageMapper {
	
	public int wishRegisterCh(@Param("f_number") String f_number , @Param("writer") String writer);
	
	public int wishRegister(@Param("f_number") String f_number , @Param("writer") String writer);
	
	public List<PerfumeDTO> wishSearch(PerfumeDTO pdto);
	
	public List wishList(String writer);
	
	public int wishListDelete( @Param("writer") String writer ,@Param("f_number") String f_number);
	
	public int wishListDeleteCk(@Param("writer") String writer , List chk);
	
	public int inquiryInsert(InquiryDTO idto);
	
	public int inquiryCount(String id);
	
	public List<InquiryDTO> inquirySearch(@Param("id") String id,@Param("startRow")int startRow, @Param("endRow")int endRow);
	
	public InquiryDTO inquiryContent(int num);
	
	public int inquiryUpdate(InquiryDTO idto);
	
	public int inquiryDelete(int num);

	public int myContQACount(String writer);
	
	public int myContRecCount(String writer);
	
	public int myContReCount(String writer);
	
	public List<BoardDTO> myContQAList(@Param("writer") String writer,@Param("startRow")int startRow, @Param("endRow")int endRow);
	
	public List<BoardDTO> myContRecList(@Param("writer") String writer,@Param("startRow")int startRow, @Param("endRow")int endRow);
	
	public List<ReviewDTO> myContReList(@Param("writer") String writer,@Param("startRow")int startRow, @Param("endRow")int endRow);
	
	public PerfumeDTO myContentRePer(String p_number);
	
}
