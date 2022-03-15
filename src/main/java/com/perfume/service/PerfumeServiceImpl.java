package com.perfume.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.perfume.beans.BrandDTO;
import com.perfume.beans.NoteDTO;
import com.perfume.beans.Paging;
import com.perfume.beans.PerfumeDTO;
import com.perfume.beans.ReviewDTO;
import com.perfume.mybatis.PerfumeMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Service
public class PerfumeServiceImpl implements PerfumeService{
	
	@Setter(onMethod_=@Autowired)
	private PerfumeMapper mapper;

	
	//상품 디테일 가져오기
	@Override 
	public List<PerfumeDTO> getDetail(PerfumeDTO perfume)  {
		return mapper.getDetail(perfume);
	}

	//상품 리스트 갯수
	@Override
	public int listCount() {
		return mapper.listCount();
	}

	
	//상품전체 리스트
	@Override
	public List<PerfumeDTO> listPage(Paging pa) {
		return mapper.listPage(pa);
		
	}

	
	//상품 성별/ 계절 검색
	@Override
	public List<PerfumeDTO> cate(PerfumeDTO perfume, Paging pa) {		
		return mapper.cate(perfume.getC_gender(), perfume.getC_season(), pa.getRowStart(), pa.getRowEnd());
	}

	
	//상품 키워드 검색
	@Override
	public List<PerfumeDTO> keyword(PerfumeDTO perfume, Paging pa) {
		return mapper.keyword(perfume.getKeyword(), perfume.getChoose(), pa.getRowStart(), pa.getRowEnd());
	}

	//성별/ 계절 검색한 수
	@Override
	public int cateCount(PerfumeDTO perfume) {
		return mapper.cateCount(perfume.getC_gender(), perfume.getC_season());
}

	//키워드 검색 한 수
	@Override
	public int keyCount(PerfumeDTO perfume) {
		return mapper.keyCount(perfume.getKeyword(), perfume.getChoose());
	}

	//브랜드
	@Override
	public BrandDTO brand(String d_number) {
		return mapper.brandSearch(d_number);
	}
	
	//노트
	@Override
	public List<NoteDTO> note(List<String> list) {
		List<NoteDTO> noteList = new ArrayList();
		NoteDTO ndto = new NoteDTO();
		for(int i = 0 ; i < list.size() ; i ++) {
			ndto.setN_number(list.get(i));
			noteList.addAll(mapper.noteInfo(ndto));
		}
		return noteList;
	}

	
	//리뷰 적기
	@Override
	public int reviewInsert(ReviewDTO rdto) {
		return mapper.reviewInsert(rdto);
	}

	
	//리뷰 이미지
	@Override
	public int reviewImg(ReviewDTO rdto) {
		return mapper.reviewImg(rdto);
	}

	
	//리뷰 좋아요 중복체크 입력
	@Override
	public int chInsert(ReviewDTO rdto) {
		return mapper.chInsert(rdto.getP_number(),rdto.getR_number(),rdto.getId());
	}

	//리뷰 좋아요 중복 체크
	@Override
	public int chLike(ReviewDTO rdto) {
		return mapper.chLike(rdto);
	}

	//리뷰 좋아요
	@Override
	public int like(ReviewDTO rdto) {
		return mapper.like(rdto);
	}

	//리뷰 싫어요
	@Override
	public int unLike(ReviewDTO rdto) {
		return mapper.unLike(rdto);
	}

	//향수 좋아요 중복 체크 입력
	@Override
	public int perInsert(ReviewDTO rdto, PerfumeDTO dto) {
		return mapper.perInsert(dto.getP_number(),rdto.getId());
	}
	

	//향수 좋아요 중복체크
	@Override
	public int perLikeCh(ReviewDTO rdto) {
		return mapper.perLikeCh(rdto);
	}

	//향수 좋아요
	@Override
	public int perLike(PerfumeDTO dto) {
		return mapper.perLike(dto);
	}

	//향수 리뷰 중복체크 입력
	@Override
	public int rchInsert(ReviewDTO rdto) {
		return mapper.rchInsert(rdto);
	}

	//향수 리뷰 중복 체크
	@Override
	public int rchLike(ReviewDTO rdto) {
		return mapper.rchLike(rdto);
	}

	//향수 좋아요 랭크
	@Override
	public List<PerfumeDTO> perlikeRank(PerfumeDTO dto) {
		return mapper.perlikeRank(dto);
	}

	
	//향수 리뷰 좋아요 랭크
	@Override
	public List<PerfumeDTO> relikeRank(ReviewDTO rdto) {
		return mapper.relikeRank(rdto);
	}

	//향수 리뷰 싫어요 랭크
	@Override
	public List<PerfumeDTO> reunlikeRank(ReviewDTO rdto) {
		return mapper.reunlikeRank(rdto);
	}

	//리뷰 수
	@Override
	public int reviewCount(ReviewDTO rdto ) {
		return mapper.reviewCount(rdto);
	}

	//디테일 페이지 리뷰
	@Override
	public List<ReviewDTO> getReview (ReviewDTO rdto) {
		return mapper.getReview(rdto);
	}

	//내 리뷰 가져오기
	@Override
	public List<ReviewDTO> getMRveiw(ReviewDTO rdto, Paging pa) {
		return mapper.getMRveiw(rdto.getWriter(), pa.getRowStart(), pa.getRowEnd());
	}

	//내 리뷰갯수
	@Override
	public int getMRveiwC(ReviewDTO rdto) {
		return mapper.getMRveiwC(rdto);
	}

	//모든 리뷰 가져오기 (어드민용)
	@Override
	public List<ReviewDTO> getAReview(Paging pa) {
		return mapper.getAReview(pa);
	}

	//모든 리뷰 갯수(어드민용)
	@Override
	public int getAReviewC(ReviewDTO rdto) {
		return mapper.getAReviewC(rdto);
	}

	//리뷰 수정
	@Override
	public int reviewRe(ReviewDTO rdto) {
		return mapper.reviewRe(rdto);
	}

	//리뷰(어드민)삭제
	@Override
	public int reDel(String st) {
		return mapper.reDel(st);
	}

	//리뷰(개인)삭제
	@Override
	public int reMyDel(ReviewDTO rdto) {
		return mapper.reMyDel(rdto);
	}

	//리뷰 수정하기 위해서 가져오기
	@Override
	public List<ReviewDTO> reviewGet(ReviewDTO rdto) {
		return mapper.reviewGet(rdto);
	}
	
	
	


	
	

}
