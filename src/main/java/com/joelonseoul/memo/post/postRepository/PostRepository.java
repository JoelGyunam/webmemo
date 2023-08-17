package com.joelonseoul.memo.post.postRepository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.joelonseoul.memo.post.domain.Post;

@Repository
public interface PostRepository {

	public int insertPost(
			@Param("userId") int userId
			,@Param("title") String title
			,@Param("content") String content
			,@Param("imagePath") String imagePath
			);
	
	public List<Post> selectPostList(@Param("userId") int userId);
	
	public Post selectPost(@Param("id")int id);
	
	public int updatePost(
			@Param("id") int id
			,@Param("subject") String subject
			,@Param("content") String Content
			);
	
	public int deletePost(@Param("id") int id);
}
