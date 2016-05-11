package com.stk.service.test.impl;

import org.springframework.stereotype.Service;

import com.stk.domain.system.User;
import com.stk.service.test.TestService;

@Service("testService")
public class TestServiceImpl implements TestService {

	@Override
	public User findUserById(Integer id) {
		User user = new User();
		user.setId(id);
		user.setName("rose");
		user.setPassword("123");
		return user;
	}

}
