package com.perfume.controller;


import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.perfume.beans.FileInfo;
import com.perfume.beans.MemberDTO;
import com.perfume.service.MemberService;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Log4j
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService service; 
	
	@Autowired
	private FileInfo fileinfo;
		
	//로그인 후 메인페이지
	@RequestMapping("main")
	public String main() {
		return "member/main";
	}
	//등록 페이지
	@RequestMapping("register")
	public String register() {
		
		
		return "member/register";
	}
	//회원가입 페이지
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@RequestMapping("registerPro")
	public String registerPro(MemberDTO dto, MultipartFile file, Model model, HttpServletRequest req) throws ParseException {
		//date타입 형변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dto.setBirthday(sdf.parse(dto.getBirthday2())); //Date타입을 String타입으로 형변환
		model.addAttribute("result", service.memberRegister(dto));
		if(file != null) {//사진 이름을 id로 바꿈
			if(fileinfo.fileTypeCheck(file, "image")){
				String orgName = file.getOriginalFilename(); 
				String ext = orgName.substring(orgName.lastIndexOf(".")); 
				String fileName = dto.getId()+ext;  
				String path = req.getSession().getServletContext().getRealPath("/resources/images/img"); 
				File f = new File(path+"//"+fileName);
				try {
					file.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				} 
				
				dto.setImg(fileName);
				service.memberImgUpdate(dto);
			}
		model.addAttribute("id",dto.getId());
		}
		return "member/registerPro";
	}
	//등록페이지에서 id 중복여부 확인, @responseBody 사용해서 페이지 이동 없이 값 처리
	@RequestMapping("idCheck")
	public @ResponseBody int idCheck(String id) {
		return service.memberIdCheck(id);
	}
	//일반, 카카오 통합 로그인 페이지
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	//로그인 프로 페이지
	@RequestMapping("loginPro")
	public String loginPro(MemberDTO dto, HttpSession session) {
		if(service.memberLoginCheck(dto) == 1) {
			session.setAttribute("id", dto.getId());
		}
		return "member/loginPro";
	}
	//카카오 로그인기능 1, 사이트에서 카카오 로그인을 한 적이 없는 경우 인증 토큰을 받아 로그인 처리	
	@RequestMapping("kakaoCheck")
	public @ResponseBody int check(@RequestBody MemberDTO dto, HttpSession session) {
		
		int result = 0;
		
		if(service.memberIdCheck(dto.getId()) == 1) {
			result = 1;
		} else {
			result = service.memberKakaoRegister(dto); //로그인 후 회원가입 처리
		}
		
		session.setAttribute("kid", dto.getId()); //아이디는 카카오의 인증토큰으로 지정
		return result;
	}
	//카카오 로그인 기능 2, 카카오 로그인을 하면 회원가입 처리 과정 중 토큰을 K_Token으로 부여함
	@RequestMapping("tokenCheck")
	public @ResponseBody String tokenCheck(@RequestBody MemberDTO dto, HttpSession session) {
		
		session.setAttribute("token", dto.getApi_token());
		if(dto != null) {
			dto.setApi_token("K_Token");
			log.warn(dto.getApi_token());
		}
		return dto.getApi_token();
	}
	//로그아웃 페이지
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/logout";
	}
	//카카오 로그아웃 기능. 메인페이지에서 기능함
	@RequestMapping("kLogout")
	public @ResponseBody String kLogout(HttpSession session) {
		session.invalidate();
		return "member/login";
	}
	//회원정보 확인. 세션에 따라 회원의 개인정보를 불러옴
	@RequestMapping("userInfo")
	public String userInfo(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		String kid = (String)session.getAttribute("kid");
			if(id != null) {
				model.addAttribute("MemberDTO", service.memberUserInfo(id));
			} else if(kid != null) {
				model.addAttribute("MemberDTO", service.memberUserInfo(kid));
			}
		return "member/userInfo";
	}
	//회원사진 업데이트 페이지.	
	@RequestMapping("imgUpdate")
	public String imgUpdate() {
		return "member/imgUpdate";
	}
	//회원가입과 동일하게 사진이름을 변경하고 새로운 파일을 저장.	
	@RequestMapping("imgUpdatePro")
	public String imgUpdatePro(MemberDTO dto, MultipartFile file, Model model, HttpServletRequest req) {
		if(file != null) {
			if(fileinfo.fileTypeCheck(file, "image")){
				String orgName = file.getOriginalFilename(); 
				String ext = orgName.substring(orgName.lastIndexOf(".")); 
				String fileName = dto.getId()+ext;  
				String path = req.getSession().getServletContext().getRealPath("/resources/images/img"); 
				File f = new File(path+"//"+fileName);
				try {
					file.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				} 
				dto.setImg(fileName);
				service.memberImgUpdate(dto);
			}
		}
		return "member/imgUpdatePro";
	}
	
	//비밀번호 변경체크 
	@RequestMapping("pwCheck")
    public String pwCheck() {
        return"member/pwCheck";
    }
	
	//자바스크립트 기능을 사용해 페이지 이동 없이 비밀번호 변경
	@RequestMapping("pwCheckPro")
	public @ResponseBody int pwCheckPro(MemberDTO dto, String pw2) {
		int result = 0;
		String dbpw = service.memberPwCheck(dto.getId());
			if(dto.getPw().equals(dbpw)) {
				dto.setPw(pw2);
				result = service.memberPwUpdate(dto);
			}
		return result;
	}
	
	//삭제 페이지
	@RequestMapping("delete")
	public String delete() {
		return "member/delete";	
	}
	//삭제 처리 페이지
	@RequestMapping("deletePro")
	public String deletePro(MemberDTO dto, Model model, HttpSession session) {
		int result = service.memberLoginCheck(dto);
			if(result == 1) {
				result = service.memberTmpDelete(dto.getId());
				session.invalidate();
			}
		model.addAttribute("result", result);
		return "member/deletePro";
	}
	
	//카카오 회원탈퇴 기능, 탈퇴시 처리페이지 이동 없이 로그인 페이지로 돌아감
	@RequestMapping("kakaoDeletePro")
	public @ResponseBody int kakaoDeletePro(@RequestBody MemberDTO dto, HttpSession session) {
		int result = 0;
		int check = service.memberKLoginCheck(dto);
			if(check == 1) {
				result = service.memberKakaoDelete(dto);
				session.invalidate();
			}
		return result;
	}
	
	
}
