package Ex;

import java.util.ArrayList;

public class ExClassBbs {
	
	public void Ex() {
		ExClass ex = new ExClass();
		ArrayList<ExClass> al = new ArrayList<ExClass>();
		ex.setName("bg");
		ex.setAge(29);
		ex.setAddr("인천");
		ex.setPasswd("dddd");
		al.add(ex);
	}
	
}
