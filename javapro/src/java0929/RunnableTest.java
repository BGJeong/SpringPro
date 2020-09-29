package java0929;

public class RunnableTest implements Runnable {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 1; i <= 20; i++) {
			System.out.println("number = " + i);
		}
	}

	public static void main(String[] args) {
		// 객체 생성
		RunnableTest tt = new RunnableTest();
		// Thread 클래스 객체 생성
		Thread t = new Thread(tt);
		// Thread를 시작시킴
		t.start();
		System.out.println("--------> main thread end");
	}
}
