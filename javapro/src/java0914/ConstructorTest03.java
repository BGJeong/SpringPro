package java0914;

class MyDate3{   
  private int year;    
  private int month;    
  private int day;
  public MyDate3(){ // 기본 생성자 
    year=2016;
    month=4;
    day=1;
  }  
  public void print(){
	System.out.println(year+ "/" +month+ "/" +day); 
  }
}// MyDate end

public class ConstructorTest03 {     
  public static void main(String[] args) {
    MyDate d=new MyDate();
    d.print(); 
  }
}               