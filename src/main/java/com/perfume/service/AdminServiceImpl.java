package com.perfume.service;

import com.perfume.beans.AdminDTO;
import com.perfume.beans.InquiryDTO;
import com.perfume.beans.MemberDTO;
import com.perfume.beans.Paging;
import com.perfume.beans.ReportBoardDTO;
import com.perfume.mybatis.AdminMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Log4j
@Service
public class AdminServiceImpl implements AdminService{
	
	@Setter(onMethod_=@Autowired)
	private AdminMapper mapper;

	@Override
	public int adminAdminLoginCheck(AdminDTO adminDTO) {
		return mapper.adminLoginCheck(adminDTO);
	}

	@Override
	public List<InquiryDTO> inquiry() {
		return mapper.inquiry();
	}
	
	@Override
	public int listCount() {
		return mapper.listCount();
	}
	
	@Override
	public List<InquiryDTO> listPage(int startRow, int endRow) {
		
		return mapper.listPage(startRow, endRow);
	}
	
	@Override
	public InquiryDTO inquiryContent(int num) {
		return mapper.inquiryContent(num);
	}
	
	@Override
	public int inquiryDelete(int num) {
		return mapper.inquiryDelete(num);
	}

	@Override
	public int inquiryAnswer(InquiryDTO idto) {
		
		return mapper.inquiryAnswer(idto);
	}

	@Override
	public int countReport() {
		return mapper.countReport();
	}

	@Override
	public List<ReportBoardDTO> reportContent(Paging pa) {
		return mapper.reportContent(pa);
	}

	@Override
	public ReportBoardDTO checkingReport(ReportBoardDTO rdto) {
		return mapper.checkingReport(rdto);
	}

	@Override
	public int deleteOnAdmin(int b_number) {
		return mapper.deleteOnAdmin(b_number);
	}

	@Override
	public int deleteOnBoard(int b_number) {
		return mapper.deleteOnBoard(b_number);
	}

	@Override
	public List<MemberDTO> searchMem(Paging pa) {
		return mapper.searchMem(pa);
	}
	
	@Override
	public int countMem() {
		return mapper.countMem();
	}
	
	@Override
	public int memDelete(String id) {
		return mapper.memDelete(id);
	}

	@Override
	public MemberDTO checkMem(MemberDTO mdto) {
		return mapper.checkMem(mdto);
	}






	
	
}
