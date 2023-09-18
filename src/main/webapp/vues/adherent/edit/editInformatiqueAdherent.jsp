<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adhToEdit.adherent.id}"/></c:url>
<button class="px-3 py-2 text-xs font-medium text-center text-white bg-neutral-700 rounded-lg hover:bg-neutral-800 focus:ring-4 focus:outline-none focus:ring-neutral-300"
		id="cancel" type="reset" onClick="window.location='${url}'">Retour
</button>

<div class="flex justify-center">
	<div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
		<div>
			<c:choose>
				<c:when test="${adhToEdit.adherent.photo == ''}">
					<img class="rounded-full" src="<c:url value="/resources/images/noAdh.png" />"/>
				</c:when>
				<c:otherwise>
					<img class="rounded-full" src="${adhToEdit.adherent.photo}">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="flex flex-col">
			<div class="text-center text-lg font-semibold">
				${adhToEdit.adherent.denomination}
			</div>
			<div class="text-center text-sm">
				<spring:message code="label.codeAdh"/> :
				${adhToEdit.adherent.code}
			</div>
		</div>
	</div>
</div>

<form:form class="editAdherent" method="post" modelAttribute="adhToEdit" action="editInformatiqueAdh">
 	<fieldset> 
 	   	<legend class="text-center underline mt-4 mb-2"><spring:message code="label.informatique"/></legend>

 		<div class="text-center">
                    
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

	<fieldset class="flex justify-center">
		<legend class="text-center mt-4 mb-2 underline"><spring:message code="label.commentaire"/></legend>
		<form:textarea class="w-96 h-32 block text-sm text-gray-900 rounded-lg border border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" id="summernote" name="editordata" path="commentaire"/>
	</fieldset>

	<div class="flex justify-center gap-2 mt-2">
		<button class="px-3 py-2 text-xs font-medium text-center text-white bg-neutral-700 rounded-lg hover:bg-neutral-800 focus:ring-4 focus:outline-none focus:ring-neutral-300"
				id="save" type="submit">Enregistrer
		</button>
		<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adhToEdit.adherent.id}"/></c:url>
		<button class="px-3 py-2 text-xs font-medium text-center text-white bg-neutral-700 rounded-lg hover:bg-neutral-800 focus:ring-4 focus:outline-none focus:ring-neutral-300"
				id="cancel" type="reset" onClick="window.location='${url}'">Annuler
		</button>
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
