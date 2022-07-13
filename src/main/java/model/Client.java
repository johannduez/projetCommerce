package model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Client {
	@Id
	@NotNull(message= "Id ne peut pas etre vide")
	private Integer id;
	@Length(min=3, message="Il faut au moins 3 caractères")
	private String password;
	@NotEmpty(message= "Nom ne peut pas etre vide")
	private String nom;
	@NotEmpty(message= "Prenom ne peut pas etre vide")
	private String prenom;
	@NotEmpty(message= "Adresse ne peut pas etre vide")
	private String adresse;
	@OneToMany(mappedBy = "client")
	private Collection<Commande> commandes = new ArrayList<Commande>();
	@Version
	private int version;

	public Client(Integer id, String password, String nom, String prenom, String adresse) {
		super();
		this.id = id;
		this.password = password;
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		this.version = 0;
	}

	public Client() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public Collection<Commande> getCommandes() {
		return commandes;
	}

	public void setCommandes(Collection<Commande> commandes) {
		this.commandes = commandes;
	}

	@Override
	public String toString() {
		return "Client [id=" + id + ", password=" + password + ", nom=" + nom + ", prenom=" + prenom + ", complement="
				+ adresse + "]";
	}

}
