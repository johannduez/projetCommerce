package list;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.Article;
import repo.ArticleRepository;

/**
 * Application Lifecycle Listener implementation class ListArticles
 *
 */
@WebListener
public class ListArticles implements ServletContextListener {

	/**
	 * Default constructor.
	 */
	public ListArticles() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent arg0) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("./applicationContext.xml");
		ArticleRepository artRepository = ctx.getBean(ArticleRepository.class);

		
//		Article art1=new Article("Smartphone Apple iPhone 13", "Ecran OLED Super Retina XDR de 15,5 cm M�moire de stockage : 512 Go", 799, "/resources/img/tel1.png", "T�l�phone");
//		artRepository.save(art1);
//		Article art2=new Article("Smartphone XIAOMI", "XIAOMI PACK REDMINOTE 10 128GO GRIS 5G + BRACELET CONNECT� MI SMART BAND 5", 219, "/resources/img/xiaomi.jpg", "T�l�phone");
//		artRepository.save(art2);
//		Article art3=new Article("Smartphone SAMSUNG GALAXY S22", "OS Android 12 - 256Go de ROM, 12Go de RAM", 499, "/resources/img/tel2.jpg", "T�l�phone");
//		artRepository.save(art3);
//		Article art4=new Article("Smartphone OPPO RENO", "OS Android 11 - 128Go de ROM, 8Go de RAM", 219, "/resources/img/tel3.jpg", "T�l�phone");
//		artRepository.save(art4);
//		
//		
//		Article art5=new Article("PC portable LENOVO IDEAPAD 3", "Processeur Intel Core� i5-1135G7 (4 coeurs, 2,4 GHz / Turbo Boost jusqu'� 4,2 GHz)", 499, "/resources/img/ordi1.webp", "Ordinateur");
//		artRepository.save(art5);
//		Article art6=new Article("PC portable DELL INSPIRON", "Processeur Intel Core� i7-1255U (10 coeurs, 1,7 GHz / Turbo Boost jusqu'� 4,7 GHz)", 959, "/resources/img/ordi2.png", "Ordinateur");
//		artRepository.save(art6);
//		Article art7=new Article("PC portable MSI MODERN", " Processeur Intel Core� i7-1195G7 (4 coeurs, 2.9 GHz / Turbo Boost jusqu'� 5 GHz)", 879, "/resources/img/ordi3.png", "Ordinateur");
//		artRepository.save(art7);
//		Article art8=new Article("PC portable LENOVO IDEAPAD 5", "Proceseur AMD Ryzen� 9 5900HX (8 coeurs, 3,3 GHz Turbo Boost)", 959, "/resources/img/ordi4.webp", "Ordinateur");
//		artRepository.save(art8);
//		
//		Article art9=new Article("Lave-linge hublot SAMSUNG", "Capacit� 9kg (tambour 61 L) - Classe �nerg�tique A", 499, "/resources/img/electro1.jpg", "Electrom�nager");
//		artRepository.save(art9);
//		Article art10=new Article("Lave-linge s�chant WHIRLPOOL", "Capacit� de lavage 9kg / s�chage 7kg - Classe �nerg�tique E", 579, "/resources/img/electro2.jpg", "Electrom�nager");
//		artRepository.save(art10);
//		Article art11=new Article("Lave-vaisselle THOMSON", "Largeur 60 cm (14 couverts) - 47dB (classe sonore C)", 399, "/resources/img/electro3.png", "Electrom�nager");
//		artRepository.save(art11);
//		Article art12=new Article("Lave-vaisselle THOMSON ENCASTRABLE", "Encastrable - Largeur 60 cm (14 couverts) - 44dB", 399, "/resources/img/electro4.jpg", "Electrom�nager");
//		artRepository.save(art12);
		
		List<Article> articles = artRepository.findAll();
		arg0.getServletContext().setAttribute("articles", articles);

		List<Article> ordinateur = artRepository.findByCategorie("Ordinateur");
		List<Article> telephone = artRepository.findByCategorie("T�l�phone");

		List<Article> electromenager = artRepository.findByCategorie("Electrom�nager");
		arg0.getServletContext().setAttribute("ordinateur", ordinateur);
		arg0.getServletContext().setAttribute("telephone", telephone);
		arg0.getServletContext().setAttribute("electromenager", electromenager);

		ctx.close();
	}

}
