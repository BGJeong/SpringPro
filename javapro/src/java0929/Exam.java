package java0929;

import java.util.ArrayList;
import java.util.Collections;

public class Exam {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<Integer> arr = new ArrayList<Integer>();
		for(int i = 0; arr.size() < 6; i++) {
			int a = (int)(Math.random()*45+1);
			if(!arr.contains(a)) {
				arr.add(a);	
			}
			Collections.sort(arr);
		}
		for(int i : arr) System.out.println(i);
	}

}
