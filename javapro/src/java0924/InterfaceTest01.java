package java0924;

interface IHello2{
  void sayHello(String name);
}
class Hello2 implements IHello2{    
  public void sayHello(String name){
//	void sayHello(String name){
      System.out.println(name+"씨 안녕하세요!");
   }
}
class InterfaceTest01{
  public static void main(String[] args) {
    Hello2 obj= new Hello2();
    obj.sayHello(args[0]);
	obj.sayHello(args[1]);
  }   
}                
