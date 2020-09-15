package ex0828;

public class ex1 {
	public static void main(String[] args) {

//		1~76까지의 합
//		int sum = 0;
//		for(int i = 1; i<=76; i++) {
//			sum += i;
//		}
//		System.out.println(sum);

//		구구단 7단을 출력
//		for(int i = 1; i <10; i++) {
//			System.out.println("7 X "+i+" = "+7*i);
//		}

//		1부터 200까지의 정수 중에서 2 또는 3의 배수가 아닌 수의 총합을 구하시오.
//		int sum = 0;
//		for(int i = 1; i <=200; i++) {
//			if(!(i%2 ==0 || i%3==0)) {
//				sum += i;
//			}
//		}
//		System.out.println(sum);

//		구구단
//		for(int i = 2; i<=9; i++) {
//			System.out.println(i+"단");
//			for(int j = 1; j<=9; j++) {
//				System.out.println(i +" X "+j +" = "+i*j);
//			}
//		}

//		3의 배수의 합
//		int sum = 0;
//		for(int i=1; i<=1000; i++) {
//			if(i%3==0) {
//				sum+=i;
//			}
//		}
//		System.out.println(sum);

//		1+(-2)+3+(-4)+5 ...
//		int sum = 0,  i = 1;
//		
//		for(; true; i++) {
//			if(i%2 != 0) {
//				sum += i;
//			}else {
//				sum -= i;
//			}
//			if(sum >=100) {
//				System.out.println(i);
//				break;
//			}
//		}
//		피보나치 수열
//		int pre = 1, now = 1, next = 0;
//		for(int i = 1; i <= 10; i ++) {
//			next = pre + now;
//			pre = now;
//			now = next;
//		}
//		System.out.println(pre);

//		2~100 사이의 소수를 구해보자
//		boolean flag;
//		for(int i = 2; i <= 100; i++) {
//			flag = true;
//			for(int j = 2; j < i; j++ ) {
//				if(i % j == 0) {
//					flag = false;
//					break;
//				}
//				
//			}
//			if(flag == true) {
//				System.out.println(i);
//			}
//		}
//		 int value = 10000;
//		    int count = 0;
//		    for(int i = 1 ; i <= value ; i++){
//		        int temp = i;
//		        while(true){
//		            if(temp%10 == 8){
//		                count++;
//		            }
//		            temp = (int)temp/10;
//		            if(temp == 0){
//		                break;
//		            }
//		        }
//		    }
//		    System.out.println(count);

//		int num = 99;
//		for (int i = 1; i <= num; i++) {
//			String count = String.valueOf(i);
//			System.out.print(count);
//			for (int j = 0; j < count.length(); j++) {
//				char chk = count.charAt(j);
//				if (chk == '3' || chk == '6' || chk == '9') {
//					System.out.print("짝");
//				}
//			}
//			System.out.println();
//		}

//		boolean b1, b2;
//				
//				for(int i=1; i<100; i++) {
//					if (i<10) { 
//						if ((i %3) == 0)
//							System.out.println(i + " 짝");
//					}
//					else {  
//			        	b1 = (i/10) %3 == 0;  
//			        	b2 = (i%10) %3 == 0; 
//			        	if ((i%10) == 0) 
//			        		b2 = false;
//			        	if (b1 && b2)
//			        		System.out.println(i + " 짝짝");
//			        	else if (b1 || b2)
//			        		System.out.println(i + " 짝");
//			        }
//				}
	}
}
