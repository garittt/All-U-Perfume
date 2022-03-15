package com.perfume.service;

import com.perfume.beans.MemberDTO;

public interface MemberService {
	
	public int memberLoginCheck (MemberDTO memberDTO);
	
	public int memberKLoginCheck (MemberDTO memberDTO);
	
	public int memberRegister (MemberDTO memberDTO);
	
	public int memberKakaoRegister(MemberDTO memberDTO);
	
	public int memberImgUpdate (MemberDTO memberDTO);
	
	public int memberIdCheck (String id);
	
	public MemberDTO memberUserInfo (String id);
	
	public String memberPwCheck(String id);
	
	public int memberPwUpdate(MemberDTO memberDTO);
	
	public int memberTmpDelete(String id);
	
	public int memberKakaoDelete(MemberDTO memberDTO);
}
