package com.perfume.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.perfume.beans.AdminDTO;
import com.perfume.beans.InquiryDTO;
import com.perfume.beans.MemberDTO;
import com.perfume.beans.Paging;
import com.perfume.beans.PerfumeDTO;
import com.perfume.beans.ReportBoardDTO;


public interface AdminMapper {
	
	public int adminLoginCheck (AdminDTO adminDTO);
	
	public List<InquiryDTO> inquiry();
	
	public int listCount();
	
	public List<InquiryDTO> listPage(@Param("startRow")int startRow, @Param("endRow")int endRow);;
	
	public InquiryDTO inquiryContent(int num);
	
	public int inquiryDelete(int num);
	
	public int inquiryAnswer(InquiryDTO idto);
	
	public int readcount(int b_number);
		
	public int countReport();
		
	public List<ReportBoardDTO> reportContent(Paging pa);
		
	public ReportBoardDTO checkingReport(ReportBoardDTO rdto);
		
	public int deleteOnAdmin (int b_number);
		
	public int deleteOnBoard (int b_number);
	
	public List<MemberDTO> searchMem (Paging pa);
	 
	public int countMem ();
	
	public MemberDTO checkMem (MemberDTO mdto);
	
	public int memDelete (String id);
}
