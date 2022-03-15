package com.perfume.beans;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data // lombok 라이브러리 사용, 생성자/set/get/toString 자동생성
public class BoardDTO {
	private int boardnum; // 게시판 종류 공지사항 = 3
	private int b_number; // 게시물 번호
	private String writer;
	private String auth; // 회원 등급
	private String password;
	private String subject;
	private String content;
	private String filename;
	private String answer;
	private Date reg_date; // 작성일 timestamp-sql전용, Date 다 가능
	private int readcount;
	private int b_like; // 좋아요 수
	private int report;

	
	private int re_boardnum; // 게시판 종류 공지사항 = 3
	private int re_bnumber; // 게시물 번호
	private int re_rnumber; //댓글 
	private String re_writer;
	private String re_auth; // 회원 등급
	private String re_password;
	private String re_subject;
	private String re_content;
	private String re_filename;
	private Date re_reg_date; // 작성일 timestamp-sql전용, Date 다 가능
	private int re_readcount;
	private int re_b_like; // 좋아요 수
	private int re_report;
	
}
