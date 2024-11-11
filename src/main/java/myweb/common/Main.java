package myweb.common;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int x = sc.nextInt();
		int[] arr = new int[x];
		double sum = 0;
		double highest = 0;
		
		for(int i = 0; i<x;i++) {
			arr[i]=sc.nextInt();
		}
		
		for(int i = 0; i<x;i++) {
			if(highest<arr[i]) {
				highest=arr[i];
			}
		}
		
		for(int i = 0; i<x;i++) {
			sum += (arr[i]*100)/highest;
		}
		System.out.println(sum/x);
	}
}