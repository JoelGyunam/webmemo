package com.joelonseoul.memo.common;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {

	public static final String FILE_UPLOAD_PATH = "C:\\Users\\gynpa\\Documents\\projects\\memo\\upload";
	
	// 파일 저장 -> 경로 return
	public static String saveFile(int userId, MultipartFile file) {
		
		if(file == null) {
			return null;
		}
		
		// 같은 이름의 파일이 구분되어 저장되도록 구성
		// 폴더 생성 후 파일 저장
		// User Id 값을 폴더 이름에 포함
		// 시간정보를 폴더이름에 포함
		// UNIX TIME : 1970년 1월 1일 부터 흐른 시간을 mili second 로 표현한 방식
		// 10_23432343234
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";

		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath);
		if(!directory.mkdir()) {
			return null;
		};
		
		//파일 저장
		try {
			byte[] bytes = file.getBytes();
			String filePath = directoryPath + file.getOriginalFilename();
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
			// 파일 저장 실패
			return null;
		}
		
		//클라이언트에서 접근하는 경로 문자열
		//경로 규칙 : /images/10_23432343234/test.png
		//localhost:8080/images/10_23432343234/test.png
		return "/images" + directoryName + file.getOriginalFilename();
		
	}
	
	public static boolean removeFile(String filePath) { ///images/5_1691578508721/img_placeholder.jpg
		if(filePath == null) {
			return false;
		}
		//  C:\\Users\\gynpa\\Documents\\projects\\memo\\upload/images/5_1691578508721/img_placeholder.jpg
		
		String fullFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		
		Path path = Paths.get(fullFilePath);
		
		//파일 존재 여부
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
		}
		
		Path dirPath = path.getParent();
		if(Files.exists(dirPath)) {
			try {
				Files.delete(dirPath);
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
		}
		
		return true;
	}
}
