package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Version;

@Entity
public class Client {
	@Id
	private int id;
	private String password;
	private String nom;
	private String prenom;
	private String adresse;
	@Version
	private int version;
	public Client(int id, String password, String nom, String prenom, String adresse) {
		super();
		this.id = id;
		this.password = password;
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
	}

	public Client() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	@Override
	public String toString() {
		return "Client [id=" + id + ", password=" + password + ", nom=" + nom + ", prenom=" + prenom + ", complement="
				+ adresse + "]";
	}

}
