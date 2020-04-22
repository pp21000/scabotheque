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

<form:form class="editAdherent" method="post" modelAttribute="adhToEdit" action="editArtipoleAdh">
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
<%-- 	<form:input type="hidden" path="adherent.isArtipole"/> --%>
<%-- 	<form:input type="hidden" path="adherent.isCharteArtipole"/> --%>
<%-- 	<form:input type="hidden" path="adherent.isFlocageArtipole"/> --%>
<%-- 	<form:input type="hidden" path="adherent.isWebArtipole"/> --%>
<%-- 	<form:input type="hidden" path="adherent.isFacebookArtipole"/> --%>
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
	<form:input type="hidden" path="adherent.adherentType.id"/>
	<form:input type="hidden" path="adherent.compteType.id"/>

	<fieldset>
	   	<legend class="legend"><spring:message code="label.activite"/></legend>
	
<!-- 		<div class="showDetail"> -->
<%-- 			<form:label path="adherent.pole" ><spring:message code="label.pole"/></form:label> --%>
<%-- 			<form:select class="valeur" name="adherent.pole" path="adherent.pole.id"> --%>
<%-- 				<form:options items="${poleList}" itemValue="id" itemLabel="libelle" /> --%>
<%-- 			</form:select> --%>
<%-- 			<b><i><form:errors path="adherent.pole" /></i></b> --%>
<!-- 		</div> -->

		<div  class="showDetail">
			<form:label path="adherent.isArtipole" ><spring:message code="label.adhArtipole"/></form:label>
			<form:checkbox path="adherent.isArtipole"/>
		</div>

		<div  class="showDetail">
			<form:label path="adherent.isArtipole" ><spring:message code="label.charteArtipole"/></form:label>
			<form:checkbox path="adherent.isCharteArtipole"/>
		</div>

		<div class="showDetail">
			<form:label path="adherent.isArtipole" ><spring:message code="label.flocageArtipole"/></form:label>
			<form:checkbox path="adherent.isFlocageArtipole"/>
		</div>

		<div class="showDetail">
			<form:label path="adherent.isArtipole" ><spring:message code="label.siteArtipole"/></form:label>
			<form:checkbox path="adherent.isWebArtipole"/>
		</div>

		<div class="showDetail">
			<form:label path="adherent.isArtipole" ><spring:message code="label.facebookArtipole"/></form:label>
			<form:checkbox path="adherent.isFacebookArtipole"/>
		</div>
	
	</fieldset>

	<fieldset>
	   	<legend class="legend"><spring:message code="label.commentaire"/></legend>
		<form:textarea id="summernote" name="editordata" path="commentaire"/>
	</fieldset>
	
	<div class="textAlignRight">
		<button class="action-button" type="submit">Enregistrer</button>
		<c:url value="/adherentArtipole" var="url"><c:param name="idAdh" value="${adhToEdit.adherent.id}"/></c:url>
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