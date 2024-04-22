<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="grid grid-cols-2 gap-4">
  <div>
    <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION_EDIT')">px-2 h-[28px]</sec:authorize>">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION_EDIT')">
        <c:url value="/edit/editLivraisonAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
      </sec:authorize>   
      <spring:message code="label.livraison"/>
    </div>
    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
      <dl class="divide-y divide-gray-300 text-sm">
        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.adresseLivraison"/> :
          </dt>
          <dd class="value">
            ${infoExploitation.adresseLivraison}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.adresseComplement"/> :
          </dt>
          <dd class="value">
            ${infoExploitation.adresseComplement}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.commune"/> :
          </dt>
          <dd class="value">
            <spring:message code="message.commune" arguments="${infoExploitation.commune.codePostal}, ${infoExploitation.commune.libelle}"/>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.chargeReception"/> :
          </dt>
          <dd class="value">
            ${contactReception.nom} ${contactReception.prenom}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.accesSemi"/> :
          </dt>
          <c:choose>
            <c:when test="${infoExploitation.isAccesSemi}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
            <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
          </c:choose> 
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.materielDechargement"/> :
          </dt>
          <c:choose>
            <c:when test="${infoExploitation.isMaterielDechargement}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
            <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
          </c:choose>             
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.autorisationOutils"/> :
          </dt>
          <c:choose>
            <c:when test="${infoExploitation.isAuthorise}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
            <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
          </c:choose>             
        </div>

        <div class="p-2 grid grid-cols-2 gap-3 items-center">
          <dt class="label">
            <spring:message code="label.commentaireMateriel"/> :
          </dt>
          <dd class="value overflow-visible whitespace-normal">
            ${infoExploitation.outillageCommentaire}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3 items-center">
          <dt class="label">
            <spring:message code="label.protocolDechargement"/> :
          </dt>
          <dd class="value overflow-visible whitespace-normal">
            ${infoExploitation.protocolDechargement}
          </dd>
        </div>            
      </dl>
    </div>
  </div>
              
  <div>
    <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION_EDIT')">px-2 h-[28px]</sec:authorize>">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION_EDIT')">
        <c:url value="/edit/editExploitationAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
      </sec:authorize>   
      <spring:message code="label.agence"/>
    </div>
    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
      <dl class="divide-y divide-gray-300 text-sm">
        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.agenceRattachement"/> :
          </dt>
          <dd class="value">
            ${adherent.agence.libelle}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.secteur"/> :
          </dt>
          <dd class="value">
            ${adherent.secteur.libelle}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.tournee"/> :
          </dt>
          <dd class="value">
            ${adherent.tournee.libelle}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.outilDechargement"/> :
          </dt>
          <c:choose>
            <c:when test="${adherent.isOutilDechargement}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
            <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
          </c:choose>            
        </div>          
      </dl>
    </div>
  </div>
</div>

