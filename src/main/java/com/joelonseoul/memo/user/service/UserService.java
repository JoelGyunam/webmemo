package com.joelonseoul.memo.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelonseoul.memo.common.EncryptUtils;
import com.joelonseoul.memo.user.domain.User;
import com.joelonseoul.memo.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User addUser(
			String loginId
			, String password
			, String name
			, String email
			) {
		
		// 패스워드 암호화
		
		String encryptPassword = EncryptUtils.md5(password);
		

		User user = userRepository.save(User.builder()
				.loginId(loginId)
				.password(encryptPassword)
				.name(name)
				.email(email)
				.build()
				);
		
		return user;
	}
	
	public User getUser(String loginId, String password){
		
		String encryptPassword = EncryptUtils.md5(password);
		
		List<User> userList = userRepository.findByLoginIdAndPassword(loginId, encryptPassword);
		
		//비워진 경우 null 출력
		if(userList.isEmpty()) {
			return null;
		} else {
			return userList.get(0);
		}
	}
	
}
