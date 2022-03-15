package com.perfume.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.perfume.beans.BrandDTO;
import com.perfume.beans.NoteDTO;
import com.perfume.beans.Paging;
import com.perfume.beans.PerfumeDTO;
import com.perfume.beans.ReviewDTO;

public interface PerfumeMapper {
	
	//향수 상세페이지
	public List<PerfumeDTO> getDetail(PerfumeDTO perfume);  
	
	//게시물 갯수
	public int listCount(); 
	
	//페이징처리 포함한 리스트
	public List<PerfumeDTO> listPage(Paging pa);
	
	//성별, 계절 검색
	public List<PerfumeDTO> cate(@Param("c_gender") String[] gender, @Param("c_season") String[] season, 
			@Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	
	
	//키워드 검색
	public List<PerfumeDTO> keyword(@Param("keyword") String keyword, @Param("choose") String choose, 
			@Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd) ; 
	
	
	 //검색후 게시물 갯수
	public int cateCount(@Param("c_gender") String[] c_gender, @Param("c_season") String[] c_season);
	
	//키워드 검색 후 게시물 갯수
	public int keyCount(@Param("keyword") String keyword, @Param("choose") String choose); 
	
	//브랜드별 검색
	public BrandDTO brandSearch(String d_number);
	
	//노트정보
	public List<NoteDTO> noteInfo(NoteDTO ndto);
	
	
	
	
	
	
	//리뷰입력
	public int reviewInsert(ReviewDTO rdto);
	
	//리뷰입력 중복방지 입력
	public int rchInsert(ReviewDTO rdto);
	
	//리뷰 중복방지 체크
	public int rchLike(ReviewDTO rdto);
	
	//리뷰(페이징으로)가져오기
	public List<ReviewDTO> getPReview(@Param("p_number") String p_number, 
			@Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	
	//리뷰 다 가져오기
	public List<ReviewDTO> getReview(ReviewDTO rdto);
	
	//리뷰 갯수
	public int reviewCount(ReviewDTO rdto);
	
	//이미지 업로드
	public int reviewImg(ReviewDTO rdto);
	
	//리뷰 삭제(어드민)
	public int reDel(String st);
	
	//리뷰삭제(개인)
	public int reMyDel(ReviewDTO rdto);
	
	//내가 쓴 리뷰 가져오기
	public List<ReviewDTO> getMRveiw(@Param("writer") String writer, 
			@Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd);
	
	
	//내가 쓴 리뷰 갯수
	public int getMRveiwC(ReviewDTO rdto);
	
	//모든 리뷰 가져오기 (어드민에서 쓸 것)
	public List<ReviewDTO> getAReview(Paging pa);
	
	//모든 리뷰 갯수 (어드민에서 쓸것)
	public int getAReviewC(ReviewDTO rdto);
	
	//리뷰 수정하기
	public int reviewRe(ReviewDTO rdto);
	
	//리뷰수정하기 위해서 가져오기
	public List<ReviewDTO> reviewGet(ReviewDTO rdto);
	
	
	
	
	
	
	//향수 좋아요 중복방지 입력
	public int perInsert(@Param("p_number") String number, @Param("id") String id);
	
	//향수 좋아요 중복방지 확인 
	public int perLikeCh(ReviewDTO rdto);
	
	//향수 좋아요
	public int perLike(PerfumeDTO dto);
	
	//향수 좋아요 랭킹
	public List<PerfumeDTO> perlikeRank(PerfumeDTO dto);
	
	
	//리뷰 좋아요 싫어요 중복 방지 입력
	public int chInsert(@Param("p_number") int p_number,
			@Param("r_number") int r_number,@Param("id") String id);
	
	//리뷰 좋아요 싫어요 중복 방지 체크
	public int chLike(ReviewDTO rdto);
	
	//리뷰 좋아요
	public int like(ReviewDTO rdto);
	
	//리뷰 싫어요
	public int unLike(ReviewDTO rdto);
	
	//리뷰 좋아요 랭킹
	public List<PerfumeDTO> relikeRank(ReviewDTO rdto);
	
	//리뷰 싫어요 랭킹
	public List<PerfumeDTO> reunlikeRank(ReviewDTO rdto);
	

}
