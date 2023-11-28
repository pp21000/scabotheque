<%--
  Created by IntelliJ IDEA.
  User: ludovic.spina
  Date: 17/02/2023
  Time: 09:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div>
  <div class="grid grid-cols-2 gap-4">
    
    <div>
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
        <div class="flex items-center mb-1">
          <c:url value="/edit/editArtipoleAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
          <a href="${url}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
            </svg>
          </a>
          <spring:message code="label.modifGeneral"/>
        </div>
      </sec:authorize>
      
      
      <div class="bg-neutral-200 overflow-hidden shadow rounded-lg">
        <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
          <dl class="sm:divide-y sm:divide-gray-300">
            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.adhArtipole"/> :
              </dt>
              <c:choose>
                <c:when test="${adherent.isArtipole}">
                  <dd class="text-sm text-sky-600 font-bold"><spring:message code="yes"/></dd>
                </c:when>
                <c:otherwise>
                  <dd class="text-sm text-gray-400"><spring:message code="no"/></dd>
                </c:otherwise>
              </c:choose>
            </div>              
              
            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.charteArtipole"/> :
              </dt>
              <c:choose>
                <c:when test="${adherent.isCharteArtipole}">
                  <dd class="text-sm text-sky-600 font-bold"><spring:message code="yes"/></dd>
                </c:when>
                <c:otherwise>
                  <dd class="text-sm text-gray-400"><spring:message code="no"/></dd>
                </c:otherwise>
              </c:choose>
            </div>

            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.flocageArtipole"/> :
              </dt>
              <c:choose>
                <c:when test="${adherent.isFlocageArtipole}">
                  <dd class="text-sm text-sky-600 font-bold"><spring:message code="yes"/></dd>
                </c:when>
                <c:otherwise>
                  <dd class="text-sm text-gray-400"><spring:message code="no"/></dd>
                </c:otherwise>
              </c:choose>
            </div>

            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.siteArtipole"/> :
              </dt>
              <c:choose>
                <c:when test="${adherent.isWebArtipole}">
                  <dd class="text-sm text-sky-600 font-bold"><spring:message code="yes"/></dd>
                </c:when>
                <c:otherwise>
                  <dd class="text-sm text-gray-400"><spring:message code="no"/></dd>
                </c:otherwise>
              </c:choose>
            </div>

            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.facebookArtipole"/> :
              </dt>
              <c:choose>
                <c:when test="${adherent.isFacebookArtipole}">
                  <dd class="text-sm text-sky-600 font-bold"><spring:message code="yes"/></dd>
                </c:when>
                <c:otherwise>
                  <dd class="text-sm text-gray-400"><spring:message code="no"/></dd>
                </c:otherwise>
              </c:choose>
            </div>


            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.siteWeb"/> :
              </dt>
              <dd class="text-sm text-gray-400">
                ${adherent.siteWeb}
              </dd>
            </div>

            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.facebook"/> :
              </dt>
              <dd class="text-sm text-gray-400">
                ${adherent.facebook}
              </dd>
            </div>

            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.instagram"/> :
              </dt>
              <dd class="text-sm text-gray-400">
                ${adherent.instagram}
              </dd>
            </div>

            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.linkedin"/> :
              </dt>
              <dd class="text-sm text-gray-400">
                ${adherent.linkedin}
              </dd>
            </div>

            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.youtube"/> :
              </dt>
              <dd class="text-sm text-gray-400">
                ${adherent.youtube}
              </dd>
            </div>

            <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2 items-center">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.pinterest"/> :
              </dt>
              <dd class="text-sm text-gray-400">
                ${adherent.pinterest}
              </dd>
            </div>
          </dl>
        </div>
      </div>
    </div>
              
    <div>
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
        <div class="flex items-center mb-1">
          <c:url value="/edit/editMetiersAdherent" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
          <a href="${url}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
            </svg>
          </a>
          <spring:message code="label.metiers"/>
        </div>
      </sec:authorize>

      <div class="bg-neutral-200 overflow-hidden shadow rounded-lg sm:divide-y sm:divide-gray-300">
        <c:forEach items="${metiers}" var="metier">
          <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
            <dl>
              <div class="py-3 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-2">
                <dt class="text-sm font-medium text-gray-500 text-right">${metier.libelle} :</dt>
                <c:choose>
                  <c:when test="${metiersAdherentId.contains(metier.id)}">
                    <dd class="text-sm text-sky-600 font-bold"><spring:message code="yes"/></dd>
                  </c:when>
                  <c:otherwise>
                    <dd class="text-sm text-gray-400"><spring:message code="no"/></dd>
                  </c:otherwise>
                </c:choose>
              </div>
            </dl>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>             

  <div class="bg-neutral-200 overflow-hidden shadow rounded-lg sm:divide-y sm:divide-gray-300 mt-4">
    <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
      <dl>
        <div class="py-3 sm:grid sm:grid-cols-5 sm:gap-4 sm:px-2 items-center">
          <dt class="text-sm font-medium text-gray-500 text-right">
            <spring:message code="label.description_entreprise"/> :
          </dt>
          <dd class="text-sm text-gray-400 sm:mt-0 sm:col-span-4">
            ${adherent.description_entreprise}
          </dd>
        </div>
      </dl>
    </div> 
    <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
      <dl>
        <div class="py-3 sm:grid sm:grid-cols-5 sm:gap-4 sm:px-2 items-center">
          <dt class="text-sm font-medium text-gray-500 text-right">
            <spring:message code="label.description_activite"/> :
          </dt>
          <dd class="text-sm text-gray-400 sm:mt-0 sm:col-span-4">
            ${adherent.description_activite}
          </dd>
        </div>
      </dl>
    </div>
  </div>

  <div class="mt-5">
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
      <div class="flex items-center mb-1">
        <c:url value="/edit/editSpecialitesAdherent" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
          </svg>
        </a>
        <spring:message code="label.tags"/>
      </div>
    </sec:authorize>     
    
    
    <div class="bg-neutral-200 overflow-hidden shadow rounded-lg sm:divide-y sm:divide-gray-300">
      <c:forEach items="${specialitesOfAdherent}" var="speOfAdh" varStatus="status">
        <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
          <dl>
            <div class="text-sm sm:grid sm:grid-cols-12 sm:gap-4 items-center py-3 sm:py-3 sm:px-1">
              <dt class="font-medium text-gray-500 text-right">${status.index+1} :</dt>
              <dd class="sm:mt-0 sm:col-span-11 text-gray-400">
                ${speOfAdh.libelle}  (${speOfAdh.travaux.libelle})
              </dd>
            </div>
          </dl>
        </div>
      </c:forEach>
    </div>
  </div> 
            
</div>