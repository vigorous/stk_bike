package com.stk.service.test;

import com.stk.domain.system.User;

public interface TestService {
	/**
	 * 根据用户ID查询用户信息
	 * @param id 用户ID
	 * @return
	 */
	public User findUserById(Integer id);
}
