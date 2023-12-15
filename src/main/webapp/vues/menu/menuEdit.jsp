<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<aside class="w-60 fixed" aria-label="Sidebar">
    <div class="overflow-y-auto flex flex-col justify-between py-4 px-3 bg-zinc-200 min-h-screen bg-gray-50 dark:text-gray-50 dark:bg-gray-800">
        <ul class="space-y-2">

            <li class="flex justify-center text-xl px-1 py-5 mt-12 text-gray-600 font-medium w-full border-b border-gray-500">Administration</li>
            
            <li>
              <a href=<c:url value="/dashboard"/> class="<c:choose><c:when test = "${pageType == 'DASHBOARD'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-gray-50">
                    <svg aria-hidden="true"
                         class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
                         fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                        <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                    </svg>
                    <span class="ml-3"><spring:message code="label.dashboard"/></span>
                </a>
            </li>
            <li>
              <a href=<c:url value="/listeAdherents"/> class="<c:choose><c:when test = "${pageType == 'LIST_ADHERENT' || pageType == 'CREATE_ADHERENT' || pageType == 'ADHERENT_PROFIL'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-gray-50">
                    <svg class="w-6 h-6 text-gray-500 fill-gray-500" fill="none" stroke="currentColor"
                         viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="label.adherent"/></span>
                </a>
            </li> 
            <li>
              <a href=<c:url value="/listeContact"/> class="<c:choose><c:when test = "${pageType == '' || pageType == 'LIST_CONTACT'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-gray-50">
                    <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M10 6H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 114 0v1m-4 0a2 2 0 104 0m-5 8a2 2 0 100-4 2 2 0 000 4zm0 0c1.306 0 2.417.835 2.83 2M9 14a3.001 3.001 0 00-2.83 2M15 11h3m-3 4h2"></path>
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="label.contacts"/></span>
                </a>
            </li>
            <li>
                <a href=<c:url value="/listeRetraite"/> class="<c:choose><c:when test = "${pageType == '' || pageType == 'LIST_CONTACT_RETRAITE'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-gray-50">
                    <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"<c:url value="/listeRetraite"/>
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path>
                    </svg>
                    <span class="ml-3 whitespace-nowrap"><spring:message code="menu.contactRetraite"/></span>
                </a>
            </li><li>
                <a href=<c:url value="/listeClubFemmes"/> class="<c:choose><c:when test = "${pageType == '' || pageType == 'LIST_CONTACT_CLUB_FEMMES'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-gray-50">
                    <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path>
                    </svg>
                    <span class="ml-3 whitespace-nowrap"><spring:message code="menu.clubFemmes"/></span>
                </a>
            </li>
        </ul>
    </div>
</aside>