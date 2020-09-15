package java0914;
class MyDate8{   

  private int year;    
  private int month;    
  private int day;

  public MyDate8(){
    this(2006, 1, 1);                   
  }  
  public MyDate8(int new_year){
    this(new_year, 1, 1);                
  }  
  public MyDate8(int new_year, int new_month){
     this(new_year, new_month, 1);    
  }  
public MyDate8(int new_year,int new_month,int new_day){
    year=new_year;
    month=new_month;
    day=new_day;
  }    

  public void print(){
	System.out.println(year+ "/" +month+ "/" +day); 
  }
}

public class ConstructorTest10 {     
  public static void main(String[] args) {
    MyDate8 d=new MyDate8(2007, 7, 19);  
    d.print();
    MyDate8 d2=new MyDate8(2007, 7);     
    d2.print();
    MyDate8 d3=new MyDate8(2007);       
    d3.print();
    MyDate8 d4=new MyDate8();          
    d4.print();
  }
}