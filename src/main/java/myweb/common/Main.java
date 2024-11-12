package myweb.common;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int x = sc.nextInt();
		
		for(int i=0;i<x;i++) {
			String y = sc.nextLine();
			
			System.out.println(y.charAt(0)+""+y.charAt(y.length()-1));
		}
	}
}