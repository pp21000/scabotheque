<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div>
  <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">px-2 h-[28px]</sec:authorize>">
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE_EDIT')">
       <c:url value="/edit/editActiviteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
      <a href="${url}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
        </svg>
      </a>
    </sec:authorize>        
  </div>

  <div class="showDetailCommerceTitre grid grid-cols-5 bg-gray-200 dark:bg-gray-800 px-16 py-2 rounded-t-lg">
      <span class="col-span-2"></span>
      <span class="flex justify-center">Pourcentage</span>
      <div class="col-span-2 grid grid-cols-4 text-right">
          <span>Achat N</span>
          <span>N-1</span>
          <span>N-2</span>
          <span>N-3</span>
      </div>
  </div>

  <div id="accordion-arrow-icon" data-accordion="open" class="bg-gray-200 dark:bg-gray-800 rounded-b-lg">
    <h1>
        <button class="flex items-center justify-between w-full p-5 font-medium text-gray-200 bg-gray-400 dark:bg-gray-900 hover:bg-gray-500 dark:hover:bg-gray-950"
                data-accordion-target="#accordion-year" aria-expanded="false"
                aria-controls="accordion-arrow-icon-body-3" 
                onclick="toggleTab(this, '#accordion-year')">
            <span>Année</span>
            <svg class="w-6 h-6 shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                      clip-rule="evenodd"></path>
            </svg>
        </button>
    </h1>
    <div id="accordion-year" class="hidden" aria-labelledby="accordion-arrow-icon-heading-3">
        <div id="yearTable" class="px-16 py-4">
            <c:forEach items="${adhActivites}" var="adhActivites">
            <span class="grid grid-cols-5">
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
                <div class="col-span-2 grid grid-cols-4 text-right">
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
    <h1>
        <button class="flex items-center justify-between w-full p-5 font-medium text-gray-200 bg-gray-400 dark:bg-gray-900 hover:bg-gray-500 dark:hover:bg-gray-950 border-t border-gray-100 dark:border-gray-700"
                data-accordion-target="#accordion-today" aria-expanded="false"
                aria-controls="accordion-arrow-icon-body-3" 
                onclick="toggleTab(this, '#accordion-today')">
            <span>À aujourd'hui</span>
            <svg class="w-6 h-6 shrink-0" fill="currentColor" viewBox="0 0 20 20"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                      clip-rule="evenodd"></path>
            </svg>
        </button>
    </h1>
    <div id="accordion-today" class="hidden" aria-labelledby="accordion-arrow-icon-heading-3">
        <div id="atDateTable" class="px-16 py-4">
            <c:forEach items="${adhActivites}" var="adhActivites">
            <span class="grid grid-cols-5">
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
                <div class="col-span-2 grid grid-cols-4 text-right">
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
 
function toggleTab(tabHeading, tabBody) {
  $(tabBody).slideToggle(300, function() {
    $(tabHeading).removeClass('bg-gray-100');
  });
}

  
</script>

