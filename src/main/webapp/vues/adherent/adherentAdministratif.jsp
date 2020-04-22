<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<div class="showAdherent">
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
                    <span class="adherentLabel"><spring:message code="label.codeAdh"/></span>
                    <span class="data" > ${adherent.code} </span>
                </div>
            </div>
        </div>
    </div>
    <fieldset>
    	<legend class="legend"><spring:message code="label.administratif"/></legend>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">    	
                <div class="editIcone">
                    <c:url value="/edit/editAdministratifAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                    <span><a href="${url}"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
                </div>
            </sec:authorize>	
            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.dateEntree"/></span>
                <span class="data"><fmt:formatDate pattern="MM/dd/yyyy" value="${adherent.dateEntree}" /></span>
            </div>

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.role"/></span>
                <span class="data">${adherent.role.libelle}</span>
            </div>

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.adherentType"/></span>
                <span class="data">${adherent.adherentType.libelle}</span>
            </div>
            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.reglement"/></span>
                <span class="data">${adherent.compteType.libelle}</span>
            </div>

            <div  class="showDetailAdherent"> 
                <span class="adherentLabel"><spring:message code="label.formeJuridique"/></span>
                <span class="data">${adherent.formeJuridique.libelle}</span>
            </div>

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.siren"/></span>
                <span class="data">${adherent.siren}</span>
            </div>

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.siret"/></span>
                <span class="data">${adherent.siret}</span>
            </div>

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.ape"/></span>
                <span class="data">${adherent.ape.libelle}</span>
            </div>

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.numRepMetier"/></span>
                <span class="data">${adherent.numRepMetier}</span>
            </div>

<!-- 		<div  class="showDetailAdherent"> -->
<%-- 	        <span class="adherentLabel"><spring:message code="label.rcsRm"/></span> --%>
<%-- 			<span class="data">${adherent.rcsRm}</span> --%>
<!-- 		</div> -->

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.rcsCommune"/></span>
                <span class="data"><spring:message code="message.commune" arguments="${adherent.rcsCommune.codePostal}, ${adherent.rcsCommune.libelle}"/></span>
            </div>

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.rmCommune"/></span>
                <span class="data"><spring:message code="message.commune" arguments="${adherent.rmCommune.codePostal}, ${adherent.rmCommune.libelle}"/></span>
            </div>

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.dateClotureExe"/></span>
                <span class="data"><fmt:formatDate pattern="MM/dd/yyyy" value="${adherent.dateClotureExe}" /></span>
            </div>

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.formationCommerce"/></span>
                <span class="data">
                    <c:choose>
                        <c:when test="${adherent.isFormationCommerce}"><spring:message code="yes"/></c:when> 
                        <c:otherwise><spring:message code="no"/></c:otherwise> 
                    </c:choose>
                </span>
            </div>

            <div  class="showDetailAdherent">
                <span class="adherentLabel"><spring:message code="label.etat"/></span>
                <span class="data">${adherent.etat.libelle}</span>
            </div>
    </fieldset>
	
    <fieldset class="showCommentaire">
    	<legend  class="legend"><spring:message code="label.commentaire"/></legend>
    	<span class="data" >${commentaire}</span>
    </fieldset>
</div>
