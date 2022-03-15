package com.perfume.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.perfume.beans.BoardDTO;
import com.perfume.beans.Paging;
import com.perfume.mybatis.QMapper;

@Service
public class QServiceImpl implements QService{

	@Autowired
	private QMapper mapper;
	
	@Override
	public int insertContent(BoardDTO dto) {
		return mapper.insertContent(dto);
	}

	@Override
	public List<BoardDTO> getAllList(Paging pa ,BoardDTO dto) {
		return mapper.getAllList(pa.getRowStart(), pa.getRowEnd(), dto.getBoardnum());
	}

	@Override
	public int getAllCount(BoardDTO dto) {
		return mapper.getAllCount(dto.getBoardnum());
	}

	@Override
	public int readCountUp(int b_number) {
		return mapper.readCountUp(b_number);
	}

	@Override
	public BoardDTO getContent(int b_number) {
		return mapper.getContent(b_number);
	}

	@Override
	public int updateContent(BoardDTO dto) {
		return mapper.updateContent(dto);
	}

	@Override
	public int deleteContent(int b_number) {
		return mapper.deleteContent(b_number);
	}

	@Override
	public List<BoardDTO> getSearchList(Paging pa, String category, String input  ) {
		System.out.println(input+"========"+category+"=========="+pa);
		return mapper.getSearchList(pa.getRowStart(), pa.getRowEnd(), category, input);
	}

	@Override
	public int getSearchCount(String category, String input) {
		return mapper.getSearchCount(category, input);
	}

	@Override
	public int insertAn(BoardDTO dto) {
		return mapper.insertAn(dto);
	};
}
