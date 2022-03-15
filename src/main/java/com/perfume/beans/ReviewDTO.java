package com.perfume.beans;

import java.util.Date;
import lombok.Data;

@Data
public class ReviewDTO {

	
	private int p_number;
	private int r_number;
	private String writer;
	private String like_re;
	private String unlike_re;
	private int like_re_heart;
	private int unlike_re_heart;
	private String filename;
	private Date reg_date;
	private String id; 
	private String f_name;
	
	
}
