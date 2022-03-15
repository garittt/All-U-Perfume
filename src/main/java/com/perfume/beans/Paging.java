package com.perfume.beans;

public class Paging {
	
	private int repage; 
	private int page; //현재 페이지
	private int perPageNum; //페이지당 게시물 
	private int rowStart; // rownum 시작 번호
	private int rowEnd; //rownum 끝 번호
	
	//현재 페이지 = 1 / 페이지당 = 10
	public Paging() {
		this.repage = 1;
		this.page = 1;
		this.perPageNum = 10;
		
	}
	
	public int getRepage() {
		return repage;
	}
	
	public void setRepage(int repage) {
		if (repage <= 0) {
			this.repage=1;
			return;
		}
		this.repage = repage;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page=1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page-1)*perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum)+1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum -1;
		return rowEnd;
	}
	
	public void setRowEnd(int rowEnd) {
		this.rowEnd += rowEnd;
	}
	
	@Override
	public String toString() {
		
		return "Paging [page=" + page + ",perPageNum="+ perPageNum + ", rowStart=" + rowStart + ",rowEnd="+rowEnd+"]";
	}

}
