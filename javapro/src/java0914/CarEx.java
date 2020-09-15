package java0914;

class Car{
	String company = "현대";
	String model = "그랜져";
	String color = "검정";
	int maxSpeed = 350;
	int speed;
	
	public Car() {
		System.out.println("생성자");
	}
}

public class CarEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Car car = new Car();
		car.speed = 30;
		System.out.println(car.company);
		System.out.println(car.model);
		System.out.println(car.color);
		System.out.println(car.maxSpeed);
		System.out.println(car.speed);
	}

}
