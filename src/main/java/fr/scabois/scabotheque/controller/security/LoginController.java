package fr.scabois.scabotheque.controller.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@SessionAttributes({ "currentUser", "currentUserId" })
@Controller
public class LoginController {

  private static final Logger log = LogManager.getLogger(LoginController.class);

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String login() {
    return "login";
  }

  @RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
  public String loginError(final ModelMap pModel) {

    log.info("Login attempt failed");
    pModel.addAttribute("msg", "Nom d'utilisateur ou mot de passe incorrect !");
    return "redirect:/login";
  }

  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(final ModelMap pModel, HttpServletRequest request, HttpServletResponse response) {

    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    new SecurityContextLogoutHandler().logout(request, response, auth);
    pModel.addAttribute("msg", "Vous &ecirc;tes d&eacute;connect&eacute; !");

    return "redirect:/login";

  }

}
