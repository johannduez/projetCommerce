package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/article")
public class ArticleController {
	@RequestMapping("/magasin")
	public String magasin() {
		return "article/magasin";
	}
}
