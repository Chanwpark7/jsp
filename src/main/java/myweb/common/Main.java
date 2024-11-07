package myweb.common;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int x = sc.nextInt();
		int max = 0;
		int count = 0;
		
		for(int i = 0; i<x;i++) {
			count++;
			int y = sc.nextInt();
			if(y>max) {
				max = y;
			}
		}
		System.out.println(max+"\n"+count);
	}
}