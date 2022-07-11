package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Commande {
	public int id;
	public int idClient;
	public Date date;
	private double prixTotal;
	String infos;
	private List<LigneCommande> lignes = new ArrayList<LigneCommande>();

	public Commande() {
		super();
		long miliseconds = System.currentTimeMillis();
		date = new Date(miliseconds);
	}
	
	public Commande(int idClient, Date date, double prixTotal, String infos) {
		this.idClient = idClient;
		this.date = date;
		this.prixTotal = prixTotal;
		this.infos = infos;
	}

	public void addLigneCommande(int idArticle, int quantite, List<Article> articles) {
		boolean isTrouve = false;
		for (LigneCommande ligne : lignes) {
			if (ligne.getArticle().getId() == idArticle) {
				isTrouve = true;
				ligne.setQuantite(ligne.getQuantite() + quantite);
				ligne.setPrix(ligne.getQuantite() * ligne.getArticle().getTarif());
				this.prixTotal += quantite * ligne.getArticle().getTarif();
				break;
			}
		}
		if (!isTrouve) {
			Article article = null;
			for (Article art : articles) {
				if (art.getId() == idArticle) {
					article = art;
					break;
				}
			}
			if (article != null) {
				lignes.add(new LigneCommande(quantite, quantite * article.getTarif(), article));
				this.prixTotal += quantite * article.getTarif();
			}
		}

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdClient() {
		return idClient;
	}

	public void setIdClient(int idClient) {
		this.idClient = idClient;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public double getPrixTotal() {
		return prixTotal;
	}

	public void setPrixTotal(double prixTotal) {
		this.prixTotal = prixTotal;
	}

	public List<LigneCommande> getLignes() {
		return lignes;
	}

	public void setLignes(List<LigneCommande> lignes) {
		this.lignes = lignes;
	}

	public void add(LigneCommande ligne) {
		this.lignes.add(ligne);
	}

	public String getInfos() {
		return infos;
	}

	public void setInfos(String infos) {
		this.infos = infos;
	}

	@Override
	public String toString() {
		return "Commande [id=" + id + ", idClient=" + idClient + ", date=" + date + ", prixTotal=" + prixTotal
				+ ", lignes=" + lignes + "]";
	}

}
