package com.perfume.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.perfume.beans.BoardDTO;
import com.perfume.beans.InquiryDTO;
import com.perfume.beans.NoteDTO;
import com.perfume.beans.PerfumeDTO;
import com.perfume.beans.ReviewDTO;
import com.perfume.beans.WishDTO;
import com.perfume.mybatis.MypageMapper;


import lombok.Setter;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Setter(onMethod_=@Autowired)
	private MypageMapper mapper;

	@Override
	public int wishRegister(String f_number , String writer) {
		return mapper.wishRegister(f_number , writer);
	}

	@Override
	public int wishRegisterCh(String f_number, String writer) {
		return mapper.wishRegisterCh(f_number , writer);
	}

	@Override
	public List<PerfumeDTO> wishSearch(List<String> list) {
		List<PerfumeDTO> fNumList = new ArrayList();
		PerfumeDTO pdto = new PerfumeDTO();
		for(int i = 0 ; i < list.size() ; i ++) {
			pdto.setF_number(list.get(i));
			fNumList.addAll(mapper.wishSearch(pdto));
		}
		
		return fNumList;
	}

	@Override
	public List wishList(String writer) {
		return mapper.wishList(writer);
	}

	@Override
	public int wishListDelete(String writer, String f_number) {
		return mapper.wishListDelete(writer, f_number);
	}

	@Override
	public int inquiryInsert(InquiryDTO idto) {
		return mapper.inquiryInsert(idto);
	}
	
	@Override
	public int inquiryCount(String id) {
		return mapper.inquiryCount(id);
	}

	@Override
	public List<InquiryDTO> inquirySearch(String id ,  @Param("startRow")int startRow, @Param("endRow")int endRow) {
		return mapper.inquirySearch(id , startRow , endRow);
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
	public int inquiryUpdate(InquiryDTO idto) {
		return mapper.inquiryUpdate(idto);
	}
	
	@Override
	public int myContQACount(String writer) {
		return mapper.myContQACount(writer);
	}

	@Override
	public int myContRecCount(String writer) {
		return mapper.myContRecCount(writer);
	}

	@Override
	public int myContReCount(String writer) {
		return mapper.myContReCount(writer);
	}

	@Override
	public List<BoardDTO> myContQAList(String writer, int startRow, int endRow) {
		return mapper.myContQAList(writer, startRow, endRow);
	}

	@Override
	public List<BoardDTO> myContRecList(String writer, int startRow, int endRow) {
		return mapper.myContRecList(writer, startRow, endRow);
	}

	@Override
	public List<ReviewDTO> myContReList(String writer, int startRow, int endRow) {
		return mapper.myContReList(writer, startRow, endRow);
	}
	
	@Override
	public PerfumeDTO myContentRePer(String p_number) {
		return mapper.myContentRePer(p_number);
	}

	





	


	



	
	
	
	

}
