<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
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
        <a href="${url}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
      </sec:authorize>
      <spring:message code="label.modifGeneral"/>
    </div>

    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
      <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
        <dl class="sm:divide-y sm:divide-gray-300">
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.dateEntree"/> :
            </dt>
            <dd class="value">
              <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateEntree}"/>
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.nbSalarie"/> :
            </dt>
            <dd class="value">
              ${adherent.nbSalaries}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.role"/> :
            </dt>
            <dd class="value">
              ${adherent.role.libelle}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.adherentType"/> :
            </dt>
            <dd class="value">
              ${adherent.adherentType.libelle}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.dateEntree"/> :
            </dt>
            <dd class="value">
              <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateEntree}"/>
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.formeJuridique"/> :
            </dt>
            <dd class="value">
              ${adherent.formeJuridique.libelle}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.siren"/> :
            </dt>
            <dd class="value">
              ${adherent.siren}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.siret"/> :
            </dt>
            <dd class="value">
              ${adherent.siret}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.ape"/> :
            </dt>
            <dd class="value">
              ${adherent.ape.libelle}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.numRepMetier"/> :
            </dt>
            <dd class="value">
              ${adherent.numRepMetier}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.rcsCommune"/> :
            </dt>
            <dd class="value">
              <spring:message code="message.commune" arguments="${adherent.rcsCommune.codePostal}, ${adherent.rcsCommune.libelle}"/>
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.rmCommune"/> :
            </dt>
            <dd class="value">
              <spring:message code="message.commune" arguments="${adherent.rmCommune.codePostal}, ${adherent.rmCommune.libelle}"/>
            </dd>
          </div>            

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.reglement"/> :
            </dt>
            <dd class="value">
              <c:choose>
                <c:when test="${adherent.compteType.id == 1}">
                  ${adherent.compteType.libelle}
                </c:when>
                <c:otherwise>
                  ${adherent.compteType.libelle}
                </c:otherwise>
              </c:choose>
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.dateClotureExe"/> :
            </dt>
            <dd class="value">
              <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateClotureExe}"/>
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.etat"/> :
            </dt>
            <dd class="value">
              ${adherent.etat.libelle}
            </dd>
          </div>

          <c:choose>
            <c:when test="${adherent.etat.id == 2}">
              <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
                <dt class="label">
                  <spring:message code="label.dateSortie"/> :
                </dt>
                <dd class="value">
                  <fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateSortie}"/>
                </dd>
              </div>
            </c:when>
          </c:choose>
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              <spring:message code="label.cnxEolasAllow"/> :
            </dt>
            <c:choose>
              <c:when test="${adherent.cnxEolasAllow}">
                <dd class="value text-sky-600 font-bold">
                  <spring:message code="yes"/>
                </dd>
              </c:when>
              <c:otherwise>
                <dd class="value">
                  <spring:message code="no"/>
                </dd>
              </c:otherwise>
            </c:choose>
          </div>

          <div class="py-3 sm:py-5 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-6">
            <dt class="label">
              <spring:message code="label.formationCommerce"/> :
            </dt>
            <dd class="value">
              ${adherent.formationDirigeant}
              </span>
          </div>
        </dl>
      </div>
    </div>
  </div>

  <div>
    <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">px-2 h-[28px]</sec:authorize>">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">
        <c:url value="/edit/editContactComptableAdh" var="urlContact"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${urlContact}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
      </sec:authorize>
      <spring:message code="label.contactComptable"/>
    </div>


    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
      <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
        <dl class="sm:divide-y sm:divide-gray-300">
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              Cabinet comptable :              
            </dt>
            <dd class="value">
              ${contactComptable.cabinet}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              Civilité :
            </dt>
            <dd class="value">
              ${contactComptable.civilite}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              Nom :
            </dt>
            <dd class="value">
              ${contactComptable.nom}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              Prénom :
            </dt>
            <dd class="value">
              ${contactComptable.prenom}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              E-mail :
            </dt>
            <dd class="value">
              ${contactComptable.mail}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              Tél fixe :
            </dt>
            <dd class="value">
              ${contactComptable.fixe}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
            <dt class="label">
              Tél mobile :
            </dt>
            <dd class="value">
              ${contactComptable.mobile}
            </dd>
          </div>

        </dl>
      </div>
    </div>
  </div>
</div>
