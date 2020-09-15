package java0914;

class FieldInitValue{
	byte byteField;
	short shortField;
	int intField;
	long longField;
	
	boolean booleanField;
	char charField;
	
	float floatField;
	double doubleField;
	
	int[] arrField;
	String strField;
}
public class FieldEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FieldInitValue fiv = new FieldInitValue();
		System.out.println(fiv.byteField);
		System.out.println(fiv.shortField);
		System.out.println(fiv.intField);
		System.out.println(fiv.longField);
		System.out.println(fiv.booleanField);
		System.out.println(fiv.charField);
		System.out.println(fiv.floatField);
		System.out.println(fiv.doubleField);
		System.out.println(fiv.arrField);
		System.out.println(fiv.strField);
		
	}

}
