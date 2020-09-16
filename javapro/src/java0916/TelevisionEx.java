package java0916;

class Television{
	static String company = "Samsung";
	static String model = "LCD";
	static String info;
	
	static {
		info = company + "-" + model;
	}
}

public class TelevisionEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(Television.info);
	}

}
