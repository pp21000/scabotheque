package fr.scabois.scabotheque.enums;

public enum RoleEnum {
  ROLE_ADMIN("Administration logiciel"),
  ROLE_ACTIVITE("Activité Pôle"), ROLE_ACTIVITE_EDIT("Activité Pôle modification"),
  ROLE_CLUB_FEMMES("Contact club des femmes"), ROLE_CLUB_FEMMES_EDIT("Contact club des femmes modification"),
  ROLE_RETRAITE("Contact retraité"), ROLE_RETRAITE_EDIT("Contact retraité modification"),
  ROLE_ADHERENT_EDIT("Adhérent modification"),
  ROLE_CRM("Relation client"), ROLE_CRM_EDIT("Relation client modification"),
  ROLE_ADMIN_FINANCE("Administration Financière"), ROLE_ADMIN_FINANCE_EDIT("Administration Financière modification"),
  ROLE_CAPITAL_SOCIAL("Capitale Social"), ROLE_CAPITAL_SOCIAL_EDIT("Capitale Social modification"),
  ROLE_ARTIPOLE("Artipôle"), ROLE_ARTIPOLE_EDIT("Artipôle modification"),
  ROLE_EXPLOITATION("Exploitation"), ROLE_EXPLOITATION_EDIT("Exploitation modification"),
  ROLE_INFORMATIQUE("Informatique"), ROLE_INFORMATIQUE_EDIT("Informatique modification"),
  ROLE_DIRECTION("Direction générale"),
  ROLE_EXPORT("Export liste"), ROLE_MAILING("Mailing"), ROLE_EXPORT_INTERNE("Export liste interne"),
  ROLE_EXPORT_WURTH("Export liste BERNER & WURTH");

  public final String libelle;

  private RoleEnum(String libelle) {
    this.libelle = libelle;
  }
}
