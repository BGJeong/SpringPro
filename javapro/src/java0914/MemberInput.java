package java0914;

import java.util.ArrayList;
import java.util.Scanner;

class MemberInfo {
	private String name;
	private int age;
	private String email;
	private String addr;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public void print() {
		for(int i = 0; i < this.name.size(); i++) {
			
		}
		System.out.println(
				"이름은" + this.name + "이고, 나이는 " + this.age + "이고, 메일은 " + this.email + "이며, 주소는 " + this.addr + "입니다");
	}
}

public class MemberInput {

	public static void main(String[] args) {
		MemberInfo member = new MemberInfo();
		// TODO Auto-generated method stub
		for(int i =0; i<3; i++) {
			Scanner scan = new Scanner(System.in);
			System.out.println("이름을 입력하세요");
			String name = scan.nextLine();
			ArrayList<String> listName = new ArrayList<String>();
			listName.add(name);
			if (name.equals("") || name.equals(null)) {
				System.err.println("이름을 공백없이 다시 입력해주세요");
				name = scan.nextLine();
			}
			System.out.println("나이를 입력하세요");
			int age = scan.nextInt();
			ArrayList<Integer> listAge = new ArrayList<Integer>();
			listAge.add(age);
			scan.nextLine();
			System.out.println("e-mail을 입력하세요");
			String email = scan.nextLine();
			ArrayList<String> listEmail = new ArrayList<String>();
			listEmail.add(email);
			if (email.equals("") || email.equals(null)) {
				System.err.println("e-mail을 공백없이 다시 입력해주세요");
				email = scan.nextLine();
			}
			System.out.println("주소를 입력하세요");
			String addr = scan.nextLine();
			ArrayList<String> listAddr = new ArrayList<String>();
			listAddr.add(addr);
			if (addr.equals("") || addr.equals(null)) {
				System.err.println("주소를 공백없이 다시 입력해주세요");
				addr = scan.nextLine();
			}
			
			member.setName(name);
			member.setAge(age);
			member.setEmail(email);
			member.setAddr(addr);
			System.out.println(listName.size());
			i++;
		}
		member.getName();
		
	}

}
