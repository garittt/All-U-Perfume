package com.perfume.beans;

import lombok.Data;

@Data
public class AbsSurveyDTO {
	private String gender; //성별값, 0,1,2
	private String survey; // 추상적 설문에 사용되는 설문내용
	private String season; //계절값 1,2,3,4
	private String third; //설문 파라미터 값, 실질적인 분류를 정함
	private String fourth; //설문 파라미터 값2, third의 자식 분류
	private String fifth; //설문 파라미터 값3, 검색 결과를 매칭하는 파라미터
	private String note; //third~fifth 테이블의 노트 값
	
}

/*사용테이블:
 * abs_first 성별값, 각 값당 한글 내용
 * abs_second 계절값, 각 값당 한글 내용
 * abs_third 설문 파라미터값, 설문 내용1, 설문내용에 해당되는 노트 값
 * abs_fourth 설문 파라미터값2, 설문 내용2, 설문내용에 해당되는 노트 값, 이전 설문과 대응되는 파라미터 값
 * abs_fifth 설문 파라미터값3, 설문내용 3, 검색되는 노트 값, 이전 설문과 대응되는 파라미터 값
 *
 *
 */