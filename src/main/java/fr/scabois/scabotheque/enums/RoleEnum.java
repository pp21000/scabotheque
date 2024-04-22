package fr.scabois.scabotheque.enums;

public enum RoleEnum {
    ROLE_ADMIN("Administration logiciel"),
    ROLE_ACTIVITE("Activité Pôle"), ROLE_ACTIVITE_EDIT("Modification Activité Pôle"),
    ROLE_CLUB_FEMMES("Contact club des femmes"), ROLE_CLUB_FEMMES_EDIT("Modification contact club des femmes"),
    ROLE_RETRAITE("Contact retraité"), ROLE_RETRAITE_EDIT("Modification contact retraité"),
    ROLE_ADHERENT_EDIT("Modification adhérent"),
    ROLE_CRM("Relation client"), ROLE_CRM_EDIT("Modification relation client"),
    ROLE_ADMIN_FINANCE("Administration Financière"), ROLE_ADMIN_FINANCE_EDIT("Modification administration Financière"),
    ROLE_CAPITAL_SOCIAL("Capitale Social"), ROLE_CAPITAL_SOCIAL_EDIT("Modification capitale Social"),
    ROLE_ARTIPOLE("Artipôle"), ROLE_ARTIPOLE_EDIT("Modification artipôle"),
    ROLE_EXPLOITATION("Exploitation"), ROLE_EXPLOITATION_EDIT("Modification exploitation"),
    ROLE_INFORMATIQUE("Informatique"), ROLE_INFORMATIQUE_EDIT("Modification informatique"),
    ROLE_DIRECTION("Direction générale"),
    ROLE_MAILING("Mailing"),
    ROLE_EXPORT("Export liste"), ROLE_EXPORT_INTERNE("Export liste interne"),
    ROLE_EXPORT_WURTH("Export liste BERNER & WURTH");

    public final String libelle;

    private RoleEnum(String libelle) {
        this.libelle = libelle;
    }
}
