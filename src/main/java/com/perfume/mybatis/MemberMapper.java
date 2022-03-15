package com.perfume.mybatis;

import com.perfume.beans.MemberDTO;

public interface MemberMapper {
	
	public int loginCheck (MemberDTO memberDTO);
	
	public int kLoginCheck (MemberDTO memberDTO);
	
	public int register(MemberDTO memberDTO);
	
	public int kakaoRegister(MemberDTO memberDTO);
	
	public int imgUpdate (MemberDTO memberDTO);
	
	public int idCheck(String id);
	
	public MemberDTO userInfo(String id);
	
	public String pwCheck(String id);
	
	public int pwUpdate(MemberDTO memberDTO);
	
	public int tmpDelete(String id);
	
	public int kakaoDelete(MemberDTO memberDTO);

}
