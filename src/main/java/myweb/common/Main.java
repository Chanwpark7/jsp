package myweb.common;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int max = 0;
		int count = 0;
		
		for(int i = 0; i<9;i++) {
			int y = sc.nextInt();
			if(y>max) {
				max = y;
				count=i;
			}
		}
		System.out.println(max+"\n"+(count+1));
	}
}