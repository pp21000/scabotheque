package fr.scabois.scabotheque.bean.security;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

    private boolean enabled;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String password;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<UserRole> roles = new ArrayList<>();

    private String username;

    public boolean getEnabled() {
	return enabled;
    }

    public int getId() {
	return id;
    }

    public String getPassword() {
	return password;
    }

    public List<UserRole> getRoles() {
	return roles;
    }

    public String getUsername() {
	return username;
    }

    public void setEnabled(boolean enabled) {
	this.enabled = enabled;
    }

    public void setId(int id) {
	this.id = id;
    }

    public void setPassword(String password) {
	this.password = password;
    }

    public void setRoles(List<UserRole> roles) {
	this.roles.clear();
	this.roles = roles;
    }

    public void setUsername(String username) {
	this.username = username;
    }

}
