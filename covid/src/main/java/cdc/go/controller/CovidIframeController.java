package cdc.go.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/iframe")
public class CovidIframeController {
	
	private static final Logger logger = LoggerFactory.getLogger(CovidController.class);
	
	@RequestMapping(value="/homepage", method=RequestMethod.GET)
	public void iframe() throws Exception{
		logger.info("show iframe...");
	}
}
