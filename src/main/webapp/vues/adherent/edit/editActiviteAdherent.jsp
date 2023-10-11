<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
<button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
		type="reset" onClick="window.location='${url}'">< Retour
</button>

<div class="flex justify-center">
	<div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
		<div>
			<c:choose>
				<c:when test="${adherent.photoImg == ''}">
					<img class="rounded-full" src="<c:url value="/resources/images/noAdh.png" />"/>
				</c:when>
				<c:otherwise>
					<img class="rounded-full" src="${adherent.photoImg}">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="flex flex-col">
			<div class="text-center text-lg font-semibold">
				${adherent.denomination}
			</div>
			<div class="text-center text-sm">
				<spring:message code="label.codeAdh"/> :
				${adherent.code}
			</div>
		</div>
	</div>
</div>

<form:form class="editAdherent" method="post" modelAttribute="editForm" action="editActiviteAdh">
	<fieldset>
	   	<legend class="legend underline text-center mt-4"><spring:message code="label.activite"/></legend>
                <form:input type="hidden" placeholder="messageErreur" path="messageErreur"/>
		<form:errors class="error" path="messageErreur" />
<div class="flex flex-col items-center justiy-center gap-2 mt-2">
		<c:forEach items="${editForm.activitesAdh}" var="activite" varStatus="status">
			<form:input type="hidden" path="activitesAdh[${status.index}].id"/>
			<form:input type="hidden" path="activitesAdh[${status.index}].adherentId"/>
			<form:input type="hidden" path="activitesAdh[${status.index}].activiteId"/>
			<form:input type="hidden" path="activitesAdh[${status.index}].activiteLibelle"/>
			<div class="grid grid-cols-3 w-1/2">
				<span>${activite.activiteLibelle}</span>
				<div class="grid grid-cols-3">
					<form:input class="block p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-neutral-500 focus:border-neutral-500" type="text" placeholder="Pourcentage" path="activitesAdh[${status.index}].pourcentage"/>
					<div class="px-2">%</div>
					<form:errors class="error" path="activitesAdh[${status.index}].pourcentage" />
				</div>
				<div>
					<form:input class="block p-2 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-xs focus:ring-neutral-500 focus:border-neutral-500" style="flex:1;" type="text" placeholder="commentaire" path="activitesAdh[${status.index}].commentaire"/>
				</div>
			</div>
		</c:forEach>
</div>
	</fieldset>

    <fieldset class="flex justify-center mt-4">
        <legend class="text-center mt-4 mb-2 underline"><spring:message code="label.commentaire"/></legend>
        <form:textarea class="w-96 h-16 block text-sm text-gray-900 rounded-lg border border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" id="summernote" name="editordata" path="commentaire"/>
    </fieldset>
    

    <div class="flex justify-center gap-2 mt-2">
        <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
                id="save" type="submit">Enregistrer
        </button>
        <c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
                id="cancel" type="reset" onClick="window.location='${url}'">Annuler
        </button>
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
 