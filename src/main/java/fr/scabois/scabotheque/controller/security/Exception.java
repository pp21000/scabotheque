package fr.scabois.scabotheque.controller.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Exception {

    @RequestMapping(value = { "/accessDenied" }, method = RequestMethod.GET)
    public String accessDenied(final ModelMap pModel, HttpServletRequest request) {

	return "accessDenied";
    }

}