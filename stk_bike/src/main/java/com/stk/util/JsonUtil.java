package com.stk.util;

import java.util.ArrayList;
import java.util.List;

public class JsonUtil {
	
	public static String str2json(String s){
		
		return s;
	}

	public static void main(String[] args) {
		/*String[] name = {};
		name[0] = "1";
		name[1] = "2";
		System.out.println(name.toString());*/
		
		List<List<String>> ls = new ArrayList<List<String>>();
		List<String> ls1 = new ArrayList<String>();
		ls1.add("name");
		ls1.add("1");
		ls.add(ls1);
		List<String> ls2 = new ArrayList<String>();
		ls2.add("name2");
		ls2.add("2");
		ls.add(ls2);
		
		System.out.println(ls.toString());

	}

}
