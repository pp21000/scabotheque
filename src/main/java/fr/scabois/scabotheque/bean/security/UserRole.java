package fr.scabois.scabotheque.bean.security;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import fr.scabois.scabotheque.enums.RoleEnum;

@Entity
@Table(name = "user_roles")
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_role_id")
    private int id;

    @Column(name = "role")
    @Enumerated(EnumType.STRING)
    private RoleEnum role;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    public int getId() {
	return id;
    }

    public RoleEnum getRole() {
	return role;
    }

    public User getUser() {
	return user;
    }

    public void setId(int id) {
	this.id = id;
    }

    public void setRole(RoleEnum role) {
	this.role = role;
    }

    public void setUser(User user) {
	this.user = user;
    }

}
