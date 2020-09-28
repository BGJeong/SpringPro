package java0922;

import java.util.Scanner;

public class MemberInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc = new Scanner(System.in);
		
		System.out.print("이름을 입력하세요?");
		String name = sc.nextLine();
		System.out.print("나이를 입력하세요?");
		String age = sc.nextLine();
		System.out.print("EMail주소를 입력하세요?");
		String email = sc.nextLine();
		System.out.print("전화번호를 입력하세요?");
		String tel = sc.nextLine();
		System.out.print("주소를 입력하세요?");
		String address = sc.nextLine();
		
		int num = Integer.parseInt(age);
		
		if(num >= 20) {
			System.out.println("회원인증 성공");
			System.out.println("이름:" + name);
			System.out.println("나이:" + age);
			System.out.println("EMail:" + email);
			System.out.println("전화번호:" + tel);
			System.out.println("주소:" + address);
		}else {
			System.out.println("회원인증 실패");
			System.out.println("성인이 아닙니다.");
		}		
		
	}

}
