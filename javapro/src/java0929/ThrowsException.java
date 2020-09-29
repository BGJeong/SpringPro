package java0929;

public class ThrowsException {

	// 나눗셈을 구하는 메소드
	public void occurException() {
		try {
			int result = 3 / 0;
			System.out.println(result);
		} catch (Exception e) {
			System.out.println("0으로 못나눔");
		}
	}

	public static void main(String[] args) {
		// 객체를 생성
		ThrowsException te = new ThrowsException();

		// 메소드 호출

		te.occurException();
	}
}
