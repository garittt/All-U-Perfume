package com.perfume.service;

import com.perfume.mybatis.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.perfume.beans.MemberDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_=@Autowired)  
	private MemberMapper mapper;
	
	@Override
	public int memberLoginCheck(MemberDTO memberDTO) {
		return mapper.loginCheck(memberDTO);
	}

	@Override
	public int memberRegister(MemberDTO memberDTO) {
		return mapper.register(memberDTO);
	}

	@Override
	public int memberKakaoRegister(MemberDTO memberDTO) {

		return mapper.kakaoRegister(memberDTO);
	}
	
	@Override
	public int memberImgUpdate(MemberDTO memberDTO) {
		return mapper.imgUpdate(memberDTO);
	}

	@Override
	public int memberIdCheck(String id) {
		return mapper.idCheck(id);
	}

	@Override
	public MemberDTO memberUserInfo(String id) {
		return mapper.userInfo(id);
	}

	@Override
	public String memberPwCheck(String id) {
		return mapper.pwCheck(id);
	}

	@Override
	public int memberPwUpdate(MemberDTO memberDTO) {
		return mapper.pwUpdate(memberDTO);
	}

	@Override
	public int memberTmpDelete(String id) {
		return mapper.tmpDelete(id);
	}

	@Override
	public int memberKakaoDelete(MemberDTO memberDTO) {
		return mapper.kakaoDelete(memberDTO);
	}

	@Override
	public int memberKLoginCheck(MemberDTO memberDTO) {
		return mapper.kLoginCheck(memberDTO);
	}

	

}
