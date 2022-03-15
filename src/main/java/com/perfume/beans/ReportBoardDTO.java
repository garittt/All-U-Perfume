package com.perfume.beans;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReportBoardDTO {
	private int boardnum; //게시판 분류값 0:값 없음, 1:q/a 2:향수 추천 게시판, 3:공지사항
	private int b_number; //게시판 글 번호, 시퀀스로 들어감
	private String writer; //id와 대응될 작성자 값
	private int report; //신고 여부를 확인하는 값, 동시에 횟수 기록
	private String subject; //제목
	private String content; //내용
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date reg_date; //신고된 글의 작성 일자
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date reportdate; //신고날짜
}
