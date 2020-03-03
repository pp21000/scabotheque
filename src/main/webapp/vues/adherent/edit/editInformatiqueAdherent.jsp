<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div  class="editAdherentEntete" >
	<div class="entete">
		<div class="photo">
			<c:choose >
				<c:when test = "${adhToEdit.adherent.photo == ''}"> 
					<img src="<c:url value="/resources/images/noAdh.png" />" />
				</c:when>
				<c:otherwise> 						
					<img src="${adhToEdit.adherent.photo}">
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<span class="scabotheque-h3">${adhToEdit.adherent.denomination}</span>
			<div>
				<span class="adherentLabel"><spring:message code="label.codeAdh"/></span>
				<span class="data" > ${adhToEdit.adherent.code} </span>
			</div>
		</div>
	</div>
</div>  

<form:form class="editAdherent" method="post" modelAttribute="adhToEdit" action="editInformatiqueAdh">
	<form:input type="hidden" path="adherent.id"/>

<!-- Permet de ne pas perdre les données autre que celles modifié -->
	<form:input type="hidden" name="adherent.code" path="adherent.code"/>
	<form:input type="hidden" name="adherent.code" path="adherent.codeERP"/>
	<form:input type="hidden" name="adherent.codeParent" path="adherent.codeERPParent"/>
	<form:input type="hidden" name="adherent.libelle" path="adherent.libelle"/>
	<form:input type="hidden" name="adherent.denomination" path="adherent.denomination"/>
	<form:input type="hidden" name="adherent.adresse" path="adherent.adresse"/>
	<form:input type="hidden" name="adherent.adresseComplement" path="adherent.adresseComplement"/>
	<form:input type="hidden" path="adherent.commune.id"/>
	<form:input type="hidden" path="adherent.pole.id"/>
	<form:input type="hidden" path="adherent.isArtipole"/>
	<form:input type="hidden" path="adherent.isCharteArtipole"/>
	<form:input type="hidden" path="adherent.isFlocageArtipole"/>
	<form:input type="hidden" path="adherent.isWebArtipole"/>
	<form:input type="hidden" path="adherent.isFacebookArtipole"/>
	<form:input type="hidden" path="adherent.agence.id"/>
	<form:input type="hidden" path="adherent.secteur.id"/>
	<form:input type="hidden" path="adherent.tournee.id"/>
	<form:input type="hidden" path="adherent.isOutilDechargement"/>
	<form:input type="hidden" path="adherent.dateEntree"/>
	<form:input type="hidden" path="adherent.role.id"/>
	<form:input type="hidden" path="adherent.formeJuridique.id"/>
	<form:input type="hidden" path="adherent.siren"/>
	<form:input type="hidden" path="adherent.siret"/>
	<form:input type="hidden" path="adherent.ape.id"/>
	<form:input type="hidden" path="adherent.numRepMetier"/>
	<form:input type="hidden" path="adherent.rcsRm"/>
	<form:input type="hidden" path="adherent.rcsCommune.id"/>
	<form:input type="hidden" path="adherent.rmCommune.id"/>
	<form:input type="hidden" path="adherent.dateClotureExe"/>
	<form:input type="hidden" path="adherent.contactComptable"/>
	<form:input type="hidden" path="adherent.isFormationCommerce"/>
	<form:input type="hidden" path="adherent.etat.id"/>
	
<!-- 	<fieldset> -->
<%-- 	   	<legend><spring:message code="label.exploitation"/></legend> --%>

<!-- 		<div class="showDetail"> -->
<%-- 			<form:label path="adherent.agence"><spring:message code="label.agenceRattachement"/></form:label> --%>
<%-- 			<form:select class="valeur" name="adherent.agence" path="adherent.agence.id"> --%>
<%-- 				<form:options items="${agenceList}" itemValue="id" itemLabel="libelle" /> --%>
<%-- 			</form:select>					         --%>
<!-- 		</div> -->
	
<!-- 		<div class="showDetail"> -->
<%-- 			<form:label path="adherent.secteur"><spring:message code="label.secteur"/></form:label> --%>
<%-- 			<form:select class="valeur" name="adherent.secteur" path="adherent.secteur.id"> --%>
<%-- 				<form:options items="${secteurList}" itemValue="id" itemLabel="libelle" /> --%>
<%-- 			</form:select> --%>
<!-- 		</div> -->

<!-- 		<div class="showDetail"> -->
<%-- 			<form:label path="adherent.tournee"><spring:message code="label.tournee"/></form:label> --%>
<%-- 			<form:select class="valeur" name="adherent.tournee" path="adherent.tournee.id"> --%>
<%-- 				<form:options items="${tourneeList}" itemValue="id" itemLabel="libelle" /> --%>
<%-- 			</form:select>					         --%>
<!-- 		</div> -->

<!-- 		<div class="showDetail"> -->
<%-- 			<form:label path="adherent.isOutilDechargement"><spring:message code="label.outilDechargement"/></form:label> --%>
<%-- 			<form:checkbox path="adherent.isOutilDechargement"/> --%>
<!-- 		</div> -->
<!-- 	</fieldset> -->

	<fieldset>
	   	<legend class="legend"><spring:message code="label.commentaire"/></legend>
		<form:textarea id="summernote" name="editordata" path="commentaire"/>
	</fieldset>

	<div class="textAlignRight">
		<button class="action-button" type="submit">Enregistrer</button>
		<c:url value="/adherentInformatique" var="url"><c:param name="idAdh" value="${adhToEdit.adherent.id}"/></c:url>
		<button class="action-button" type="reset" onClick="window.location='${url}'">Annuler</button>
	</div>

</form:form>
 
 <script>
$(function() {
	$(document).ready(function() {
		  $('#summernote').summernote({
		 		placeholder: '<spring:message code="label.commentaire"/>',
		 		tabsize: 2,
		 		height: 150
		  });
		});
  });
</script>
