package java0915;
class Car2 {
	String model;
	int speed;
	
	Car2(String model){
		this.model = model;
	}
	
	void setSpeed(int speed) {
		this.speed = speed; 
	}
	void run() {
		for(int i = 10; i <= 50; i += 10) {
			setSpeed(i);
			System.out.println(model + "가 달립니다. (시속 :" + speed+"km/h)");
		}
	}
}
public class CarEx2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Car2 myCar = new Car2("포르쉐");
		Car2 yourCar = new Car2("벤츠");
		
		myCar.run();
		yourCar.run();
	}

}
