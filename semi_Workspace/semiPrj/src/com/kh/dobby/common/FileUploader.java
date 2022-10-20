package com.kh.dobby.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.Part;

public class FileUploader {
	
	public static AttachmentVo uploadFile(Part f , String rootPath) throws IOException {
		
		// 0. 준비
		String originName = f.getSubmittedFileName();
		String ext = originName.substring(originName.lastIndexOf("."), originName.length());
		String changeName = System.currentTimeMillis() + "_" + (Math.random()*99999 + 1) + ext;
		
		// 1. 파일 객체 준비 (경로+파일명)
		String filePath = "upload/img";
		String path = rootPath + filePath +"/";
		File target = new File(path + changeName);
		
		// 2. 데이터 넣기 (클라파일 -> 자바 -> 타겟파일)
		
//				 InputStream fis = f.getInputStream();
//				 FileOutputStream fos = new FileOutputStream(target);
		
		BufferedInputStream bis = new BufferedInputStream(f.getInputStream());
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(target));
		
		byte[] buf = new byte[1024];
		 
		int size = 0;
		while( (size = bis.read(buf)) != -1) {
			bos.write(buf , 0 , size );
		}
		
		bos.flush();
		bis.close();
		bos.close();
		
		AttachmentVo vo = new AttachmentVo();
		vo.setChangeName(changeName);
		vo.setOriginName(originName);
		vo.setFilePath(filePath);
		
		return vo;
		
	}//method

}//class
