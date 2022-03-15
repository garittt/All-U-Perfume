package com.perfume.beans;

import java.util.Date;

import lombok.Data;

@Data
public class InquiryDTO {
	
	private int num ;
	private String subject ;
	private String id ;
	private String read_yn ;
	private String ms_content ;
	private Date creat_date;
	private String answer ;
	

}
