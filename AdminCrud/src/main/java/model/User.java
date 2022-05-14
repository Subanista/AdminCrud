package model;

public class User {

	protected int userid;
    protected String fname;
    protected String lname;
    protected String email;
    protected String country;

    public User() {}

    public User(String fname, String lname, String email, String country) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.country = country;
	}


	public User(int userid, String fname, String lname, String email, String country) {
		super();
		this.userid = userid;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.country = country;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	
	
}
	
	
	
	
	

