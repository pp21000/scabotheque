package fr.scabois.scabotheque.enums;

public enum RoleEnum {
    ROLE_ACTIVITE("Activité Pôle"), ROLE_ACTIVITE_EDIT("Activité Pôle modification"),
    ROLE_ADHERENT_EDIT("Adhérent modification"),  
    ROLE_ADMIN_FINANCE("Administration Financière"), ROLE_ADMIN_FINANCE_EDIT("Administration Financière modification"),
    ROLE_ARTIPOLE("Artipôle"), ROLE_ARTIPOLE_EDIT("Artipôle modification"), 
    ROLE_EXPLOITATION("Exploitation"), ROLE_EXPLOITATION_EDIT("Exploitation modification"), 
    ROLE_INFORMATIQUE("Informatique"), ROLE_INFORMATIQUE_EDIT("Informatique modification"),
    ROLE_ADMIN("Administration logiciel"),
    ROLE_EXPORT("Export liste"), ROLE_MAILING("Mailing");

    public final String libelle;

    private RoleEnum(String libelle) {
	this.libelle = libelle;
    }
}
