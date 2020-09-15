package java0828;

import java.util.Scanner;

public class Switch01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("1 ~ 100 사이 점수 입력");
		Scanner scan = new Scanner(System.in);
		int score = scan.nextInt();
		switch((int)score/10) {
		 	case 10:
			case 9:
				System.out.println("A");
				break;
			case 8: System.out.println("B");
				break;
			case 7: System.out.println("C");
				break;
			case 6: System.out.println("D");
				break;
			default: System.out.println("F");
		}
	}
}
