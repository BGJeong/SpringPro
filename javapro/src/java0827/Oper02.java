package java0827;

import java.util.Scanner;

public class Oper02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int n1, n2, n3, n4, n5, total;
		double avg;
		System.out.println("5과목의 점수를 입력하세요");
		Scanner scan = new Scanner(System.in);
		n1 = scan.nextInt();
		n2 = scan.nextInt();
		n3 = scan.nextInt();
		n4 = scan.nextInt();
		n5 = scan.nextInt();
		total = n1 + n2 + n3 + n4 + n5;
		avg = (double)total / 5;
		System.out.println(avg);
		
		if(n1 >= 40 && n2 >= 40 && n3 >= 40 && n4>= 40 && n5>=40 && avg >= 60) {
			System.out.println("합격");
		}else {
			System.out.println("불합");
		}
	}

}
