package com.perfume.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.perfume.beans.BoardDTO;
import com.perfume.beans.CommentDTO;
import com.perfume.beans.Paging;
import com.perfume.mybatis.BestMapper;


@Service
public class BestServiceImpl implements BestService{

	@Autowired
	private BestMapper mapper;
	
	@Override
	public int insertContent(BoardDTO dto) {
		return mapper.insertContent(dto);
	}

	@Override
	public List<BoardDTO> getAllList(Paging pa) {
		return mapper.getAllList(pa);
	}

	@Override
	public int getAllCount() {
		return mapper.getAllCount();
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
	public List<BoardDTO> getSearchList(Paging pa, String category, String input) {
		return mapper.getSearchList(pa.getRowStart(), pa.getRowEnd(), category, input);
	}

	@Override
	public int getSearchCount(String category, String input) {
		return mapper.getSearchCount(category, input);
	};
	
	@Override
	public int insertComment(CommentDTO dto) {
		return mapper.insertComment(dto);
	}

	@Override
	public List<CommentDTO> getComment(CommentDTO dto) {
		return mapper.getComment(dto);
	}

	@Override
	public int getCommentCount(CommentDTO dto) {
		return mapper.getCommentCount(dto);
	}

	@Override
	public int updateComment(CommentDTO dto) {
		return mapper.updateComment(dto);
	}

	@Override
	public int maxNumber() {
		return mapper.maxNumber();
	}

	@Override
	public int maxReNumber(int ref) {
		return mapper.maxReNumber(ref);
	}

	@Override
	public int deleteComment(int cno) {
		return mapper.deleteComment(cno);
	};
}
