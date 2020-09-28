package java0923;

class CellPhone{
	String model;
	String color;
	
	void powerOn() {
		System.out.println("Power On");
	}
	void powerOff() {
		System.out.println("Power Off");
	}
	void bell() {
		System.out.println("Ring the bell");
	}
	void sendVoice(String msg) {
		System.out.println("me : " +msg);
	}
	void receiveVoice(String msg) {
		System.out.println("you : " + msg);
	}
	void hangUp() {
		System.out.println("Off");
	}
}

class DmbCellPhone extends CellPhone{
	int channel;
	
	DmbCellPhone(String model, String color, int channel){
		this.model = model;
		this.color = color;
		this.channel = channel;
	}
	
	void turnOnDmb() {
		System.out.println("채널 "+channel +"번 DMB 방송 수신");
	}
	void changeChannel(int channel) {
		this.channel = channel;
		System.out.println("채널을" + channel+"번으로 바꿉니다.");
	}
	void turnOffDmb() {
		System.out.println("수신 종료");
	}
}

public class DmbCellPhoneEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DmbCellPhone dmbCellPhone = new DmbCellPhone("자바", "검정", 10);
		System.out.println("모델 : "+dmbCellPhone.model);
		System.out.println("색상 : "+dmbCellPhone.color);
		
		System.out.println("채널 : "+dmbCellPhone.channel);
		dmbCellPhone.powerOn();
		dmbCellPhone.bell();
		dmbCellPhone.sendVoice("여보세요");
		dmbCellPhone.receiveVoice("헤엘로");
		dmbCellPhone.sendVoice("ㅎㅇ");
		dmbCellPhone.hangUp();
		
		dmbCellPhone.turnOnDmb();
		dmbCellPhone.changeChannel(12);
		dmbCellPhone.turnOffDmb();
	}

}
