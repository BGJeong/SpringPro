package java0929;

public class ThreadEnd extends Thread {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 1; i <= 20; i++) {
			System.out.println("run number = " + i);
		}
	}

	public static void main(String[] args) {
		ThreadEnd tt = new ThreadEnd();
		// thread를 실행시킴
		tt.start();

		// main()내에서 화면에 101부터 120까지 출력
		for (int i = 101; i <= 120; i++) {
			System.out.println("-------> main number = " + i);
		}
	}

}
