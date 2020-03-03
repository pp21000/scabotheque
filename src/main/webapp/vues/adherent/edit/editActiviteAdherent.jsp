<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="editAdherentEntete" >
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
				<span class="adherentLabel"><spring:message code="label.codeAdh"/></span>
				<span class="data" > ${adherent.code} </span>
			</div>
		</div>
	</div>
</div>   
	
<form:form class="editAdherent" method="post" modelAttribute="editForm" action="editActiviteAdh">
	<fieldset>
	   	<legend class="legend"><spring:message code="label.activite"/></legend>
	
		<c:forEach items="${editForm.activitesAdh}" var="activite" varStatus="status">
			<form:input type="hidden" path="activitesAdh[${status.index}].id"/>
			<form:input type="hidden" path="activitesAdh[${status.index}].adherentId"/>
			<form:input type="hidden" path="activitesAdh[${status.index}].activiteId"/>
			<form:input type="hidden" path="activitesAdh[${status.index}].activiteLibelle"/>
			<div class="showDetailCommentaire" >
				<span style="margin: auto 0;">${activite.activiteLibelle}</span>
				<div>
					<form:input type="text" placeholder="Pourcentage" path="activitesAdh[${status.index}].pourcentage"/>
					<span style="margin: auto 0;">%</span><br>
					<form:errors class="error" path="activitesAdh[${status.index}].pourcentage" />
				</div>
				<div style="display:flex;">
					<form:input style="flex:1;" type="text" placeholder="commentaire" path="activitesAdh[${status.index}].commentaire"/>
				</div>
			</div>
		</c:forEach>
	</fieldset>

	<fieldset class="fieldsetCommentaire">
	   	<legend class="legend"><spring:message code="label.commentaire"/></legend>
		<form:textarea id="summernote" name="editordata" path="commentaire"/>
	</fieldset>
	
	<div class="textAlignRight">
		<button class="action-button" type="submit">Enregistrer</button>
		<c:url value="/adherentActivite" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
		<button class="action-button" type="reset" onClick="window.location='${url}'">Annuler</button>
	</div>

</form:form>

<script>
$(function() {
	$(document).ready(function() {
		  $('#summernote').summernote({
		 		placeholder: '<spring:message code="label.commentaire"/>',
		 		tabsize: 3,
		 		height: 100
		  });
		});
  });
</script>
 