package java0916;

class Singleton {
	private static Singleton s = new Singleton();

	public static Singleton getInstance() {
		return s;
	}

	public void check() {
		System.out.println("메소드 호출 성공1");
	}

	public void check2() {
		System.out.println("메소드 호출 성공2");
	}

}

public class SingletonEx {

	public static void main(String[] args) {
		Singleton a = Singleton.getInstance();
		Singleton b = Singleton.getInstance();
		System.out.println(a);
		if (a == b) {
			System.out.println("같음");
		}else {
			System.out.println("다름");
		}

		a.check();
		a.check2();
	}
}
