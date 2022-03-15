package com.perfume.beans;

import java.util.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
public class MemberDTO {
	private String id; //아이디
	private String pw; //비밀번호
	private String name; //이름
	private String email; //이메일, example@example.도메인 형태로 저장
	private String phone; //전화번호 - 없이 번호로만 저장
	private Date birthday; //생일 값
	private String birthday2; //생일값을 형변환해서 저장하는데 사용하는 값
	private String gender; //성별
	private Date regdate; //가입 일자, sysdate로 입력됨
	private String auth; //회원 등급
	private String img; //프로필 이미지
	private String api_token; //카카오 로그인과 일반 로그인을 구별하는 값
}
