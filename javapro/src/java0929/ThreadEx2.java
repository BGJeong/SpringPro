package java0929;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ThreadEx2 implements Runnable {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		while (true) {
			try {
				Date d = new Date();
				System.out.println(sd.format(d));
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadEx2 tx = new ThreadEx2();
		Thread t = new Thread(tx);
		t.start();
	}

}
