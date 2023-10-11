package fr.scabois.scabotheque.services;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.controller.adherent.CriteriaAdherent;
import fr.scabois.scabotheque.enums.ExportFileType;
import fr.scabois.scabotheque.utils.AppProperties;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.util.AreaReference;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFTable;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("exportService")
public class ExportService {

  @Autowired
  private IServiceAdherent service;

  public void exportContactToFile(CriteriaAdherent criteria, HttpServletResponse response) {
    try {

      List<Adherent> listAdh = service.loadAdherents(criteria);

      String fileName = AppProperties.getPropertie("export.path") + "/"
              + AppProperties.getPropertie("export.exportContactFileName") + LocalDate.now().format(DateTimeFormatter.ISO_DATE)
              + ".xlsx";
      System.err.println("debug fileName :" + fileName);

      XSSFWorkbook workBook = openExcelWorkBook(ExportFileType.TYPE_LIST_CONTACT);
      System.err.println("debug Fichier Excel ouvert ");
      XSSFSheet sheet = openSheet(workBook, "ListeContacts");
      System.err.println("debug feuille ouverte ");

      final AtomicInteger cpt = new AtomicInteger(1);
      listAdh.stream().forEach(a -> {
        // recherche des
        System.out.println(a.getLibelle());
        //AdherentContactRole contact = a.getContacts().stream().filter(c -> c.getFonction().getId().equals(1))
        //       .findFirst().orElse(null);
        a.getContacts().stream().forEach(contact -> {
          if ((criteria.isMailingAdministratif() && contact.getIsMailingAdministratif())
                  || (criteria.isMailingCommerce() && contact.getIsMailingCommerce())
                  || (criteria.isMailingCompta() && contact.getIsMailingCompta())
                  || (criteria.isMailingDirigeant() && contact.getIsMailingDirigeant())) {
            int i = 0;
            XSSFRow row = sheet.createRow(cpt.getAndIncrement());
            row.createCell(i++).setCellValue(a.getCodeERP());
            row.createCell(i++).setCellValue(a.getDenomination());
            row.createCell(i++).setCellValue(a.getLibelle());
            row.createCell(i++).setCellValue(a.getPole().getLibelle());
            row.createCell(i++).setCellValue(a.getIsArtipole() ? "OUI" : "NON");
            row.createCell(i++).setCellValue(contact == null ? "" : contact.getCivilite());
            row.createCell(i++).setCellValue(contact == null ? "" : contact.getNom());
            row.createCell(i++).setCellValue(contact == null ? "" : contact.getPrenom());
            row.createCell(i++).setCellValue(contact == null ? "" : contact.getFonction().getLibelle());
            row.createCell(i++).setCellValue(contact == null ? "" : contact.getFixe());
            row.createCell(i++).setCellValue(contact == null ? "" : contact.getMobile());
            row.createCell(i++).setCellValue(contact == null ? "" : contact.getMail());
            row.createCell(i++).setCellValue("");
          }
        });
      });

      System.err.println("debug feuille remplie ...");

      // Mise à jour du tableau
      AreaReference tableArea = workBook.getCreationHelper().createAreaReference(new CellReference("A1"),
              new CellReference("M" + cpt.get()));

      System.err.println("debug Mise à jour de la table");

      XSSFTable table = workBook.getTable("ListeContacts");
      table.setArea(tableArea);

      FileOutputStream fileOut = new FileOutputStream(fileName);
      workBook.write(fileOut);
      fileOut.close();

      downloadFile(fileName, response);

    } catch (Exception ex) {
      System.err.println("Erreur: " + ex.getMessage());
    }
  }

//  public void exportListRetraiteToFile(final HttpServletResponse response) {
//    try {
//      final SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
//      final List<ContactRetraite> listContacts = (List<ContactRetraite>) this.service.loadContactRetraite();
//      final String fileName = AppProperties.getPropertie("export.path") + "/" + AppProperties.getPropertie("export.exportContactRetraiteFileName") + LocalDate.now().format(DateTimeFormatter.ISO_DATE) + ".xlsx";
//      final XSSFWorkbook workBook = this.openExcelWorkBook(ExportFileType.TYPE_LIST_CONTACT_RETRAITE);
//      final XSSFSheet sheet = this.openSheet(workBook, "ListeContacts");
//      final AtomicInteger cpt = new AtomicInteger(1);
////      final XSSFSheet xssfSheet;
//      final AtomicInteger atomicInteger;
//      final XSSFRow row2;
//      final XSSFRow row;
//      final int n;
//      final XSSFRow xssfRow;
//      final int n2;
//      final XSSFRow xssfRow2;
//      final int n3;
//      final XSSFRow xssfRow3;
//      final int n4;
//      final XSSFRow xssfRow4;
//      final int n5;
//      final XSSFRow xssfRow5;
//      final int n6;
//      final XSSFRow xssfRow6;
//      final int n7;
//      final XSSFRow xssfRow7;
//      final int n8;
//      final XSSFRow xssfRow8;
//      final int n9;
//      final XSSFRow xssfRow9;
//      final int n10;
//      final Object o;
//      final int n11;
////      final int i;
//
//      listContacts.stream().forEach(a -> {
//        int i = 0;
//        XSSFSheet xssfSheet;
//
//        row = (row2 = xssfSheet.createRow(atomicInteger.getAndIncrement()));
//        i++;
//        row2.createCell(n).setCellValue(a.getCivilite());
//        i++;
//        xssfRow.createCell(n2).setCellValue(a.getNom());
//        i++;
//        xssfRow2.createCell(n3).setCellValue(a.getPrenom());
//        i++;
//        xssfRow3.createCell(n4).setCellValue(a.getAdresse());
//        i++;
//        xssfRow4.createCell(n5).setCellValue(a.getAdresseComplement());
//        i++;
//        xssfRow5.createCell(n6).setCellValue((a.getCommune() == null) ? "" : a.getCommune().getCodePostal());
//        i++;
//        xssfRow6.createCell(n7).setCellValue((a.getCommune() == null) ? "" : a.getCommune().getLibelle());
//        i++;
//        xssfRow7.createCell(n8).setCellValue(a.getFixe());
//        i++;
//        xssfRow8.createCell(n9).setCellValue(a.getMobile());
//        i++;
//        xssfRow9.createCell(n10).setCellValue(a.getMail());
//        i++;
//        ((XSSFRow) o).createCell(n11).setCellValue("");
//        return;
//      });
//      final String cellFinal = "K";
//      final AreaReference tableArea = workBook.getCreationHelper().createAreaReference(new CellReference("A1"), new CellReference(cellFinal + cpt.get()));
//      final XSSFTable table = workBook.getTable("ListeContacts");
//      table.setArea(tableArea);
//      final FileOutputStream fileOut = new FileOutputStream(fileName);
//      workBook.write((OutputStream) fileOut);
//      fileOut.close();
//      this.downloadFile(fileName, response);
//    } catch (Exception ex) {
//      System.err.println("Erreur: " + ex.getMessage());
//    }
//  }
//  public void exportListClubFemmeToFile(final HttpServletResponse response) {
//    try {
//      final SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
//      final List<ContactClubFemme> listContacts = (List<ContactClubFemme>) this.service.loadContactsClubFemme();
//      final String fileName = AppProperties.getPropertie("export.path") + "/" + AppProperties.getPropertie("export.exportContactClubFemmeFileName") + LocalDate.now().format(DateTimeFormatter.ISO_DATE) + ".xlsx";
//      final XSSFWorkbook workBook = this.openExcelWorkBook(ExportFileType.TYPE_LIST_CONTACT_CLUB_FEMME);
//      final XSSFSheet sheet = this.openSheet(workBook, "ListeContacts");
//      final AtomicInteger cpt = new AtomicInteger(1);
//      int i;
//      final XSSFSheet xssfSheet;
//      final AtomicInteger atomicInteger;
//      final XSSFRow row2;
//      final XSSFRow row;
//      final int n;
//      final XSSFRow xssfRow;
//      final int n2;
//      final XSSFRow xssfRow2;
//      final int n3;
//      final XSSFRow xssfRow3;
//      final int n4;
//      final XSSFRow xssfRow4;
//      final int n5;
//      final XSSFRow xssfRow5;
//      final int n6;
//      final XSSFRow xssfRow6;
//      final int n7;
//      final XSSFRow xssfRow7;
//      final int n8;
//      final XSSFRow xssfRow8;
//      final int n9;
//      final XSSFRow xssfRow9;
//      final int n10;
//      final Object o;
//      final int n11;
//      listContacts.stream().forEach(a -> {
//        i = 0;
//        row = (row2 = xssfSheet.createRow(atomicInteger.getAndIncrement()));
//        i++;
//        row2.createCell(n).setCellValue(a.getCivilite());
//        i++;
//        xssfRow.createCell(n2).setCellValue(a.getNom());
//        i++;
//        xssfRow2.createCell(n3).setCellValue(a.getPrenom());
//        i++;
//        xssfRow3.createCell(n4).setCellValue(a.getAdresse());
//        i++;
//        xssfRow4.createCell(n5).setCellValue(a.getAdresseComplement());
//        i++;
//        xssfRow5.createCell(n6).setCellValue((a.getCommune() == null) ? "" : a.getCommune().getCodePostal());
//        i++;
//        xssfRow6.createCell(n7).setCellValue((a.getCommune() == null) ? "" : a.getCommune().getLibelle());
//        i++;
//        xssfRow7.createCell(n8).setCellValue(a.getFixe());
//        i++;
//        xssfRow8.createCell(n9).setCellValue(a.getMobile());
//        i++;
//        xssfRow9.createCell(n10).setCellValue(a.getMail());
//        i++;
//        ((XSSFRow) o).createCell(n11).setCellValue("");
//        return;
//      });
//      final String cellFinal = "K";
//      final AreaReference tableArea = workBook.getCreationHelper().createAreaReference(new CellReference("A1"), new CellReference(cellFinal + cpt.get()));
//      final XSSFTable table = workBook.getTable("ListeContacts");
//      table.setArea(tableArea);
//      final FileOutputStream fileOut = new FileOutputStream(fileName);
//      workBook.write((OutputStream) fileOut);
//      fileOut.close();
//      this.downloadFile(fileName, response);
//    } catch (Exception ex) {
//      System.err.println("Erreur: " + ex.getMessage());
//    }
//  }
  public void exportListToFile(CriteriaAdherent criteria, HttpServletResponse response) {
    try {

//	    AppProperties.getPropertie("export.template.excel");
      SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
//            DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.SHORT,DateFormat.SHORT);
      List<Adherent> listAdh = service.loadAdherents(criteria);

      String fileName = AppProperties.getPropertie("export.path") + "/"
              + AppProperties.getPropertie("export.exportListFileName") + LocalDate.now().format(DateTimeFormatter.ISO_DATE)
              + ".xlsx";

      XSSFWorkbook workBook = openExcelWorkBook(criteria.getExportAll() ? ExportFileType.TYPE_LIST_ADHERENT_INTERNE : ExportFileType.TYPE_LIST_ADHERENT);
      XSSFSheet sheet = openSheet(workBook, "ListeAdherents");

      final AtomicInteger cpt = new AtomicInteger(1);
      listAdh.stream().forEach(a -> {
        // recherche des
//		System.out.println(a.getLibelle());
        AdherentContactRole contact = a.getContacts().stream().filter(c -> c.getFonction().getId().equals(1))
                .findFirst().orElse(null);
        int i = 0;
        XSSFRow row = sheet.createRow(cpt.getAndIncrement());
        row.createCell(i++).setCellValue(a.getCodeERP());
        row.createCell(i++).setCellValue(contact == null ? "" : contact.getCivilite());
        row.createCell(i++).setCellValue(contact == null ? "" : contact.getNom());
        row.createCell(i++).setCellValue(contact == null ? "" : contact.getPrenom());
        row.createCell(i++).setCellValue(a.getSiret() == null ? a.getSiren() : a.getSiret().isEmpty() ? a.getSiren() : a.getSiret());
        row.createCell(i++).setCellValue(a.getPole().getLibelle());
//		row.createCell(i++).setCellValue(a.getFormeJuridique().getLibelle() + " " + a.getDenomination());
        row.createCell(i++).setCellValue(a.getDenomination());
        if (criteria.getExportAll()) {
          row.createCell(i++).setCellValue(a.getLibelle());
          row.createCell(i++).setCellValue(a.getSecteur().getLibelle());
          row.createCell(i++).setCellValue(a.getTournee().getLibelle());
          row.createCell(i++).setCellValue(a.getDateEntree() == null ? "" : dateFormat.format(a.getDateEntree()));
          row.createCell(i++).setCellValue(a.getDateSortie() == null ? "" : dateFormat.format(a.getDateSortie()));
        }
        row.createCell(i++).setCellValue(a.getAdresse());
        row.createCell(i++).setCellValue(a.getAdresseComplement());
        row.createCell(i++).setCellValue(a.getCommune() == null ? "" : a.getCommune().getCodePostal());
        row.createCell(i++).setCellValue(a.getCommune() == null ? "" : a.getCommune().getLibelle());
        row.createCell(i++).setCellValue(a.getAgence().getLibelle());
        row.createCell(i++).setCellValue(a.getEtat().getLibelle());
        row.createCell(i++).setCellValue(contact == null ? "" : contact.getFixe());
        row.createCell(i++).setCellValue(contact == null ? "" : contact.getMobile());
        row.createCell(i++).setCellValue(contact == null ? "" : contact.getMail());
        row.createCell(i++).setCellValue("");
      });

      // Mise à jour du tableau
      String cellFinal = (criteria.getExportAll() ? "V" : "Q");
      AreaReference tableArea = workBook.getCreationHelper().createAreaReference(new CellReference("A1"),
              new CellReference(cellFinal + cpt.get()));

      XSSFTable table = workBook.getTable("ListeAdherents");
      table.setArea(tableArea);

      FileOutputStream fileOut = new FileOutputStream(fileName);
      workBook.write(fileOut);
      fileOut.close();

      downloadFile(fileName, response);

    } catch (Exception ex) {
      System.err.println("Erreur: " + ex.getMessage());
    }
  }

