<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div>
    <fieldset>
        <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE_EDIT')">px-2 h-[28px]</sec:authorize>">
          <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE_EDIT')">
            <c:url value="/edit/editInformatiqueAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
            <a href="${url}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
              </svg>
            </a>
          </sec:authorize>   
          <spring:message code="label.modifGeneral"/>
        </div>

        <div class="text-center">
            <div>
                <!--                <div class="showDetailAdherent">
                    <span class="adherentLabel"> Identifiant EOLAS</span>
                    <span class="data" > ${informatique.loginEOLAS} </span>
                </div>-->
                <div class="showDetailAdherent">
                    <span class="detailLabel"> Identifiant DFIWEB</span>
                    <span class="data"> ${informatique.loginDFIWEB} </span>
                </div>
                <div class="showDetailAdherent">
                    <span class="detailLabel"> Identifiant ORCAB Electro</span>
                    <span class="data">${informatique.loginOrcabElectro}</span>
                </div>
                <!--                <div  class="showDetailAdherent">
                    <span class="adherentLabel"><spring:message code="label.denomination"/></span>
                    <span class="data">${adherent.denomination}</span>
                </div>-->
            </div>
        </div>
    </fieldset>

<%--    <fieldset class="text-center">--%>
<%--        <legend class="legend"><spring:message code="label.accessEOLAS"/></legend>--%>
<%--        <div class="flex justify-start mb-2">--%>
<%--            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE_EDIT')">--%>
<%--                <div class="rounded hover:bg-gray-300 p-1">--%>
<%--                    <c:url value="/edit/editAdherentContact" var="url"><c:param name="idAdh"--%>
<%--                                                                                value="${adherent.id}"/></c:url>--%>
<%--                    <span><a href="${url}"><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"--%>
<%--                                                xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round"--%>
<%--                                                                                         stroke-linejoin="round"--%>
<%--                                                                                         stroke-width="2"--%>
<%--                                                                                         d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg></a></span>--%>
<%--                </div>--%>
<%--            </sec:authorize>--%>
<%--        </div>--%>
<%--        <span class="data">En plus du compt paramétré avec les infirmations Rubis, l'accés à EOLAS pour les employés ce fait par la gestion des contacts.</span>--%>
<%--        <div class="colonnesDouble">--%>
<%--            <c:forEach items="${contacts}" var="contact">--%>
<%--                <div style="display: grid; grid-template-columns: 10em 15em 1fr; margin:0.5em; border: 1px #ccc solid; padding: 0.5em; border-radius: 0.4em;">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${contact.photoImg == ''}">--%>
<%--                            <img style="max-width: 8em; max-height: 8em; margin: auto;"--%>
<%--                                 src="<c:url value="/resources/images/noAdh.png"/>"/>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <img style="max-width: 8em; max-height: 8em; margin: auto;" src="${contact.photoImg}"--%>
<%--                                 class="max-w-xl">--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>

<%--                    <div style="display: grid;">--%>
<%--                        <span class="textbold">${contact.civilite} ${contact.nom} ${contact.prenom}</span>--%>
<%--                        <span>${contact.fonction.libelle}</span>--%>
<%--                        <span>${contact.mail}</span>--%>
<%--                        <span>${contact.fixe}</span>--%>
<%--                        <span>${contact.mobile}</span>--%>

<%--                    </div>--%>

<%--                    <div style="display: grid;">--%>
<%--                        <span>--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${contact.isAccessEOLAS}">--%>
<%--                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"--%>
<%--                                         xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round"--%>
<%--                                                                                  stroke-linejoin="round"--%>
<%--                                                                                  stroke-width="2"--%>
<%--                                                                                  d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"--%>
<%--                                         xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round"--%>
<%--                                                                                  stroke-linejoin="round"--%>
<%--                                                                                  stroke-width="2"--%>
<%--                                                                                  d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
<%--                            <span class="error-message"><spring:message code="label.accessEOLAS"/></span>--%>
<%--                        </span>--%>

<%--                        <span><spring:message code="label.login"/>${contact.loginEOLAS}</span>--%>
<%--                        <span><spring:message code="label.pass"/>${contact.passEOLAS}</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </fieldset>--%>
</div>