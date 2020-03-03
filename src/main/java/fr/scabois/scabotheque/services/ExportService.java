package fr.scabois.scabotheque.services;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidOperationException;
import org.apache.poi.ss.util.AreaReference;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFTable;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fr.scabois.scabotheque.bean.adherent.Adherent;
import fr.scabois.scabotheque.bean.adherent.AdherentContactRole;
import fr.scabois.scabotheque.controller.adherent.CriteriaAdherent;
import fr.scabois.scabotheque.utils.AppProperties;

@Service("exportService")
public class ExportService {

    @Autowired
    private IServiceAdherent service;

    public void downloadFile(CriteriaAdherent criteria, HttpServletResponse response) {
	try {

//	    AppProperties.getPropertie("export.template.excel");

	    List<Adherent> listAdh = service.LoadAdherents(criteria);

	    String fileName = AppProperties.getPropertie("export.path") + "/"
		    + AppProperties.getPropertie("export.fileName") + LocalDate.now().format(DateTimeFormatter.ISO_DATE)
		    + ".xlsx";

	    XSSFWorkbook workBook = openExcelWorkBook(criteria.getExportAll());
	    XSSFSheet sheet = openSheet(workBook, listAdh.size());

	    final AtomicInteger cpt = new AtomicInteger(1);
	    listAdh.stream().forEach(a -> {
		// recherche des
//		System.out.println(a.getLibelle());
		AdherentContactRole contact = a.getContacts().stream().filter(c -> c.getFonction().getId().equals(1))
			.findFirst().orElse(null);
		int i = 0;
		XSSFRow row = sheet.createRow(cpt.getAndIncrement());
		row.createCell(i++).setCellValue(a.getCodeERP());
		row.createCell(i++).setCellValue(contact == null ? "" : contact.getNom());
		row.createCell(i++).setCellValue(contact == null ? "" : contact.getPrenom());
		row.createCell(i++).setCellValue(a.getSiren());
		row.createCell(i++).setCellValue(a.getPole().getLibelle());
//		row.createCell(i++).setCellValue(a.getFormeJuridique().getLibelle() + " " + a.getDenomination());
		row.createCell(i++).setCellValue(a.getDenomination());
		if (criteria.getExportAll()) {
		    row.createCell(i++).setCellValue(a.getSecteur().getLibelle());
		}
		row.createCell(i++).setCellValue(a.getAdresse());
		row.createCell(i++).setCellValue(a.getAdresseComplement());
		row.createCell(i++).setCellValue(a.getCommune() == null ? "" : a.getCommune().getCodePostal());
		row.createCell(i++).setCellValue(a.getCommune() == null ? "" : a.getCommune().getLibelle());
		row.createCell(i++).setCellValue(a.getAgence().getLibelle());
		row.createCell(i++).setCellValue(a.getEtat().getLibelle());
		row.createCell(i++).setCellValue(contact == null ? "" : contact.getFixe());
		row.createCell(i++).setCellValue(contact == null ? "" : contact.getMail());
		row.createCell(i++).setCellValue("");
	    });

	    // Mise à jour du tableau
	    AreaReference tableArea = workBook.getCreationHelper().createAreaReference(new CellReference("A1"),
		    new CellReference("O" + cpt.get()));

	    XSSFTable table = workBook.getTable("ListeAdherents");
	    table.setArea(tableArea);

	    FileOutputStream fileOut = new FileOutputStream(fileName);
	    workBook.write(fileOut);
	    fileOut.close();

	    // Chargement et Download du fichier
	    File fileToDownload = new File(fileName);
	    InputStream in = new FileInputStream(fileToDownload);

	    // MIME type
	    String mimeType = new MimetypesFileTypeMap().getContentType(fileName);

	    if (mimeType == null) {
		mimeType = "application/octet-stream";
	    }

	    // Modification de la response
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
	    fileToDownload.delete();

	} catch (Exception ex) {
	    System.err.println("Erreur: " + ex.getMessage());
	}
    }

    private XSSFWorkbook openExcelWorkBook(boolean exportAll) {

	// test ouverture fichier template.
	XSSFWorkbook workBook;
	try {
	    if (exportAll) {
		workBook = new XSSFWorkbook(AppProperties.getPropertie("export.template.excel.interne"));
	    } else {
		workBook = new XSSFWorkbook(AppProperties.getPropertie("export.template.excel"));
	    }

	} catch (InvalidOperationException | IOException i) {
	    // Le fichier n'exist pas
	    workBook = new XSSFWorkbook();
	}

	return workBook;
    }

//    private XSSFSheet openSheet(XSSFWorkbook workBook) {
    private XSSFSheet openSheet(XSSFWorkbook workBook, int size) {

	// essaye d'ouvrir la feuille de calcul duclasseur Excel
	XSSFSheet sheet = workBook.getSheet("Adherents");

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
