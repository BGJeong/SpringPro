package java0914;
class MyDate5{   
  private int year;    
  private int month;    
  private int day;

  public MyDate5(){
  }
  public MyDate5(int new_year, int new_month, int new_day){
    year=new_year;
    month=new_month;
    day=new_day;
  }  
  public void print(){
    System.out.println(year+ "/" +month+ "/" +day); 
  }
}
public class ConstructorTest05 {     
  public static void main(String[] args) {
    MyDate5 d=new MyDate5();  
    d.print();

    MyDate5 d2=new MyDate5(2017, 7, 19);
    d2.print();
  }
}      