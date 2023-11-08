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
  <div class="grid grid-cols-2">
    
    <div>
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
        <div class="flex justify-start mb-2">
          <div class="rounded hover:bg-gray-300 p-1">
            <c:url value="/edit/editArtipoleAdh" var="url">
              <c:param name="idAdh" value="${adherent.id}"/>
            </c:url>
            <span>
              <a href="${url}">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                </svg>
              </a>
            </span>
          </div>
        </div>
      </sec:authorize>
      <div class="bg-white m-2 overflow-hidden shadow rounded-lg">
        <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
          <dl class="sm:divide-y sm:divide-gray-200">
            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.adhArtipole"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">            
                <c:choose>
                  <c:when test="${adherent.isArtipole}"><spring:message code="yes"/></c:when>
                  <c:otherwise><spring:message code="no"/></c:otherwise>
                </c:choose>
              </dd>
            </div>

            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.charteArtipole"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                <c:choose>
                  <c:when test="${adherent.isCharteArtipole}"><spring:message code="yes"/></c:when>
                  <c:otherwise><spring:message code="no"/></c:otherwise>
                </c:choose>
              </dd>
            </div>

            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.flocageArtipole"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                <c:choose>
                  <c:when test="${adherent.isFlocageArtipole}"><spring:message code="yes"/></c:when>
                  <c:otherwise><spring:message code="no"/></c:otherwise>
                </c:choose>
              </dd>
            </div>

            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.siteArtipole"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                <c:choose>
                  <c:when test="${adherent.isWebArtipole}"><spring:message code="yes"/></c:when>
                  <c:otherwise><spring:message code="no"/></c:otherwise>
                </c:choose>
              </dd>
            </div>

            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.facebookArtipole"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                <c:choose>
                  <c:when test="${adherent.isFacebookArtipole}"><spring:message code="yes"/></c:when>
                  <c:otherwise><spring:message code="no"/></c:otherwise>
                </c:choose>
              </dd>
            </div>


            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.siteWeb"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                ${adherent.siteWeb}
              </dd>
            </div>

            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.facebook"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                ${adherent.facebook}
              </dd>
            </div>

            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.instagram"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                ${adherent.instagram}
              </dd>
            </div>

            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.linkedin"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                ${adherent.linkedin}
              </dd>
            </div>

            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.youtube"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                ${adherent.youtube}
              </dd>
            </div>

            <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500 text-right">
                <spring:message code="label.pinterest"/>
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                ${adherent.pinterest}
              </dd>
            </div>
          </dl>
        </div>
      </div>
    </div>
              
    <div>
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
        <div class="flex justify-start mb-2">
          <div class="rounded hover:bg-gray-300 p-1">
            <c:url value="/edit/editMetiersAdherent" var="url">
              <c:param name="idAdh" value="${adherent.id}"/>
            </c:url>
            <span>
              <a href="${url}">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                </svg>
              </a>
            </span>
          </div>
        </div>
      </sec:authorize>

      <div class="bg-white m-2 overflow-hidden shadow rounded-lg">
        <c:forEach items="${metiers}" var="metier">
          <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
            <dl class="sm:divide-y sm:divide-gray-200">
              <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                <dt class="text-sm font-medium text-gray-500 text-right">${metier.libelle}</dt>
                <c:choose>
                  <c:when test="${metiersAdherentId.contains(metier.id)}">
                    <dd class="mt-1 text-sm sm:mt-0 sm:col-span-2 text-sky-600 font-bold"><spring:message code="yes"/></dd>
                  </c:when>
                  <c:otherwise>
                    <dd class="mt-1 text-sm sm:mt-0 sm:col-span-2 text-gray-400"><spring:message code="no"/></dd>
                  </c:otherwise>
                </c:choose>
              </div>
            </dl>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>

  <div class="">
    <div class="bg-white m-2 overflow-hidden shadow rounded-lg">
      <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
        <dl class="sm:divide-y sm:divide-gray-200">
          <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
            <dt class="text-sm font-medium text-gray-500 text-right">
              <spring:message code="label.description_entreprise"/>
            </dt>
            <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
              ${adherent.description_entreprise}
            </dd>
          </div>
        </dl>
      </div>
    </div>
  </div>

  <div class="">
    <div class="bg-white m-2 overflow-hidden shadow rounded-lg">
      <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
        <dl class="sm:divide-y sm:divide-gray-200">
          <div class="py-3 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
            <dt class="text-sm font-medium text-gray-500 text-right">
              <spring:message code="label.description_activite"/>
            </dt>
            <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
              ${adherent.description_activite}
            </dd>
          </div>
        </dl>
      </div>
    </div>
  </div>

</div>