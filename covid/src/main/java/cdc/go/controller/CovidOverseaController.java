package cdc.go.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cdc.go.domain.WorldSearch;
import cdc.go.service.CovidService;

@Controller
@RequestMapping("/Oversea")
public class CovidOverseaController {
	private static final Logger logger = LoggerFactory.getLogger(CovidOverseaController.class);
	
	@Inject
	private CovidService service;
	
	@RequestMapping(value="/World", method=RequestMethod.GET)
	public void listWorld(@ModelAttribute("WS") WorldSearch WS, Model model) throws Exception{ //모델어트리뷰트 추가
		logger.info("show World list...");
		model.addAttribute("listWorld", service.listWorld()); //추가
		model.addAttribute("listAllWorld", service.listAllWorld(WS)); //인자 추가
	}
	
}
