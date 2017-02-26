package org.prototype.domain;

public class MemberVO {

	private int member_no;
	private String nickname;
	private String password;
	private String sex;
	private int age;
	private int mypoint;
	private String email;
	
	public boolean checkEmail(){
		
		if(this.email != null){
			
			return true;
		}
		
		return false;
	}
	
	public boolean checkNickName(){
		
		if(this.email != null){
			
			return true;
		}
		
		return false;
	}
	
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getMypoint() {
		return mypoint;
	}
	public void setMypoint(int mypoint) {
		this.mypoint = mypoint;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [member_no=" + member_no + ", nickname=" + nickname + ", password=" + password + ", sex=" + sex
				+ ", age=" + age + ", mypoint=" + mypoint + ", email=" + email + "]";
	}

	
	
	
	
	
}
