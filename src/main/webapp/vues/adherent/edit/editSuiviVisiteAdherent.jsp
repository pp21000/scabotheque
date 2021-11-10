<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div  class="editAdherentEntete" >
	<div class="entete">				
		<div class="photo">
			<c:choose >
				<c:when test = "${adherent.photoImg == ''}"> 
					<img src="<c:url value="/resources/images/noAdh.png" />" />
				</c:when>
				<c:otherwise> 						
					<img src="${adherent.photoImg}">
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<span class="scabotheque-h3">${adherent.denomination}</span>
			<div>
				<span class="detailLabel"><spring:message code="label.codeAdh"/></span>
				<span class="data" > ${adherent.code} </span>
			</div>
		</div>
	</div>
</div>

<form:form class="editAdherentSuiviVisite" method="post" modelAttribute="editForm" action="editCRMAdh">
    <form:input type="hidden" path="suiviVisiteAdh.id"/>
    <form:input type="hidden" path="suiviVisiteAdh.adherentId"/>

    <fieldset class="fieldsetCommentaire">
        <div class="showDetail">
            <form:label path="suiviVisiteAdh.dateCommentaire"><spring:message code="label.dateSuivi"/></form:label>
            <span>
                    <form:input class="valeur" type="date" name="suiviVisiteAdh.dateCommentaire" path="suiviVisiteAdh.dateCommentaire"/>
                    <form:errors class="errors" path="suiviVisiteAdh.dateCommentaire" />
            </span>
        </div>
            
        <!--<legend class="legend">Suivi du ${suiviVisiteAdh.dateSuivi} </legend>-->
        <form:textarea id="summernote" name="editordata" path="suiviVisiteAdh.commentaire" />
    </fieldset>

    <div class="textAlignRight">
        <button class="action-button" type="submit">Enregistrer</button>
        <c:url value="/adherentCRM" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
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
 
