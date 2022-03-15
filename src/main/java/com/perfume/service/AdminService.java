package com.perfume.service;

import java.util.List;

import com.perfume.beans.AdminDTO;
import com.perfume.beans.InquiryDTO;
import com.perfume.beans.MemberDTO;
import com.perfume.beans.Paging;
import com.perfume.beans.ReportBoardDTO;

public interface AdminService {

	public int adminAdminLoginCheck (AdminDTO adminDTO);
	
	public List<InquiryDTO> inquiry();
	
	public int listCount();
	
	public List<InquiryDTO> listPage(int startRow, int endRow);
	
	public InquiryDTO inquiryContent(int num);
	
	public int inquiryDelete(int num);
	
	public int inquiryAnswer(InquiryDTO idto);
		
	public int countReport();
		
	public List<ReportBoardDTO> reportContent(Paging pa);

	public ReportBoardDTO checkingReport(ReportBoardDTO rdto);
		
	public int deleteOnAdmin (int b_number);
		
	public int deleteOnBoard (int b_number);
	
	public List<MemberDTO> searchMem (Paging pa);
	
	public int countMem();
	
	public MemberDTO checkMem (MemberDTO mdto);
	
	public int memDelete (String id);
}
