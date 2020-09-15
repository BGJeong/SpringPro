package java0828;

import java.util.ArrayList;
import java.util.List;

public class If02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ArrayList<String> list = new ArrayList<String>();
		
		for(int i = 0; i<6; i++) {
			int a = (int)(Math.random() * 45)+1;
			list.add(Integer.toString(a));
		}
	
		for(int i =0; i<list.size(); i++ ) {
			System.out.println(list.get(i));
		}
		
//		난수발생 공식
//		난수 = (정수화)(Math.random() * (상한값 - 하한값 +1)) + 하한값;
//		Random r = new Random();
//		for (int i = 0; i < 10; i++) {
//			System.out.println((int)(Math.random() * 6)+1);
//		}

//		Math class 사용
//		System.out.println((Math.random()*10));

//		Random class 사용
//		Random r = new Random();
//		for(int i = 1; i <=6; i++) {
//			System.out.println(r.nextInt(45)+1);
//		}

	}

}
