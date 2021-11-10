<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div  class="editAdherentEntete" >
	<div class="entete">
		<div class="photo">
			<c:choose >
				<c:when test = "${adherent.photo == ''}"> 
					<img src="<c:url value="/resources/images/noAdh.png" />" />
				</c:when>
				<c:otherwise> 						
					<img src="${adherent.photo}">
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
  
<form:form class="editAdherent" method="post" modelAttribute="adhContactComptable" action="editContactComptableAdh">
    <form:input type="hidden" path="contactComptableAdherent.id"/>
    <form:input type="hidden" path="contactComptableAdherent.adherentId"/>

    <fieldset>
        <legend class="legend"><spring:message code="label.contactComptable"/></legend>

        <div class="showDetail">
                <form:label path="contactComptableAdherent.cabinet" ><spring:message code="label.cabinetComptable"/></form:label>
                <form:input class="valeur" name="contactComptableAdherent.cabinet" path="contactComptableAdherent.cabinet"/>
                <b><i><form:errors path="contactComptableAdherent.cabinet" /></i></b>
        </div>

        <div class="showDetail">
                <form:label path="contactComptableAdherent.civilite" ><spring:message code="label.civilite"/></form:label>
                <form:input class="valeur" name="contactComptableAdherent.civilite" path="contactComptableAdherent.civilite"/>
                <b><i><form:errors path="contactComptableAdherent.civilite" /></i></b>
        </div>

        <div class="showDetail">
                <form:label path="contactComptableAdherent.nom" ><spring:message code="label.nom"/></form:label>
                <form:input class="valeur" name="contactComptableAdherent.nom" path="contactComptableAdherent.nom"/>
                <b><i><form:errors path="contactComptableAdherent.nom" /></i></b>
        </div>

        <div class="showDetail">
                <form:label path="contactComptableAdherent.prenom" ><spring:message code="label.prenom"/></form:label>
                <form:input class="valeur" name="contactComptableAdherent.prenom" path="contactComptableAdherent.prenom"/>
                <b><i><form:errors path="contactComptableAdherent.prenom" /></i></b>
        </div>

        <div class="showDetail">
                <form:label path="contactComptableAdherent.mail" ><spring:message code="label.mail"/></form:label>
                <form:input class="valeur" name="contactComptableAdherent.mail" path="contactComptableAdherent.mail"/>
                <b><i><form:errors path="contactComptableAdherent.mail" /></i></b>
        </div>

        <div class="showDetail">
                <form:label path="contactComptableAdherent.mobile" ><spring:message code="label.mobile"/></form:label>
                <form:input class="valeur" name="contactComptableAdherent.mobile" path="contactComptableAdherent.mobile"/>
                <b><i><form:errors path="contactComptableAdherent.mobile" /></i></b>
        </div>

        <div class="showDetail">
                <form:label path="contactComptableAdherent.fixe" ><spring:message code="label.fixe"/></form:label>
                <form:input class="valeur" name="contactComptableAdherent.fixe" path="contactComptableAdherent.fixe"/>
                <b><i><form:errors path="contactComptableAdherent.fixe" /></i></b>
        </div>

        
 
    </fieldset>
	
    <div class="textAlignRight">
        <button class="action-button" type="submit">Enregistrer</button>
        <c:url value="/adherentAdministratif" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <button class="action-button" type="reset" onClick="window.location='${url}'">Annuler</button>
    </div>

</form:form>
 
