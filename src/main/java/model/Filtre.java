package model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class Filtre {

	private Double prixMin;

	private Double prixMax;

	private String nom;
	
	private Integer ordinateur;

	private Integer telephone;
	
	private Integer electromenager;
	public Filtre() {
		super();
		ordinateur=1;
		telephone=1;
		electromenager=1;
	}

	public Integer getTelephone() {
		return telephone;
	}

	public void setTelephone(Integer telephone) {
		this.telephone = telephone;
	}

	public Integer getElectromenager() {
		return electromenager;
	}

	public void setElectromenager(Integer electromenager) {
		this.electromenager = electromenager;
	}

	public Integer getOrdinateur() {
		return ordinateur;
	}

	public void setOrdinateur(Integer ordinateur) {
		this.ordinateur = ordinateur;
	}

	public Double getPrixMin() {
		return prixMin;
	}

	public void setPrixMin(Double prixMin) {
		this.prixMin = prixMin;
	}

	public Double getPrixMax() {
		return prixMax;
	}

	public void setPrixMax(Double prixMax) {
		this.prixMax = prixMax;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	@Override
	public String toString() {
		return "Filtre [prixMin=" + prixMin + ", prixMax=" + prixMax + ", nom=" + nom + ", ordinateur=" + ordinateur
				+ ", telephone=" + telephone + ", electromenager=" + electromenager + "]";
	}

	
}
