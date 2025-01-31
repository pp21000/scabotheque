<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<aside class="w-60 fixed" aria-label="Sidebar">
    <div class="overflow-y-auto py-4 px-3 bg-gray-200 min-h-screen dark:bg-gray-800">
        <ul class="space-y-2">

            <li class="flex justify-center text-xl px-1 py-5 mt-12 text-gray-600 font-medium w-full border-b border-gray-500">Accueil</li>
           
            <li>
                <a href="<c:url value="/dashboard"/>" class="<c:choose><c:when test = "${pageType == 'DASHBOARD'}">bg-green-600 hover:bg-green-700 text-white </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-700 rounded-lg dark:text-gray-50">
                    <svg aria-hidden="true"
                         class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
                         fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                        <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                    </svg>
                    <span class="ml-2 whitespace-nowrap">Dashboard</span>
                </a>
            </li>
                    
            <li>
                <a href="<c:url value="/listeAdherents"/>" class="<c:choose><c:when test = "${pageType == 'LISTE_ADHERENTS' || pageType == 'CREATE_ADHERENT' || pageType == 'ADHERENT_PROFIL'}">bg-green-600 hover:bg-green-700 text-white </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-700 rounded-lg dark:text-gray-50">
                    <svg class="w-6 h-6 text-gray-500 fill-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    <span class="ml-2 whitespace-nowrap">Adhérents</span>
                </a>
            </li>
                    
            <li>
                <a href="<c:url value="/listeContacts"/>" class="<c:choose><c:when test = "${pageType == 'LISTE_CONTACTS'}">bg-green-600 hover:bg-green-700 text-white </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-700 rounded-lg dark:text-gray-50">
                    <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 114 0v1m-4 0a2 2 0 104 0m-5 8a2 2 0 100-4 2 2 0 000 4zm0 0c1.306 0 2.417.835 2.83 2M9 14a3.001 3.001 0 00-2.83 2M15 11h3m-3 4h2"></path>
                    </svg>                    
                    <span class="ml-2 whitespace-nowrap">Contacts</span>
                </a>
            </li>

            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_EXPLOITATION')">
                <li>
                    <a href="<c:url value="/ordreTournee"/>"
                       class="<c:choose><c:when test = "${pageType == 'LOGISTIQUE_TOURNEE'}">bg-green-600 hover:bg-green-700 text-white </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-700 rounded-lg dark:text-gray-50">
                        <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z"></path>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0"></path>
                        </svg>
                        <span class="ml-2 whitespace-nowrap"><spring:message code="menu.gestionTournee"/></span>
                    </a>
                </li>
            </sec:authorize>

            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION')">
                <li>
                    <a href="<c:url value="/analyse"/>"
                       class="<c:choose><c:when test = "${pageType == 'ANALYSE'}">bg-green-600 hover:bg-green-700 text-white </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-700 rounded-lg dark:text-gray-50">
                        <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                        </svg>
                        <span class="ml-2 whitespace-nowrap"><spring:message code="menu.analyse"/></span>
                    </a>
                </li>
            </sec:authorize>

            <li>
                <button type="button"
                        class="flex items-center p-2 w-full text-base font-normal text-gray-700 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-gray-50 dark:hover:bg-gray-600"
                        aria-controls="dropdown-example" data-collapse-toggle="dropdown-example" onclick="showAddForm()">
                    <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"></path>
                    </svg>
                    <span class="ml-2 mr-0.5 whitespace-nowrap text-left" sidebar-toggle-item>Liens utiles</span>
                    <svg sidebar-toggle-item class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                              clip-rule="evenodd"></path>
                    </svg>
                </button>
              
                <ul id="dropdown-example" class="hidden py-2 space-y-2">
                    <li>
                        <a href="<c:url value="http://srvlinux/dokuwiki/doku.php?id=start"/>" target="_blank"
                           class="flex items-center p-2 pl-11 w-full text-base font-normal text-gray-700 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-gray-50 dark:hover:bg-gray-600">
                            <spring:message
                                code="menu.wiki"/></a>
                    </li>
                    <li>
                        <a href="<c:url value="http://macoop.scabois.fr"/>" target="_blank"
                           class="flex items-center p-2 pl-11 w-full text-base font-normal text-gray-700 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-gray-50 dark:hover:bg-gray-600"><spring:message
                                code="menu.extranet"/></a>
                    </li>
                    <li>
                        <a href="<c:url value="https://questionnaire.dfiweb.net/"/>" target="_blank"
                           class="flex items-center p-2 pl-11 w-full text-base font-normal text-gray-700 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-gray-50 dark:hover:bg-gray-600"><spring:message
                                code="menu.defiWeb"/></a>
                    </li>
                    <li>
                        <a href="<c:url value="http://orcab.net/"/>" target="_blank"
                           class="flex items-center p-2 pl-11 w-full text-base font-normal text-gray-700 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-gray-50 dark:hover:bg-gray-600"><spring:message
                                code="menu.electromenager"/></a>
                    </li>
                    <li>
                        <a href="<c:url value="https://questionnaire.dfiweb.net/"/>" target="_blank"
                           class="flex items-center p-2 pl-11 w-full text-base font-normal text-gray-700 rounded-lg transition duration-75 group hover:bg-gray-100 dark:text-gray-50 dark:hover:bg-gray-600"><spring:message
                                code="menu.facebook"/></a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</aside>
    
                    
<script>
  function showAddForm() {
    $("#dropdown-example").slide('quick');
  }
</script>