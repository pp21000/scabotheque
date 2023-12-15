package fr.scabois.scabotheque.controller.security;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class CreationUtilisateurForm {

  @NotEmpty
  @NotNull
  private String password;

  @NotEmpty
  @NotNull
  private String userName;

  public String getPassword() {
    return password;
  }

  public String getUserName() {
    return userName;
  }

  public void setPassword(String password) {
    this.password = password.isEmpty() ? "" : new BCryptPasswordEncoder(10).encode(password);
  }

  public void setUserName(final String userName) {
    this.userName = userName;
  }

}
