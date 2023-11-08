<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<div class="showAdherent" style="margin-bottom: 5em">
    <div class="flex justify-center">
        <div class="flex-shrink-0">
            <c:choose>
                <c:when test="${adherent.photoImg == ''}">
                    <img class="h-48 w-48 rounded-full object-cover" src="<c:url value='/resources/images/noAdh.png' />" />
                </c:when>
                <c:otherwise>
                    <img class="h-48 w-48 rounded-full object-cover" src="${adherent.photoImg}">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="ml-6">
            <h3 class="font-medium text-xl text-center">${adherent.denomination}</h3>
            <div class="mt-2">
      <span class="text-sm font-medium text-gray-500">
        <spring:message code="label.codeAdh"/>
      </span>
                <span class="data font-medium text-gray-900"> ${adherent.code} </span>
            </div>
        </div>
    </div>

    
    <form:form method="post" modelAttribute="criteria" action="adherentCRM?idAdh=${adherent.id}">
        <spring:message code="label.texteRecherche" var="recherchePH"/>

        <div class="flex items-center justify-between p-6 bg-white rounded-lg shadow-md">
            <c:url value="/initListeAdherents" var="urlInit"/>
            <input type="text" class="form-input" placeholder="${recherchePH}" autofocus="true"/>
            <input type="hidden" value="${adherent.id}" name="adhId">
            <button class="btn btn-primary" type="submit">Rechercher</button>
        </div>
    </form:form>

    <form:form class="addAdherentSuivi" method="post" modelAttribute="suiviToAdd" action="edit/addAdherentSuivi" >
	<form:input type="hidden" path="suiviVisiteAdh.adherentId"/>


        <div id="addSuiviVisiteForm" title="Ajouter un contact">
            <fieldset class="p-6 border rounded">
                <legend class="text-lg font-medium mb-4">Ajouter un contact</legend>
                <div class="showDetail">
                    <form:label path="suiviVisiteAdh.dateCommentaire"><spring:message code="label.dateSuivi"/></form:label>
                    <form:input class="valeur" type="date" name="suiviVisiteAdh.dateCommentaire" path="suiviVisiteAdh.dateCommentaire"/>
                    <form:errors class="error-message" path="suiviVisiteAdh.dateCommentaire" />
                    <form:textarea id="summernote" name="editordata" path="suiviVisiteAdh.commentaire" />
                </div>
                <div class="text-right">
                    <button class="bg-blue-500 text-white p-2 rounded-full hover:bg-blue-600">Enregistrer</button>
                </div>
            </fieldset>
        </div>
    </form:form>

    <fieldset class="p-6 border rounded">
        <legend class="text-lg font-medium mb-4">Suivi de la visite</legend>
        <c:forEach items="${infoSuiviVisite}" var="visite">
            <div class="adhernetCRMDetail mb-6">
                <div class="flex mb-4">
                    <div class="w-1/3 text-sm font-medium mr-2">Date de suivi</div>
                    <div class="w-2/3 font-medium">
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${visite.dateCommentaire}" />
                    </div>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM_EDIT')">
                        <div class="editIcone ml-auto">
                            <c:url value="/edit/editCRMAdh" var="url">
                                <c:param name="idAdh" value="${adherent.id}"/>
                                <c:param name="idSuivi" value="${visite.id}"/>
                            </c:url>
                            <a href="${url}">
                                <svg class="h-6 w-6 fill-current text-blue-500">
                                    <use xlink:href="resources/images/icones.svg#edit"></use>
                                </svg>
                            </a>
                        </div>
                    </sec:authorize>
                </div>
                <div class="font-medium mb-4">${visite.commentaireString}</div>
            </div>
        </c:forEach>
    </fieldset>

</div>

<script>
$(function() {
	$(document).ready(function() {
		  $('#summernote').summernote({
		 		placeholder: '<spring:message code="label.commentaire"/>',
		 		tabsize: 2,
		 		height: 150
			  
		  });
		  
		});
		
	$('#addSuivi').click(function(e){ 
		 $( "#addSuiviVisiteForm" ).toggle( 'slow' );
	});
  });
</script>