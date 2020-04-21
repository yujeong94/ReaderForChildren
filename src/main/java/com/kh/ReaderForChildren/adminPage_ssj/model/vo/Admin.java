package com.kh.ReaderForChildren.adminPage_ssj.model.vo;

public class Admin {
	
	   private String userId;
	   private String userPwd;
	   private String userName;
	   private String birth;
	   private String postalCode;
	   private String bAddress;
	   private String lAddress;
	   private String email;
	   private String phone;
	   private String gender;
	   private int donation;
	   private int revenue;
	   private int division;
	   private String status;
	   
	   public Admin() {}

	public Admin(String userId, String userPwd, String userName, String birth, String postalCode, String bAddress,
			String lAddress, String email, String phone, String gender, int donation, int revenue, int division,
			String status) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.postalCode = postalCode;
		this.bAddress = bAddress;
		this.lAddress = lAddress;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.donation = donation;
		this.revenue = revenue;
		this.division = division;
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getbAddress() {
		return bAddress;
	}

	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}

	public String getlAddress() {
		return lAddress;
	}

	public void setlAddress(String lAddress) {
		this.lAddress = lAddress;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getDonation() {
		return donation;
	}

	public void setDonation(int donation) {
		this.donation = donation;
	}

	public int getRevenue() {
		return revenue;
	}

	public void setRevenue(int revenue) {
		this.revenue = revenue;
	}

	public int getDivision() {
		return division;
	}

	public void setDivision(int division) {
		this.division = division;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Admin [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", birth=" + birth
				+ ", postalCode=" + postalCode + ", bAddress=" + bAddress + ", lAddress=" + lAddress + ", email="
				+ email + ", phone=" + phone + ", gender=" + gender + ", donation=" + donation + ", revenue=" + revenue
				+ ", division=" + division + ", status=" + status + "]";
	}
	   
	   
}
