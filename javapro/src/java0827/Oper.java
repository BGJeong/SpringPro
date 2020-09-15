package java0827;

import java.util.Scanner;

public class Oper {

	public static void main(String[] args) {
		int n1, n2, n3, max, min;
		System.out.println("정수 3개를 입력하세요");
		Scanner scan = new Scanner(System.in);

		n1 = scan.nextInt();
		n2 = scan.nextInt();
		n3 = scan.nextInt();
		
		max = (n1 > n2 && n1 > n3) ? n1 : (n2 > n1 && n2 > n3) ? n2 : n3;
		min = (n1 < n2 && n1 < n3) ? n1 : (n2 < n3 && n2 < n1) ? n2 : n3;
		if (max == min) {
			System.out.println("최대값과 최소값이 같습니다.");
		} else {
			System.out.println("최대값은 " + max +", 최소값은" + min + "입니다.");
		}
	}
}