package java0826;

public class Second {
	public static void main(String[] args) {
//		int a = 30;
//		double b = 3.14;
//		char c = 'a';
//		String d = "string";
//		// String pool 이 아닌 다른 heap 영역에 객체생성
//		// 때문에 String 비교시에 .equals() 사용.
//		String e = new String("hoho");
//		System.out.println(e);
//		
//		String aa = "aaa";
//		String bb = new String("aaa");
//		if(aa == bb) {
//			System.out.println("일치");
//		}else {
//			System.out.println("불일치");
//		}
//		
//		if(aa.contentEquals(bb)) {
//			System.out.println("일치");
//		}else {
//			System.out.println("불일치");
//		}
		
		//문자열을 정수형으로 전환
//		String a = "100";
//		String[] aa = a.split(",");
//		int b = Integer.parseInt(a);
//		System.out.println(b);
		
		//묵시적(암시적) 형변환
		int a = (int)1.1;
		System.out.println(a);
		
//		for(String x : aa) {
//			System.out.println(x);
//		}
		
//		ArrayList<Integer> arrList = new ArrayList<Integer>();
//		// add() 메소드를 이용한 요소의 저장
//		arrList.add(40);
//		arrList.add(20);
//		arrList.add(30);
//		arrList.add(10);
//		// for 문과 get() 메소드를 이용한 요소의 출력
//		for (int i = 0; i < arrList.size(); i++) {
//		    System.out.print(arrList.get(i) + " ");
//		}
//		// remove() 메소드를 이용한 요소의 제거
//		arrList.remove(1);
//		// Enhanced for 문과 get() 메소드를 이용한 요소의 출력
//		for (int e : arrList) {
//		    System.out.print(e + " ");
//		}
//		// Collections.sort() 메소드를 이용한 요소의 정렬
//		Collections.sort(arrList);
//		// iterator() 메소드와 get() 메소드를 이용한 요소의 출력
//		Iterator<Integer> iter = arrList.iterator();
//		while (iter.hasNext()) {
//		    System.out.print(iter.next() + " ");
//		}
//		// set() 메소드를 이용한 요소의 변경
//		arrList.set(0, 20);
//		for (int e : arrList) {
//		    System.out.print(e + " ");
//		}
//		// size() 메소드를 이용한 요소의 총 개수
//		System.out.println("리스트의 크기 : " + arrList.size());
		
		
		//참조형 변수 : 배열 - 동일한 자료형의 데이터를 저장하는 정적인 자료구조
//		int[] score = {80, 90, 100};
//		for(int e : score) {
//			System.out.println(e);
//		}
		
		//참조형 변수 : 인터페이스(List)
		//1. 순차적인 자료구조
		//2. 여러가지 자료형의 데이터를 저장할 수 있다.
		//3. 동적으로 공간의 크기를 늘릴 수 있다.
	}
}