  public void downloadFile(String fileName, HttpServletResponse response) {

    InputStream in = null;
    try {
      // Chargement et Download du fichier
      File fileToDownload = new File(fileName);
      in = new FileInputStream(fileToDownload);

      // MIME type
      String mimeType = new MimetypesFileTypeMap().getContentType(fileName);
      if (mimeType == null) {
        mimeType = "application/octet-stream";
      }   // Modification de la response
      response.setContentType(mimeType);
      response.setContentLength((int) fileToDownload.length());

      // Force le download
      String headerKey = "Content-Disposition";
      String headerValue = String.format("attachment; filename=\"%s\"", fileToDownload.getName());
      response.setHeader(headerKey, headerValue);
      OutputStream outStream = response.getOutputStream();
      byte[] buffer = new byte[4096];
      int bytesRead = -1;
      while ((bytesRead = in.read(buffer)) != -1) {
        outStream.write(buffer, 0, bytesRead);
      }
      in.close();
      outStream.close();

      // Suppression du fichier sur le disque
//            fileToDownload.delete();
    } catch (FileNotFoundException ex) {
      Logger.getLogger(ExportService.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IOException ex) {
      Logger.getLogger(ExportService.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
      try {
        in.close();
      } catch (IOException ex) {
        Logger.getLogger(ExportService.class.getName()).log(Level.SEVERE, null, ex);
      }
    }

  }

  private XSSFWorkbook openExcelWorkBook(ExportFileType type) {

    String pathFile = "";

    try {
      switch (type) {
        case TYPE_LIST_ADHERENT:
          pathFile = AppProperties.getPropertie("export.template.excel");
          break;
        case TYPE_LIST_ADHERENT_INTERNE:
          pathFile = AppProperties.getPropertie("export.template.excel.interne");
          break;
        case TYPE_LIST_CONTACT:
          pathFile = AppProperties.getPropertie("export.template.excel.contact");
          break;
      }

      return new XSSFWorkbook(pathFile);

    } catch (IOException e) {
      // Le fichier n'exist pas
      Logger.getLogger(ExportService.class.getName()).log(Level.SEVERE, "Le fichier n'existe pas : ", e);
      return new XSSFWorkbook();
    }
  }

//    private XSSFSheet openSheet(XSSFWorkbook workBook) {
  private XSSFSheet openSheet(XSSFWorkbook workBook, String sheetName) {

    // essaye d'ouvrir la feuille de calcul duclasseur Excel
    XSSFSheet sheet = workBook.getSheet(sheetName);

    // si pas d feuille -> création.
    if (sheet == null) {
      sheet = workBook.createSheet("Adherents");
      int cpt = 0;
      XSSFRow rowhead = sheet.createRow((short) 0);
      rowhead.createCell(cpt++).setCellValue("Code");
      rowhead.createCell(cpt++).setCellValue("Nom");
      rowhead.createCell(cpt++).setCellValue("Prenom");
      rowhead.createCell(cpt++).setCellValue("SIREN");
      rowhead.createCell(cpt++).setCellValue("Pole");
      rowhead.createCell(cpt++).setCellValue("Adherent");
      rowhead.createCell(cpt++).setCellValue("Adresse");
      rowhead.createCell(cpt++).setCellValue("Complement d'adresse");
      rowhead.createCell(cpt++).setCellValue("Code Postal");
      rowhead.createCell(cpt++).setCellValue("Ville");
      rowhead.createCell(cpt++).setCellValue("Agence");
      rowhead.createCell(cpt++).setCellValue("Actif");
      rowhead.createCell(cpt++).setCellValue("Telephone");
      rowhead.createCell(cpt++).setCellValue("Messagerie");
      rowhead.createCell(cpt++).setCellValue("Commentaire");

      AreaReference tableArea = workBook.getCreationHelper().createAreaReference(new CellReference("A1"),
              new CellReference("N3"));

      XSSFTable table = sheet.createTable(tableArea);
      table.setDisplayName("ListeAdherents");
      table.setName("ListeAdherents");
      table.setStyleName("TableStyleMedium16");
    }

    return sheet;
  }
}
