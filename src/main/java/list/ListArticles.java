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

		
//		Article art1=new Article("Smartphone Apple iPhone 13", "Ecran OLED Super Retina XDR de 15,5 cm Mémoire de stockage : 512 Go", 799, "resources/img/tel1.webp", "Téléphone");
//		artRepository.save(art1);
		
		List<Article> articles = artRepository.findAll();
		arg0.getServletContext().setAttribute("articles", articles);

		List<Article> ordinateur = artRepository.findByCategorie("Ordinateur");
		List<Article> telephone = artRepository.findByCategorie("Téléphone");
		System.out.println(telephone);
		List<Article> electromenager = artRepository.findByCategorie("Electroménager ");
		arg0.getServletContext().setAttribute("ordinateur", ordinateur);
		arg0.getServletContext().setAttribute("telephone", telephone);
		arg0.getServletContext().setAttribute("electromenager", electromenager);

		ctx.close();
	}

}
