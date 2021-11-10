package fr.scabois.scabotheque.bean.adherent;

import fr.scabois.scabotheque.bean.HasId;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "adherent_informatique")
public class AdherentInformatique implements HasId {

    @Column(name = "adherent_id")
    private int adherentId;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "login_DFIWEB")
    private String loginDFIWEB;
    @Column(name = "login_EOLAS")
    private String loginEOLAS;
    @Column(name = "login_orcab_electro")
    private String loginOrcabElectro;

    public int getAdherentId() {
        return adherentId;
    }

    public void setAdherentId(int adherentId) {
        this.adherentId = adherentId;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginDFIWEB() {
        return loginDFIWEB;
    }

    public void setLoginDFIWEB(String loginDFIWEB) {
        this.loginDFIWEB = loginDFIWEB;
    }

    public String getLoginEOLAS() {
        return loginEOLAS;
    }

    public void setLoginEOLAS(String loginEOLAS) {
        this.loginEOLAS = loginEOLAS;
    }

    public String getLoginOrcabElectro() {
        return loginOrcabElectro;
    }

    public void setLoginOrcabElectro(String loginOrcabElectro) {
        this.loginOrcabElectro = loginOrcabElectro;
    }

}
