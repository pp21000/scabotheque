<%--
  Created by IntelliJ IDEA.
  User: ludovic.spina
  Date: 17/02/2023
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div>
  <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION_EDIT')">
    <div class="flex items-center mb-1">
      <c:url value="/edit/editLivraisonAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
      <a href="${url}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
        </svg>
      </a>
      <spring:message code="label.modifGeneral"/>
    </div>
  </sec:authorize>   
  
  <div class="grid grid-cols-2 gap-4">
    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
      <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
        <dl class="sm:divide-y sm:divide-gray-300">
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.agenceRattachement"/> :
            </dt>
            <dd class="value">
              ${adherent.agence.libelle}
            </dd>
          </div>
            
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.secteur"/> :
            </dt>
            <dd class="value">
              ${adherent.secteur.libelle}
            </dd>
          </div>
            
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.tournee"/> :
            </dt>
            <dd class="value">
              ${adherent.tournee.libelle}
            </dd>
          </div>
            
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.adresseLivraison"/> :
            </dt>
            <dd class="value">
              ${infoExploitation.adresseLivraison}
            </dd>
          </div>
            
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.adresseComplement"/> :
            </dt>
            <dd class="value">
              ${infoExploitation.adresseComplement}
            </dd>
          </div>
            
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.commune"/> :
            </dt>
            <dd class="value">
              <spring:message code="message.commune" arguments="${infoExploitation.commune.codePostal}, ${infoExploitation.commune.libelle}"/>
            </dd>
          </div>
            
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.chargeReception"/> :
            </dt>
            <dd class="value">
              <span class="data">${contactReception.nom}</span>
              <span class="data">${contactReception.prenom}</span>
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.accesSemi"/> :
            </dt>
            <dd class="value">
              <c:choose>
                <c:when test="${infoExploitation.isAccesSemi}">
                  <spring:message code="yes"/></c:when>
                <c:otherwise>
                  <spring:message code="no"/>
                </c:otherwise>
              </c:choose>
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.outilDechargement"/> :
            </dt>
            <dd class="value">
              <c:choose>
                <c:when test="${infoExploitation.isMaterielDechargement}">
                  <spring:message code="yes"/></c:when>
                <c:otherwise>
                  <spring:message code="no"/>
                </c:otherwise>
              </c:choose>
            </dd>
          </div>
            
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.authorisationOutils"/> :
            </dt>
            <dd class="value">
              <c:choose>
                <c:when test="${infoExploitation.isAuthorise}">
                  <spring:message code="yes"/></c:when>
                <c:otherwise>
                  <spring:message code="no"/>
                </c:otherwise>
              </c:choose>
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.commentaireMateriel"/> :
            </dt>
            <dd class="value">
              ${infoExploitation.outillageCommentaire}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.protocolDechargement"/> :
            </dt>
            <dd class="value">
              ${infoExploitation.protocolDechargement}
            </dd>
          </div>            
        </dl>
      </div>
    </div>
  </div>
</div>

