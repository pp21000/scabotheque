package fr.scabois.scabotheque.controller.security;

import java.util.List;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EditUtilisateur {

  private boolean enabled;
  private int id;
  private String newPassword;
  @NotEmpty(message = "{modification.notempty}")
  private String password;

  @NotEmpty(message = "{modification.notempty}")
  private String username;

  private List<EditUtilisateurRole> userRoles;

  public boolean getEnabled() {
    return enabled;
  }

  public int getId() {
    return id;
  }

  public String getNewPassword() {
    return newPassword;
  }

  public String getPassword() {
    return password;
  }

  public String getUsername() {
    return username;
  }

  public List<EditUtilisateurRole> getUserRoles() {
    return userRoles;
  }

  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }

  public void setId(int id) {
    this.id = id;
  }

  public void setNewPassword(String newPassword) {
    this.newPassword = newPassword.isEmpty() ? "" : new BCryptPasswordEncoder(10).encode(newPassword);
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public void setUserRoles(List<EditUtilisateurRole> userRoles) {
    this.userRoles = userRoles;
  }

}
