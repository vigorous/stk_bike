package com.stk.entity;

import java.util.UUID;

public class UuidUtil {
	/**
	 * 自动生成不会重复的字符串
	 */
	public static String get32UUID() {
		String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
		return uuid;
	}

	public static void main(String[] args) {
		System.out.println(get32UUID());
	}
}
