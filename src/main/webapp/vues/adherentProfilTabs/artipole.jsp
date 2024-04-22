<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
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
        <div class="p-2 grid grid-cols-2 gap-3 bg-green-200<c:if test="${not adherent.isArtipole}"> bg-red-200</c:if>">
          <dt class="label">
            <spring:message code="label.isArtipole"/> :
          </dt>
          <c:choose>
            <c:when test="${adherent.isArtipole}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
            <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
          </c:choose>
        </div>              

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.charteArtipole"/> :
          </dt>
          <c:choose>
            <c:when test="${adherent.isCharteArtipole}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
            <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
          </c:choose>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.flocageArtipole"/> :
          </dt>
          <c:choose>
            <c:when test="${adherent.isFlocageArtipole}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
            <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
          </c:choose>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.siteArtipole"/> :
          </dt>
          <c:choose>
            <c:when test="${adherent.isWebArtipole}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
            <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
          </c:choose>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.facebookArtipole"/> :
          </dt>
          <c:choose>
            <c:when test="${adherent.isFacebookArtipole}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
            <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
          </c:choose>
        </div>


        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.siteWeb"/> :
          </dt>
          <dd class="value">
            <c:url value="${adherent.siteWeb}" var="urlSiteWeb"></c:url>
            <a href="${urlSiteWeb}" class="text-blue-700 font-normal hover:underline">${adherent.siteWeb}</a>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.facebook"/> :
          </dt>
          <dd class="value">
            <c:url value="${adherent.facebook}" var="urlFacebook"></c:url>
            <a href="${urlFacebook}" class="text-blue-700 font-normal hover:underline">${adherent.facebook}</a>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.instagram"/> :
          </dt>
          <dd class="value">
            <c:url value="${adherent.instagram}" var="urlInstagram"></c:url>
            <a href="${urlInstagram}" class="text-blue-700 font-normal hover:underline">${adherent.instagram}</a>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.linkedin"/> :
          </dt>
          <dd class="value">
            <c:url value="${adherent.linkedin}" var="urlLinkedin"></c:url>
            <a href="${urlLinkedin}" class="text-blue-700 font-normal hover:underline">${adherent.linkedin}</a>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.youtube"/> :
          </dt>
          <dd class="value">
            <c:url value="${adherent.youtube}" var="urlYoutube"></c:url>
            <a href="${urlYoutube}" class="text-blue-700 font-normal hover:underline">${adherent.youtube}</a>
          </dd>
        </div>

        <div class="p-2 grid grid-cols-2 gap-3">
          <dt class="label">
            <spring:message code="label.pinterest"/> :
          </dt>
          <dd class="value">
            <c:url value="${adherent.pinterest}" var="urlPinterest"></c:url>
            <a href="${urlPinterest}" class="text-blue-700 font-normal hover:underline">${adherent.pinterest}</a>          
          </dd>
        </div>
      </dl>
    </div>
  </div>

  <!-- MÉTIERS -->          
  <div>
    <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">px-2 h-[28px]</sec:authorize>">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
        <c:url value="/edit/editMetiersAdherent" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
      </sec:authorize>
      <spring:message code="label.metiers"/>
    </div>
    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
      <dl class="divide-y divide-gray-300 text-sm">
        <c:forEach items="${metiers}" var="metier">
          <div class="p-2 grid grid-cols-2 gap-3">
            <dt class="label">${metier.libelle} :</dt>
            <c:choose>
              <c:when test="${metiersAdherentId.contains(metier.id)}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
              <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
            </c:choose>
          </div>
        </c:forEach>
      </dl>
    </div>
  </div>

  <!-- CERTIFICATIONS -->
  <div>
    <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">px-2 h-[28px]</sec:authorize>">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
        <c:url value="/edit/editCertificationsAdherent" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
      </sec:authorize>
      <spring:message code="label.certifications"/>
    </div>
    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
      <dl class="divide-y divide-gray-300 text-sm">
        <c:forEach items="${certifications}" var="certification">
          <div class="p-2 grid grid-cols-2 gap-3">
            <dt class="label">${certification.libelle} :</dt>
            <c:choose>
              <c:when test="${certificationsAdherentId.contains(certification.id)}"><dd class="value text-green-600"><spring:message code="yes"/></dd></c:when>
              <c:otherwise><dd class="value text-red-600"><spring:message code="no"/></dd></c:otherwise>
            </c:choose>
          </div>
        </c:forEach>
      </dl>
    </div>
  </div>
