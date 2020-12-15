package cdc.go.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubles.mvcboard.article.service.ArticleService;
import com.doubles.mvcboard.commons.paging.PageMaker;
import com.doubles.mvcboard.commons.paging.SearchCriteria;

import cdc.go.service.CovidService;

@Controller
public class CovidController {
	private static final Logger logger = LoggerFactory.getLogger(CovidController.class);

	@Inject
	private ArticleService articleService;
	private CovidService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, Model model) throws Exception {
		logger.info("show main...");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(articleService.countSearchedArticles(searchCriteria));

		model.addAttribute("articles", articleService.listSearch(searchCriteria));
		model.addAttribute("pageMaker", pageMaker);

		return "index";
	}
	
	@RequestMapping(value = "/index/Today", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		logger.info("show main...");
		model.addAttribute("Korealist", service.listAll());

	}

}
