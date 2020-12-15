package cdc.go.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cdc.go.service.CovidService;

@Controller
@RequestMapping("/Domestic")
public class CovidKoreaController {
	private static final Logger logger = LoggerFactory.getLogger(CovidKoreaController.class);
	
	@Inject
	private CovidService service;
	
	@RequestMapping(value="/Korea", method=RequestMethod.GET)
	public void list( Model model) throws Exception{
		logger.info("show Korea list...");
		model.addAttribute("Korealist", service.listAll());

	}
}
