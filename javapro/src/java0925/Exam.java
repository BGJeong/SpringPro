package java0925;

import java.util.*;

class TreeSetLotto {
	public void TreeSetLotto2() {
		Set<Integer> set = new TreeSet<Integer>();
		while(set.size() < 6){
			int num = (int) (Math.random() * 45 + 1);
			set.add(num);
		}
		System.out.println(set);
	}
}

class HashSetLotto {
	public void HashSetLotto2() {
		Set<Integer> set = new HashSet<Integer>();
		while (set.size() < 6) {
			int num = (int) (Math.random() * 45 + 1);
			set.add(num);
		}
		ArrayList<Integer> li = new ArrayList<Integer>(set);
		Collections.sort(li);
		System.out.println(li);
	}
}

public class Exam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			TreeSetLotto tsl = new TreeSetLotto();
			tsl.TreeSetLotto2();
			HashSetLotto hsl = new HashSetLotto();
			hsl.HashSetLotto2();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
