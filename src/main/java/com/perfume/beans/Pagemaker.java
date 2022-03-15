package com.perfume.beans;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Pagemaker {
	
	private int totalCount; //총 게시물 수
	private int startPage; //보이는 시작 페이지
	private int endPage; // 보이는 끝 페이지
	private boolean prev; //이전
	private boolean next; //다음
	private int displayPageNum = 10; 
	private Paging pa; //페이지정보 객체
	private PerfumeDTO perfume;
	
	public void setPerfume(PerfumeDTO perfume) {
		this.perfume = perfume;
	}
	public PerfumeDTO getperfume(PerfumeDTO perfume) {
		return perfume;
	}
	
	
	public void setPa(Paging pa) {
		this.pa = pa;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
		
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
		
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public Paging getPa() {
		return pa;
	}
	
	private void calcData() {
		
		endPage = (int) (Math.ceil(pa.getPage()/(double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		int temEndPage = (int)(Math.ceil(totalCount/(double)pa.getPerPageNum()));
		
		if(endPage > temEndPage) {
			endPage = temEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * pa.getPerPageNum() >= totalCount ? false : true;
		
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
									.queryParam("page", page)
									.queryParam("perPageNum", pa.getPerPageNum())
									.build();
		return uriComponents.toUriString();
	}
	
	public String makeQuery2(int page, PerfumeDTO perfume) {
		UriComponents uriComponents =
					UriComponentsBuilder.newInstance()
										.queryParam("page", page)
										.queryParam("perPageNum", pa.getPerPageNum())
										.queryParam("gender", perfume.getGender())
										.queryParam("season", perfume.getSeason())
										.queryParam("choose", perfume.getChoose())
										.queryParam("keyword", perfume.getKeyword())
										.build();
		return uriComponents.toUriString();
	}
	
	
}
