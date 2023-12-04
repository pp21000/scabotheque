<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="showAdherent">
    <div class="flex justify-center">
        <div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
            <div>
                <c:choose>
                    <c:when test="${adherent.photoImg == ''}">
                        <img class="rounded-full h-32 w-32" src="<c:url value="/resources/images/noAdh.png" />"/>
                    </c:when>
                    <c:otherwise>
                        <img class="rounded-full h-32 w-32" src="${adherent.photoImg}">
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

    <fieldset class="text-center">
        <legend class="legend underline text-centert"><spring:message code="label.activite"/></legend>
        <div class="showDetailAdherent">
            <span class="detailLabel"><spring:message code="label.pole"/> :</span>
            <span class="data">${adherent.pole.libelle}</span>
        </div>
    </fieldset>
</div>
<div class="flex justify-center">
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">
    <div class="editIcone">
        <c:url value="/edit/editActiviteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <span>
                    <a href="${url}"><svg class="w-8 h-8" fill="none" stroke="currentColor" stroke-width="1.5"
                                          viewBox="0 0 24 24"
                                          xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                  d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10"></path>
                                    </svg>
                    </a>
                </span>
    </div>
</sec:authorize></div>
<div class="showDetailCommerceTitre grid grid-cols-10 mb-4">
    <span class="col-span-2"></span>
    <span class="flex justify-center">%tage</span>
    <div class="col-span-2 grid grid-cols-4">
        <span>Achat N</span>
        <span>N-1</span>
        <span>N-2</span>
        <span>N-3</span>
    </div>
</div>
<div id="accordion-arrow-icon" data-accordion="open">
    <h2>
        <button type="button"
                class="flex items-center justify-between w-full p-5 font-medium text-left text-gray-500 border border-gray-200 focus:ring-4 focus:ring-gray-200hover:bg-gray-100"
                data-accordion-target="#accordion-year" aria-expanded="false"
                aria-controls="accordion-arrow-icon-body-3">
            <span>Année</span>
            <svg class="w-6 h-6 shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                      clip-rule="evenodd"></path>
            </svg>
        </button>
    </h2>
    <div id="accordion-year" class="hidden" aria-labelledby="accordion-arrow-icon-heading-3">
        <div class="p-5 font-light border border-t-0 border-gray-200">
            <div id="yearTable" class="border border-neutral-300 p-4 mb-4">
                <c:forEach items="${adhActivites}" var="adhActivites">
                    <span class="grid grid-cols-10">
                        <div class="col-span-2">
                            <c:choose>
                                <c:when test="${adhActivites.achatDateN != null}">
                                    <span class="dataLabel">${adhActivites.activite.libelle}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="dataLabel">Total</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="flex justify-center">
                            <c:choose>
                                <c:when test="${adhActivites.achatDateN != null}">
                                    <span class="dataTableNumeric">${adhActivites.pourcentage} %</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="dataTableNumeric  dataTable"></span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-span-2 grid grid-cols-4">
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">
                                <span class="dataTableNumeric dataTable">
                                    <c:choose>
                                        <c:when test="${adhActivites.achatN != null}">
                                            <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatN}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalN}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                                <span class="dataTableNumeric">
                                    <c:choose>
                                        <c:when test="${adhActivites.achatN1 != null}">
                                            <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatN1}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalN1}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                                <span class="dataTableNumeric">
                                    <c:choose>
                                        <c:when test="${adhActivites.achatN2 != null}">
                                            <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatN2}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalN2}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                                <span class="dataTableNumeric">
                                    <c:choose>
                                        <c:when test="${adhActivites.achatN3 != null}">
                                            <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatN3}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalN3}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </sec:authorize>
                        </div>
<%--                        <span class="data">${adhActivites.commentaire}</span>--%>
                    </span>
                </c:forEach>
            </div>
        </div>
    </div>
    <h2>
        <button type="button"
                class="flex items-center justify-between w-full p-5 font-medium text-left text-gray-500 border border-gray-200 focus:ring-4 focus:ring-gray-200 hover:bg-gray-100"
                data-accordion-target="#accordion-today" aria-expanded="false"
                aria-controls="accordion-arrow-icon-body-3">
            <span>À aujourd'hui</span>
            <svg class="w-6 h-6 shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                      clip-rule="evenodd"></path>
            </svg>
        </button>
    </h2>
    <div id="accordion-today" class="hidden" aria-labelledby="accordion-arrow-icon-heading-3">
        <div class="p-5 font-light border border-t-0 border-gray-200">
            <div id="atDateTable" class="border border-neutral-300 p-4">
                <c:forEach items="${adhActivites}" var="adhActivites">
                    <span class="grid grid-cols-10">
                        <div class="col-span-2">
                        <c:choose>
                            <c:when test="${adhActivites.achatDateN != null}">
                                <span class="dataLabel">${adhActivites.activite.libelle}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="dataLabel">Total</span>
                            </c:otherwise>
                        </c:choose>
                        </div>
                        <div class="flex justify-center">
                        <c:choose>
                            <c:when test="${adhActivites.achatDateN != null}">
                                <span class="dataTableNumeric">${adhActivites.pourcentage} %</span>
                            </c:when>
                            <c:otherwise>
                                <span class="dataTableNumeric"></span>
                            </c:otherwise>
                        </c:choose>
                        </div>
                        <div class="col-span-2 grid grid-cols-4">
                        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test="${adhActivites.achatDateN != null}">
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatDateN}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalDateN}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test="${adhActivites.achatDateN1 != null}">
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatDateN1}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalDateN1}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test="${adhActivites.achatDateN2 != null}">
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatDateN2}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalDateN2}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <span class="dataTableNumeric">
                                <c:choose>
                                    <c:when test="${adhActivites.achatDateN3 != null}">
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.achatDateN3}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber pattern="#,##0.00" value="${adhActivites.totalDateN3}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </sec:authorize>
                        </div>
                        <span class="data">${adhActivites.commentaire}</span>
                    </span>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


<script>
    $(function () {
        $('#yearTableRB').click(function (e) {
            $("#yearTable").toggle();
            $("#atDateTable").toggle();
        });
        $('#atDateTableRB').click(function (e) {
            $("#yearTable").toggle();
            $("#atDateTable").toggle();
        });
    });
</script>
