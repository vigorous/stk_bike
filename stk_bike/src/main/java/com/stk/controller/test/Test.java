package com.stk.controller.test;

public class Test {
	public static void main(String[] args) {

		int[] arr=new int[]{3,1,7,9,8};
		int [] index=new int[]{1,0,1,1,2,2,1,1,3,4,2};
		String tel="";
		for(int i:index){
			tel+=arr[i];
		}
		System.err.println("电话:"+tel);
	}
}
