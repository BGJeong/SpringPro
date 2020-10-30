package java1012;

public class Ex {
	private int a;
	
	
	public int getA() {
		return a;
	}


	public void setA(int a) {
		this.a = a;
	}


	public static void main(String[] args) {
		A a = new A();
		a.B();
	}
}

class A {
	public void B() {
		Ex ex2 = new Ex();
		ex2.setA(10);
		System.out.println(ex2.getA());
	}
	
	
}
