package java0924;

abstract class Hello{
  public abstract void sayHello(String name);
}
abstract class GoodBye{
  public abstract void sayGoodBye(String name);
}
interface inter{
	void hi(String name); 
}
class SubClass03 implements inter{
//  public void sayHello(String name){
//      System.out.println(name+"씨 안녕하세요!");
//  }
  public void sayGoodBye(String name){
      System.out.println(name+"씨 안녕히 가세요!");
  }

@Override
public void hi(String name) {
	// TODO Auto-generated method stub
	
}
  
}
class AbstractTest03{
   public static void main(String[] args) {
     SubClass03 test= new SubClass03();
//     test.sayHello(args[0]);
     test.sayGoodBye(args[0]);
   }   
}                                                       
