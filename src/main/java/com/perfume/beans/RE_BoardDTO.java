package com.perfume.beans;

import lombok.Data;

@Data
public class RE_BoardDTO {
	private int boardnum; // (게시판종류 qna = 1 , 추천 = 2) 
	private int bno; // (해당게시물 번호)
	private int number; //   (댓글번호)
	private String writer; //  (작성자)
	private String content; // varchar2(100)   (내용)
}
