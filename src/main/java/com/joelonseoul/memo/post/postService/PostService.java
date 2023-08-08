package com.joelonseoul.memo.post.postService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelonseoul.memo.post.domain.Post;
import com.joelonseoul.memo.post.postRepository.PostRepository;

@Service
public class PostService {

	
	@Autowired
	private PostRepository postRepository;
	
	public int addPost(int userID, String title, String content) {
		return postRepository.insertPost(userID, title, content);
	}
	
	public List<Post> getPostList(int userId){
		return postRepository.selectPostList(userId);
	}
	
	public Post getPost(int id) {
		return postRepository.selectPost(id);
	}
}
