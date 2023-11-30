<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="informatique"/><c:param name="idAdh" value="${editForm.editAdherent.id}"/></c:url>
<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location='${urlPrev}'">
  <spring:message code="label.retour"/>
</button>

<div class="flex justify-center">
  <div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
    <div>
      <c:choose>
        <c:when test="${editForm.editAdherent.photo == ''}">
                <img class="rounded-full h-32" src="<c:url value="/resources/images/noAdh.png" />"/>
        </c:when>
        <c:otherwise>
                <img class="rounded-full h-32" src="${editForm.editAdherent.photo}">
        </c:otherwise>
      </c:choose>
    </div>
    <div class="flex flex-col">
      <div class="text-center text-lg font-semibold">
              ${editForm.editAdherent.denomination}
      </div>
      <div class="text-center text-sm">
              <spring:message code="label.codeAdh"/> :
              ${editForm.editAdherent.code}
      </div>
    </div>
  </div>
</div>

<form:form class="editAdherent" method="post" modelAttribute="editForm" action="editInformatiqueAdh">
 	<fieldset class="mt-10"> 
 	   	<%--<legend class="text-center underline mt-4 mb-2"><spring:message code="label.informatique"/></legend>--%>

 		<div class="text-center">
                    
                    <!--<div  class="showDetailAdherent">-->
                        La super page de modification de l'informatique ...
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
          <legend class="text-center mt-4"><spring:message code="label.commentaire"/></legend>
          <form:textarea class="w-96 h-32 block input-textarea" id="summernote" name="editordata" path="commentaire"/>
	</fieldset>

	<div class="flex justify-center gap-2 mt-10">
          <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" id="save" type="submit">
            Enregistrer
          </button>
          <button class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location='${urlPrev}'">
            Annuler
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
