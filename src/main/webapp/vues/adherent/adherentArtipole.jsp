<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="showAdherent">
    <%--    <div>--%>
    <%--        <c:url value="/listeAdherents" var="urlReturn"/>--%>
    <%--        <input class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button" class="action-button" onclick="window.location.href='${urlReturn}'"--%>
    <%--               value="<spring:message code="label.retourListe"/>">--%>
    <%--    </div>--%>

    <div class="flex justify-center">
        <div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
            <div>
                <c:choose>
                    <c:when test="${adherent.photoImg == ''}">
                        <img class="rounded-full w-32" src="<c:url value="/resources/images/noAdh.png"/>"/>
                    </c:when>
                    <c:otherwise>
                        <img class="rounded-full" src="${adherent.photoImg}">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="flex flex-col">
                <div class="text-center text-lg font-semibold">
                    ${adherent.denomination}
                </div>
                <div class="text-center text-sm">
                    <spring:message code="label.codeAdh"/> :
                    ${adherent.code}
                </div>
            </div>
        </div>
    </div>


    <fieldset class="p-2">
        <div class="flex justify-center mt-6 mb-2 text-xl underline">
            <legend class="gap-2 flex"><spring:message code="label.artipole"/>
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE_EDIT')">
                    <div class="flex justify-center">
                        <c:url value="/edit/editArtipoleAdh" var="url"><c:param name="idAdh"
                                                                                value="${adherent.id}"/></c:url>
                        <span><a href="${url}"><svg class="w-6 h-6" fill="none" stroke="currentColor"
                                                    viewBox="0 0 24 24"
                                                    xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round"
                                                                                             stroke-linejoin="round"
                                                                                             stroke-width="2"
                                                                                             d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg></a></span>
                        </a></span>
                    </div>
                </sec:authorize>
            </legend>
        </div>

        <div class="flex justify-center">
            <div>
                <div>
                    <div class="flex gap-1">
                        <span class="detailLabel"><spring:message code="label.adhArtipole"/></span>
                        <div>:</div>
                        <span class="data">
						<c:choose>
                            <c:when test="${adherent.isArtipole}"><spring:message code="yes"/></c:when>
                            <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
					</span>
                    </div>

                    <div class="flex gap-1">
                        <span class="detailLabel"><spring:message code="label.charteArtipole"/></span>
                        <div>:</div>
                        <span class="data">
						<c:choose>
                            <c:when test="${adherent.isCharteArtipole}"><spring:message code="yes"/></c:when>
                            <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
					</span>
                    </div>
                    <div class="flex gap-1">
                        <span class="detailLabel"><spring:message code="label.adhArtipole"/></span>
                        <div>:</div>
                        <span class="data">
						<c:choose>
                            <c:when test="${adherent.isArtipole}"><spring:message code="yes"/></c:when>
                            <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
					</span>
                    </div>

                    <div class="flex gap-1">
                        <span class="detailLabel"><spring:message code="label.charteArtipole"/></span>
                        <div>:</div>
                        <span class="data">
						<c:choose>
                            <c:when test="${adherent.isCharteArtipole}"><spring:message code="yes"/></c:when>
                            <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
					</span>
                    </div>
                </div>
                <div>
                    <div class="flex gap-1">
                        <span class="detailLabel"><spring:message code="label.flocageArtipole"/></span>
                        <div>:</div>
                        <span class="data"><c:choose>
                            <c:when test="${adherent.isFlocageArtipole}"><spring:message code="yes"/></c:when>
                            <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
					</span>
                    </div>

                    <div class="flex gap-1">
                        <span class="detailLabel"><spring:message code="label.siteArtipole"/></span>
                        <div>:</div>
                        <span class="data"><c:choose>
                            <c:when test="${adherent.isWebArtipole}"><spring:message code="yes"/></c:when>
                            <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
					</span>
                    </div>

                    <div class="flex gap-1">
                        <span class="detailLabel"><spring:message code="label.facebookArtipole"/></span>
                        <div>:</div>
                        <span class="data"><c:choose>
                            <c:when test="${adherent.isFacebookArtipole}"><spring:message code="yes"/></c:when>
                            <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
					</span>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>

    <%--    <fieldset class="showCommentaire">--%>
    <%--        <legend class="legend"><spring:message code="label.commentaire"/></legend>--%>
    <%--        <span class="data">${commentaire}</span>--%>
    <%--    </fieldset>--%>
</div>
