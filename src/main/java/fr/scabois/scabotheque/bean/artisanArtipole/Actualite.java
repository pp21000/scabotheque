package fr.scabois.scabotheque.bean.artisanArtipole;

import fr.scabois.scabotheque.bean.HasId;
import fr.scabois.scabotheque.bean.adherent.Adherent;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

@Entity
@Table(name = "aa_actus")
public class Actualite implements HasId {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String titre;
  private String contenu;
  private String type;
  private String sous_type;
  private Integer position;
  @Temporal(javax.persistence.TemporalType.DATE)
  private Date date_ajout;
  @ManyToOne
  @JoinTable(name = "actus_adherents", joinColumns = {
    @JoinColumn(name = "adherent_id")}, inverseJoinColumns = {
    @JoinColumn(name = "actus_id", referencedColumnName = "id")})
  private Adherent adherent;

  public Adherent getAdherent() {
    return this.adherent;
  }

  public void setAdherent(final Adherent adherent) {
    this.adherent = adherent;
  }

  public String getContenu() {
    return this.contenu;
  }

  public void setContenu(final String contenu) {
    this.contenu = contenu;
  }

  public Date getDate_ajout() {
    return this.date_ajout;
  }

  public void setDate_ajout(final Date date_ajout) {
    this.date_ajout = date_ajout;
  }

  @Override
  public Integer getId() {
    return this.id;
  }

  /**
   *
   * @param id
   */
  @Override
  public void setId(final Integer id) {
    this.id = id;
  }

  public Integer getPosition() {
    return this.position;
  }

  public void setPosition(final Integer position) {
    this.position = position;
  }

  public String getSous_type() {
    return this.sous_type;
  }

  public void setSous_type(final String sous_type) {
    this.sous_type = sous_type;
  }

  public String getTitre() {
    return this.titre;
  }

  public void setTitre(final String titre) {
    this.titre = titre;
  }

  public String getType() {
    return this.type;
  }

  public void setType(final String type) {
    this.type = type;
  }
}
