package java0827;

import java.util.Scanner;

public class oper03 {
	public static void main(String[] args) {
		int[] num = new int[3];
		System.out.println("정수 3개 입력");
		Scanner scan = new Scanner(System.in);
		
		for(int b = 0; b<num.length; b++) {
			num[b] = scan.nextInt();
			System.out.println(num[b]);
		}
	}
}
