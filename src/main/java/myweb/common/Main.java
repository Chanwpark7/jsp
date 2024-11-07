package myweb.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class Main {
	public static void main(String[] args) {
		
		BufferedReader br = new BufferedReader(
				new InputStreamReader(
				System.in));
		BufferedWriter bw = new BufferedWriter(
				new OutputStreamWriter(
				System.out));
		
		int res = 0;
		
		String[] arr = new String[2];

		try {
			String x = br.readLine();
			int a = Integer.parseInt(x);

			for(int i = 0; i<a;i++) {
				String y = br.readLine();
				arr = y.split(" ");
				res = Integer.parseInt(arr[0])+Integer.parseInt(arr[1]);
				
				String s = String.valueOf(res);
				bw.write(s+"\n");
			}
			bw.flush();
			bw.close();
		} catch (Exception e) {
			e.getMessage();
		}
	}
}