<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<div class="showAdherent" style="margin-bottom: 5em">
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
            <div class="textAlignCenter">
                <span class="scabotheque-h3 textAlignCenter">${adherent.denomination}</span>
                <div>
                    <span class="detailLabel"><spring:message code="label.codeAdh"/></span>
                    <span class="data" > ${adherent.code} </span>
                </div>
            </div>
        </div>
    </div>
    
    <form:form method="post" modelAttribute="criteria" action="adherentCRM?idAdh=${adherent.id}">
        <spring:message code="label.texteRecherche" var="recherchePH"/>

        <div class="listAdherent-recherche">
            <div class="listAdherent-recherche-criteres">
                <div style="display:inline-flex;">
                    <c:url value="/initListeAdherents" var="urlInit"/>

                    <form:input style="width:15em;" type="text" path="text" placeholder="${recherchePH}"  autofocus="true"/>

                    <input type="hidden" value="${adherent.id}" name="adhId">
                    <button class="action-button" type="submit">Rechercher</button>
                    <!--<a title="<spring:message code="label.initRecherche"/>" class="icon-button" onclick="window.location.href='${urlInit}'"><svg><use xlink:href="resources/images/icones.svg#reset"></use></svg></a>-->


                </div>
                
                <!--<div>-->
                    <%--<spring:message code="count.adherent" arguments="${listeAdherents.size()}"/>--%>
                <!--</div>-->
            </div>
        </div>
    </form:form>

    <form:form class="addAdherentSuivi" method="post" modelAttribute="suiviToAdd" action="edit/addAdherentSuivi" >
	<form:input type="hidden" path="suiviVisiteAdh.adherentId"/>
<!--        <div class="textAlignRight">
            <button class="action-button" id="addSuivi" type="button">Ajouter un suivi</button>
        </div>-->
        <div  id="addSuiviVisiteForm" style="display:none" title="Ajouter un contact" >
            <fieldset>
                <legend class="legend"><spring:message code="label.addSuivi"/></legend>
                <div class="showDetail">
                    <form:label path="suiviVisiteAdh.dateCommentaire"><spring:message code="label.dateSuivi"/></form:label>
                    <!--<span>-->
                        <form:input class="valeur" type="date" name="suiviVisiteAdh.dateCommentaire" path="suiviVisiteAdh.dateCommentaire"/>
                        <form:errors class="errors" path="suiviVisiteAdh.dateCommentaire" />
                    <!--</span>-->

                    <form:textarea id="summernote" name="editordata" path="suiviVisiteAdh.commentaire" />
                </div> 
                <div class="textAlignRight">
                    <button class="action-button" type="submit">Enregistrer</button>
                </div>

            </fieldset>
        </div>
    </form:form>

    <fieldset>
    	<legend class="legend"><spring:message code="label.suiviVisite"/></legend>
        <c:forEach items="${infoSuiviVisite}" var="visite">
            <div class="adhernetCRMDetail">
            <div  class="showDetailAdherentTriple">
                <span class="detailLabel"><spring:message code="label.dateSuivi"/></span>
                <span class="data"><fmt:formatDate pattern="dd/MM/yyyy" value="${visite.dateCommentaire}" /></span>
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM_EDIT')">
                    <div class="editIcone">
                        <c:url value="/edit/editCRMAdh" var="url">
                            <c:param name="idAdh" value="${adherent.id}"/>
                            <c:param name="idSuivi" value="${visite.id}"/>
                        </c:url>
                        <span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
                    </div>	
                </sec:authorize>    
            </div>
            <span>${visite.commentaireString}</span>
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