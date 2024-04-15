<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<aside class="w-60 fixed" aria-label="Sidebar">
    <div class="overflow-y-auto flex flex-col justify-between py-4 px-3 bg-zinc-200 min-h-screen bg-gray-50 dark:text-gray-50 dark:bg-gray-800">
        <ul class="space-y-2">

            <li class="flex justify-center text-xl px-1 py-5 mt-12 text-gray-600 font-medium w-full border-b border-gray-500">Logistique</li>

            <li>
                <a href="<c:url value="/dashboard"/>"
                   class="<c:choose><c:when test = "${pageType == 'DASHBOARD'}">bg-green-600 hover:bg-green-700 text-white </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
                    <svg aria-hidden="true"
                         class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
                         fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                        <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                    </svg>
                    <span class="ml-2 whitespace-nowrap">Dashboard</span>
                </a>
            </li>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_EXPLOITATION')">
            <c:url value="/ordreTournee" var="urlOrdreTournee"/>
            <li>
              <a href="<c:url value="/ordreTournee"/>"
                   class="<c:choose><c:when test = "${pageType == 'LOGISTIQUE_TOURNEE'}">bg-green-600 hover:bg-green-700 text-white </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
                    <svg aria-hidden="true"
                         class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
                         fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
                    </svg>
                    <span class="ml-2 whitespace-nowrap"><spring:message code="menu.gestionTournee"/></span>
                </a>
            </li>
        </ul>
        <ul class="mb-20 flex flex-col">
            </sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_EXPLOITATION')">
                <li>
                    <a href="../scabotheque/listeCamions"
                       class="<c:choose><c:when test = "${pageType == 'LISTE_CAMIONS'}">bg-green-600 hover:bg-green-700 text-white </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
                        <svg aria-hidden="true"
                             class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
                        </svg>
                        <span class="ml-2 whitespace-nowrap">Liste des camions</span>
                    </a>
                </li>
            </sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_EXPLOITATION')">
                <li>
                  <a href="<c:url value="/listeConducteurs"/>"
                       class="<c:choose><c:when test = "${pageType == 'LISTE_CONDUCTEURS'}">bg-green-600 hover:bg-green-700 text-white </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
                        <svg aria-hidden="true"
                             class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
                        </svg>
                        <span class="ml-2 whitespace-nowrap">Liste des conducteurs</span>
                    </a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</aside>


