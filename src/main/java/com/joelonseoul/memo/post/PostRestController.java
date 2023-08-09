package com.joelonseoul.memo.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.joelonseoul.memo.post.postService.PostService;

@RequestMapping("/post")
@RestController
public class PostRestController {

	@Autowired
	private PostService postService;
	
	@PostMapping("/create")
	public Map<String, String> createMemo(
			@RequestParam("title") String title
			,@RequestParam("content") String content
			,@RequestParam(value = "file", required=false) MultipartFile file 
			,HttpSession session
			){
		int userId = (Integer) session.getAttribute("userId");
		
		int count = postService.addPost(userId, title, content, file);
		Map<String,String> resultMap = new HashMap<>();
		if(count==1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	

}
