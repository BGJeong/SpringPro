package java0915;
class Calculator2{
	//메소드 오버로딩
	double areaRectangle(double width) {
		return width * width;
	}
	double areaRectangle(double width, double height) {
		return width * height;
	}
}
public class CalculatorEx2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calculator2 cal = new Calculator2();
		double result1 = cal.areaRectangle(10);
		double result2 = cal.areaRectangle(10, 20);
		System.out.println(result1 + " " + result2);
		
		
		
	}

}