</div>
    
<!-- DESCRIPTION ENTREPRISE & ACTIVITÉ -->
<div class="bg-neutral-200 overflow-hidden shadow rounded-lg mt-4">
  <dl class="divide-y divide-gray-300 text-sm">
    <div class="py-3 grid grid-cols-9 gap-4 px-2 items-center">
      <dt class="label text-center whitespace-normal">
        <spring:message code="label.description_entreprise"/> :
      </dt>
      <div class="sm:col-span-8">
        <dd class="value overflow-visible whitespace-normal">
          ${adherent.description_entreprise}
        </dd>
      </div>
    </div>
    <div class="py-3 grid grid-cols-9 gap-4 px-2 items-center">
      <dt class="label text-center whitespace-normal">
        <spring:message code="label.description_activite"/> :
      </dt>
      <div class="sm:col-span-8">
        <dd class="value overflow-visible whitespace-normal">
          ${adherent.description_activite}
        </dd>
      </div>
    </div>
  </dl>
</div>

<!-- TAGS -->
<div class="mt-5">
  <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">px-2 h-[28px]</sec:authorize>">
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
      <c:url value="/edit/editSpecialitesAdherent" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
      <a href="${url}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
        </svg>
      </a>
    </sec:authorize>     
    <spring:message code="label.tags"/>
  </div>
  <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
    <c:choose>
      <c:when test="${empty specialitesOfAdherent}">
        <dt class="text-gray-400 px-5 py-1">Aucun</dt>
      </c:when>
      <c:otherwise>
        <dl class="divide-y divide-gray-300 text-sm">
          <c:forEach items="${specialitesOfAdherent}" var="speOfAdh" varStatus="status">
            <div class="grid grid-cols-12 gap-4 items-center p-2">
              <dt class="label text-right">${status.index+1} :</dt>
              <dd class="col-span-11 value">
                <span>${speOfAdh.libelle}</span>
                <span class="font-normal ml-3">(${speOfAdh.travaux.libelle})</span>
              </dd>
            </div>
          </c:forEach>
        </dl>
      </c:otherwise>
    </c:choose>
  </div>
</div> 

<!-- ACTUALITÉS -->
<div class="mt-5">
  <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">px-2 h-[28px]</sec:authorize>">
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
      <c:url value="AA-page-actualites" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
      <a href="${url}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
        </svg>
      </a>
    </sec:authorize>     
    <spring:message code="label.actualites"/>
  </div>
  <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
    <c:choose>
      <c:when test="${empty actualites}">
        <dt class="text-gray-400 px-5 py-1">Aucune</dt>
      </c:when>
      <c:otherwise>
        <dl class="divide-y divide-gray-300 text-sm">
          <c:forEach items="${actualites}" var="actualite" varStatus="status">
            <div class="grid grid-cols-12 gap-4 items-center p-2">
              <dd class="value col-span-4">${actualite.titre}</dd>
              <dd class="value col-span-3">${actualite.type}</dd>
              <dd class="value col-span-3">${actualite.sous_type}</dd>
              <dd class="value text-center">${actualite.position}</dd>
              <dd class="value text-center">${actualite.date_ajout}</dd>
            </div>
          </c:forEach>
        </dl>
      </c:otherwise>
    </c:choose>
  </div>
</div>
  
<!-- RÉALISATIONS -->
<div class="mt-5">
  <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">px-2 h-[28px]</sec:authorize>">
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
      <c:url value="/AA-page-realisations" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
      <a href="${url}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
        </svg>
      </a>
    </sec:authorize>     
    <spring:message code="label.realisations"/>
  </div>
  <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
    <c:choose>
      <c:when test="${empty actualites}">
        <dt class="text-gray-400 px-5 py-1">Aucune</dt>
      </c:when>
      <c:otherwise>
        <dl class="divide-y divide-gray-300 text-sm">
          <c:forEach items="${actualites}" var="actualite" varStatus="status">
            <div class="grid grid-cols-12 gap-4 items-center p-2">
              <dd class="value col-span-4">${actualite.titre}</dd>
              <dd class="value col-span-3">${actualite.type}</dd>
              <dd class="value col-span-3">${actualite.sous_type}</dd>
              <dd class="value text-center">${actualite.position}</dd>
              <dd class="value text-center">${actualite.date_ajout}</dd>
            </div>
          </c:forEach>
        </dl>
      </c:otherwise>
    </c:choose>
  </div>
</div> 