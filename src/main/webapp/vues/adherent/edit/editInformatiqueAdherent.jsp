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
				<span class="detailLabel"><spring:message code="label.codeAdh"/></span>
				<span class="data" > ${adhToEdit.adherent.code} </span>
			</div>
		</div>
	</div>
</div>  

<form:form class="editAdherent" method="post" modelAttribute="adhToEdit" action="editInformatiqueAdh">
 	<fieldset> 
 	   	<legend><spring:message code="label.informatique"/></legend> 

 		<div class="showDetail"> 
                    
                    <!--<div  class="showDetailAdherent">-->
                        La super page de mofidication de l'informatique ...
                    <!--</div>-->
        
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
 	</fieldset> 

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
