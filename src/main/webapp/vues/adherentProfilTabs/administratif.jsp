<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="grid grid-cols-2 gap-4">
  <div>
    <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">px-2 h-[28px]</sec:authorize>">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">
        <c:url value="/edit/editAdministratifAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
      </sec:authorize>
      <spring:message code="label.modifGeneral"/>
    </div>

    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
      <dl class="divide-y divide-gray-300 text-sm">
        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.role"/> :
          </dt>
          <dd class="value<c:if test="${adherent.role.id == 5}"> text-red-600</c:if>">
            ${adherent.role.libelle}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.adherentType"/> :
          </dt>
          <dd class="value<c:if test="${adherent.adherentType.id == 2}"> text-red-600</c:if>">
            ${adherent.adherentType.libelle}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.etat"/> :
          </dt>
          <dd class="value text-green-600<c:if test="${adherent.etat.id == 2}"> text-red-600</c:if>">
            ${adherent.etat.libelle}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.compteType"/> :
          </dt>
          <dd class="value text-green-600<c:if test="${adherent.compteType.id != 1}"> text-red-600</c:if>">
            ${adherent.compteType.libelle}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.cnxEolasAllow"/> :
          </dt>
          <c:choose>
            <c:when test="${adherent.cnxEolasAllow}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
            <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
          </c:choose>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.dateEntree"/> :
          </dt>
          <dd class="value">
            <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateEntree}"/>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.dateSortie"/> :
          </dt>
          <dd class="value">
            <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateSortie}"/>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.dateClotureExe"/> :
          </dt>
          <dd class="value">
            <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateClotureExe}"/>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.dateCreation"/> :
          </dt>
          <dd class="value">
            <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateCreation}"/>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.formeJuridique"/> :
          </dt>
          <dd class="value">
            ${adherent.formeJuridique.libelle}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.nbSalaries"/> :
          </dt>
          <dd class="value">
            ${adherent.nbSalaries}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.siren"/> :
          </dt>
          <dd class="value">
            ${adherent.siren}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.siret"/> :
          </dt>
          <dd class="value">
            ${adherent.siret}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.ape"/> :
          </dt>
          <dd class="value">
            ${adherent.ape.libelle}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.numRepMetier"/> :
          </dt>
          <dd class="value">
            ${adherent.numRepMetier}
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.formationCommerce"/> :
          </dt>
          <dd class="value">
            ${adherent.formationDirigeant}
            </span>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.rcsRm"/> :
          </dt>
          <dd class="value">
            ${adherent.rcsRm}
            </span>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.rcsCommune"/> :
          </dt>
          <dd class="value">
            <spring:message code="message.commune" arguments="${adherent.rcsCommune.codePostal}, ${adherent.rcsCommune.libelle}"/>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.rmCommune"/> :
          </dt>
          <dd class="value">
            <spring:message code="message.commune" arguments="${adherent.rmCommune.codePostal}, ${adherent.rmCommune.libelle}"/>
          </dd>
        </div>            
      </dl>
    </div>
  </div>

  <div>
    <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">px-2 h-[28px]</sec:authorize>">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">
        <c:url value="/edit/editContactComptableAdh" var="urlContact"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${urlContact}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
      </sec:authorize>
      <spring:message code="label.contactComptable"/>
    </div>


    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
      <c:choose>
        <c:when test="${empty contactComptable.cabinet and empty contactComptable.civilite and empty contactComptable.nom and empty contactComptable.prenom and empty contactComptable.mail and empty contactComptable.fixe and empty contactComptable.mobile}">
          <dt class="text-gray-400 px-5 py-1">Non renseigné</dt>
        </c:when>
        <c:otherwise>      
          <dl class="divide-y divide-gray-300 text-sm">
            <div class="p-2 grid grid-cols-2 gap-3">
              <dt class="label">
                Cabinet comptable :              
              </dt>
              <dd class="value">
                ${contactComptable.cabinet}
              </dd>
            </div>

            <div class="p-2 grid grid-cols-2 gap-3">
              <dt class="label">
                Comptable :
              </dt>
              <dd class="value">
                ${contactComptable.civilite} ${contactComptable.prenom} ${contactComptable.nom}
              </dd>
            </div>

            <div class="p-2 grid grid-cols-2 gap-3">
              <dt class="label">
                E-mail :
              </dt>
              <dd class="value">
                ${contactComptable.mail}
              </dd>
            </div>

            <div class="p-2 grid grid-cols-2 gap-3">
              <dt class="label">
                Tél fixe :
              </dt>
              <dd class="value">
                ${contactComptable.fixe}
              </dd>
            </div>

            <div class="p-2 grid grid-cols-2 gap-3">
              <dt class="label">
                Tél mobile :
              </dt>
              <dd class="value">
                ${contactComptable.mobile}
              </dd>
            </div>
          </dl>
        </c:otherwise>
      </c:choose>            
    </div>
  </div>
</div>
