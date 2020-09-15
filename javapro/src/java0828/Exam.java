package java0828;

import java.util.Scanner;

public class Exam {

	
	static void gugu() {
		for(int i = 2; i<= 9; i++) {
			System.out.print(i+"단 \t\t");
		}
		System.out.println();
		for (int i = 1; i<=9; i++) {
			for(int n = 2; n<= 9; n++) {
				System.out.print(n+" X "+i + " = " + n*i + "\t");
			}
			System.out.println();
		}
	}
	static void fac() {
		System.out.println("정수를 입력하세요");
		Scanner scan = new Scanner(System.in);
		int num = scan.nextInt();
		int fac = 1;
		for (int a = num; a >= 1; a--) {
			fac = fac * a;
		}
		System.out.println(fac);
	}
	
	public static void main(String[] args) {
//		// TODO Auto-generated method stub
	
		gugu();
		fac();
	}
}
