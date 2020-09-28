package java0923;

class People{
	public String name;
	public String ssn;
	
	public People(String name, String ssn) {
		this.name = name;
		this.ssn = ssn;
	}
}
class Student extends People{
	public int studentNo;
	public Student(String name, String ssn, int studentNo) {
		super(name, ssn);
		this.studentNo = studentNo;
	}
}

public class StudentEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Student student = new Student("홍길동", "123456-1234567", 1);
		System.out.println("name : " + student.name);
		System.out.println("ssn : " + student.ssn);
		System.out.println("student number : "+student.studentNo);
	}

}
