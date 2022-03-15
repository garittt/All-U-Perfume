package com.perfume.beans;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileInfo {
	
	public boolean fileTypeCheck(MultipartFile file , String type) {
		boolean result = false;
		String fileType = file.getContentType().split("/")[0];
		if(fileType.equals(type)) {
			result=true;
		}
		return result;
	}
}
