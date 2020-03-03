package fr.scabois.scabotheque.enums;

public enum RoleEnum {
    ROLE_ACTIVITE("Activit� P�le"), ROLE_ACTIVITE_EDIT("Activit� P�le modification"),
    ROLE_ADHERENT_EDIT("Adh�rent modification"),  
    ROLE_ADMIN_FINANCE("Administration Financi�re"), ROLE_ADMIN_FINANCE_EDIT("Administration Financi�re modification"),
    ROLE_ARTIPOLE("Artip�le"), ROLE_ARTIPOLE_EDIT("Artip�le modification"), 
    ROLE_EXPLOITATION("Exploitation"), ROLE_EXPLOITATION_EDIT("Exploitation modification"), 
    ROLE_INFORMATIQUE("Informatique"), ROLE_INFORMATIQUE_EDIT("Informatique modification"),
    ROLE_ADMIN("Administration logiciel"),
    ROLE_EXPORT("Export liste"), ROLE_MAILING("Mailing");

    public final String libelle;

    private RoleEnum(String libelle) {
	this.libelle = libelle;
    }
}
