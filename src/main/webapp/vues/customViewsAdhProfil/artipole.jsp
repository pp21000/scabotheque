<%--
  Created by IntelliJ IDEA.
  User: ludovic.spina
  Date: 17/02/2023
  Time: 09:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="grid grid-cols-3 gap-4">
  <div>
    
    <!-- GÉNÉRAL -->
    <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">px-2 h-[28px]</sec:authorize>">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
        <c:url value="/edit/editArtipoleAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
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
          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.adhArtipole"/> :
            </dt>
            <c:choose>
              <c:when test="${adherent.isArtipole}">
                <dd class="value text-sky-600 font-bold"><spring:message code="yes"/></dd>
              </c:when>
              <c:otherwise>
                <dd class="value"><spring:message code="no"/></dd>
              </c:otherwise>
            </c:choose>
          </div>              

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.charteArtipole"/> :
            </dt>
            <c:choose>
              <c:when test="${adherent.isCharteArtipole}">
                <dd class="value text-sky-600 font-bold"><spring:message code="yes"/></dd>
              </c:when>
              <c:otherwise>
                <dd class="value"><spring:message code="no"/></dd>
              </c:otherwise>
            </c:choose>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.flocageArtipole"/> :
            </dt>
            <c:choose>
              <c:when test="${adherent.isFlocageArtipole}">
                <dd class="value text-sky-600 font-bold"><spring:message code="yes"/></dd>
              </c:when>
              <c:otherwise>
                <dd class="value"><spring:message code="no"/></dd>
              </c:otherwise>
            </c:choose>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.siteArtipole"/> :
            </dt>
            <c:choose>
              <c:when test="${adherent.isWebArtipole}">
                <dd class="value text-sky-600 font-bold"><spring:message code="yes"/></dd>
              </c:when>
              <c:otherwise>
                <dd class="value"><spring:message code="no"/></dd>
              </c:otherwise>
            </c:choose>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.facebookArtipole"/> :
            </dt>
            <c:choose>
              <c:when test="${adherent.isFacebookArtipole}">
                <dd class="value text-sky-600 font-bold"><spring:message code="yes"/></dd>
              </c:when>
              <c:otherwise>
                <dd class="value"><spring:message code="no"/></dd>
              </c:otherwise>
            </c:choose>
          </div>


          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.siteWeb"/> :
            </dt>
            <dd class="value">
              ${adherent.siteWeb}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.facebook"/> :
            </dt>
            <dd class="value">
              ${adherent.facebook}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.instagram"/> :
            </dt>
            <dd class="value">
              ${adherent.instagram}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.linkedin"/> :
            </dt>
            <dd class="value">
              ${adherent.linkedin}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.youtube"/> :
            </dt>
            <dd class="value">
              ${adherent.youtube}
            </dd>
          </div>

          <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 items-center">
            <dt class="label">
              <spring:message code="label.pinterest"/> :
            </dt>
            <dd class="value">
              ${adherent.pinterest}
            </dd>
          </div>
        </dl>
      </div>
    </div>
  </div>

  <!-- MÉTIERS -->          
  <div>
    <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">px-2 h-[28px]</sec:authorize>">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
        <c:url value="/edit/editMetiersAdherent" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
      </sec:authorize>
      <spring:message code="label.metiers"/>
    </div>
    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg sm:divide-y sm:divide-gray-300">
      <c:forEach items="${metiers}" var="metier">
        <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
          <dl>
            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
              <dt class="label">${metier.libelle} :</dt>
              <c:choose>
                <c:when test="${metiersAdherentId.contains(metier.id)}">
                  <dd class="value text-sky-600 font-bold"><spring:message code="yes"/></dd>
                </c:when>
                <c:otherwise>
                  <dd class="value">
                    <spring:message code="no"/>
                  </dd>
                </c:otherwise>
              </c:choose>
            </div>
          </dl>
        </div>
      </c:forEach>
    </div>
  </div>

  <!-- CERTIFICATIONS -->
  <div>
    <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">px-2 h-[28px]</sec:authorize>">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
        <c:url value="/edit/editCertificationsAdherent" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
      </sec:authorize>
      <spring:message code="label.certifications"/>
    </div>
    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg sm:divide-y sm:divide-gray-300">
      <c:forEach items="${certifications}" var="certification">
        <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
          <dl>
            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4">
              <dt class="label">${certification.libelle} :</dt>
              <c:choose>
                <c:when test="${certificationsAdherentId.contains(certification.id)}">
                  <dd class="value text-sky-600 font-bold"><spring:message code="yes"/></dd>
                </c:when>
                <c:otherwise>
                  <dd class="value">
                    <spring:message code="no"/>
                  </dd>
                </c:otherwise>
              </c:choose>
            </div>
          </dl>
        </div>
      </c:forEach>
    </div>
  </div>
</div>
    
<!-- DESCRIPTION ENTREPRISE & ACTIVITÉ -->
<div class="bg-neutral-200 overflow-hidden shadow rounded-lg sm:divide-y sm:divide-gray-300 mt-4">
  <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
    <dl>
      <div class="py-3 sm:grid sm:grid-cols-5 sm:gap-4 sm:px-2 items-center">
        <dt class="label">
          <spring:message code="label.description_entreprise"/> :
        </dt>
        <div class="sm:col-span-4">
          <dd class="value overflow-visible whitespace-normal">
            ${adherent.description_entreprise}
          </dd>
        </div>
      </div>
    </dl>
  </div> 
  <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
    <dl>
      <div class="py-3 sm:grid sm:grid-cols-5 sm:gap-4 sm:px-2 items-center">
        <dt class="label">
          <spring:message code="label.description_activite"/> :
        </dt>
        <div class="sm:col-span-4">
          <dd class="value overflow-visible whitespace-normal">
            ${adherent.description_activite}
          </dd>
        </div>
      </div>
    </dl>
  </div>
</div>

<!-- TAGS -->
<div class="mt-5">
  <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">px-2 h-[28px]</sec:authorize>">
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
      <c:url value="/edit/editSpecialitesAdherent" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
      <a href="${url}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
        </svg>
      </a>
    </sec:authorize>     
    <spring:message code="label.tags"/>
  </div>
  <div class="bg-neutral-200 overflow-hidden shadow rounded-lg sm:divide-y sm:divide-gray-300">
    <c:choose>
      <c:when test="${empty specialitesOfAdherent}">
        <dt class="text-gray-400 px-5 py-3">Aucun tag défini.</dt>
      </c:when>
      <c:otherwise>
        <c:forEach items="${specialitesOfAdherent}" var="speOfAdh" varStatus="status">
          <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
            <dl>
              <div class="text-sm grid grid-cols-12 gap-4 items-center py-3 px-1">
                <dt class="font-medium text-gray-500 text-right">${status.index+1} :</dt>
                <dd class="col-span-11 text-gray-400">
                  <span class="font-medium mr-3">${speOfAdh.libelle}</span>(${speOfAdh.travaux.libelle})
                </dd>
              </div>
            </dl>
          </div>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </div>
</div> 

<!-- ACTUALITÉS -->
