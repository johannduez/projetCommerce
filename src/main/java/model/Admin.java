package model;

public class Admin {

	private int login;
	private String password;
	private int actif;
	
	
	public Admin(int login, String password, int actif) {
		super();
		this.login = login;
		this.password = password;
		this.actif = actif;
	}


	public Admin() {
		super();
	}


	public int getLogin() {
		return login;
	}


	public void setLogin(int login) {
		this.login = login;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public int getActif() {
		return actif;
	}


	public void setActif(int actif) {
		this.actif = actif;
	}


	@Override
	public String toString() {
		return "Admin [login=" + login + ", password=" + password + ", actif=" + actif + "]";
	}
	
	
	
}
