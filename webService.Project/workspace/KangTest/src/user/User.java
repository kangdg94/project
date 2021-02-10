package user;

public class User {

	private String userID;
	private String userPassword;
	private String userPasswordCheck;
	private String userName;
	private String userGender;
	private String userEmail;
	private String userEmailHash;
	private Boolean userEmailChecked;
	private Boolean admin;
	
	public String getUserPasswordCheck() {
		return userPasswordCheck;
	}
	public void setUserPasswordCheck(String userPasswordCheck) {
		this.userPasswordCheck = userPasswordCheck;
	}
	public Boolean getAdmin() {
		return admin;
	}
	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public Boolean getUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(Boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public User() {
	}
	
	public User(String userID, String userPassword, String userName, String userGender, String userEmail,
			String userEmailHash, Boolean userEmailChecked, Boolean admin,String userPasswordCheck) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userPasswordCheck = userPasswordCheck;
		this.userName = userName;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
		this.admin = admin;
	}
	
}
