<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<aside class="w-60 fixed flex flex-col justify-between" aria-label="Sidebar">
    <div class="overflow-y-auto flex flex-col justify-between py-4 px-3 bg-gray-200 min-h-screen dark:text-gray-50 dark:bg-gray-800">
        <ul class="space-y-2">
            <li class="mt-20"></li>

            <li class="flex justify-center flex items-center text-xl font-normal text-gray-900 py-1 px-1 rounded-lg hover:bg-gray-100 dark:text-gray-50 dark:bg-gray-800">
                    <span class="text-gray-600 font-medium"><spring:message code="label.adherent"/></span>
            </li>

            <li class="h-2 w-full border-b border-gray-300"></li>

            <li>
              <a href=<c:url value="/dashboard"/>
                   class="<c:if test = "${pageType == 'DASHBOARD'}"> bg-[#28a745] font-bold </c:if> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-600">
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
              <a href=<c:url value="/listeAdherents"/>
                   class="<c:if test = "${pageType == 'LIST_ADHERENT' || pageType == 'CREATE_ADHERENT'}"> bg-[#28a745] font-bold </c:if> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-600">
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
              <a href=<c:url value="/listeContact"/>
                   class="<c:if test = "${pageType == '' || pageType == 'LIST_CONTACT'}"> bg-[#28a745] font-bold </c:if> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-600">
                    <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M10 6H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 114 0v1m-4 0a2 2 0 104 0m-5 8a2 2 0 100-4 2 2 0 000 4zm0 0c1.306 0 2.417.835 2.83 2M9 14a3.001 3.001 0 00-2.83 2M15 11h3m-3 4h2"></path>
                    </svg>
                    <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="label.contacts"/></span>
                </a>
            </li>
            <li>
                <a href="listeRetraite"
                   class="<c:if test = "${pageType == '' || pageType == 'LIST_CONTACT_RETRAITE'}"> bg-[#28a745] font-bold </c:if> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-600">
                    <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path>
                    </svg>
                    <span class="ml-3 whitespace-nowrap"><spring:message code="menu.contactRetraite"/></span>
                </a>
            </li><li>
                <a href="listeClubFemmes"
                   class="<c:if test = "${pageType == '' || pageType == 'LIST_CONTACT_CLUB_FEMMES'}"> bg-[#28a745] font-bold</c:if> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-600">
                    <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path>
                    </svg>
                    <span class="ml-3 whitespace-nowrap"><spring:message code="menu.clubFemmes"/></span>
                </a>
            </li>
        </ul>

        <ul class="mb-20 flex flex-col">
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
                <li>
                  <a href=<c:url value="/addAdherent"/>
                       class="<c:if test = "${pageType == '' || pageType == 'CREATE_ADHERENT'}"> text-green-500 font-bold </c:if> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-600">
                        <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                             xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                        </svg>
                         <div class="ml-3 whitespace-nowrap text-sm "><spring:message code="menu.addadherent"/></div>
                    </a>
                </li>
            </sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPORT')">
                <li>
                    <form:form class="h-6" id="exportListForm" method="post" modelAttribute="criteria" action="exportList">
                        <form:input type="hidden" name="text" path="text"/>
                        <form:input type="hidden" name="typeAdhIds" path="typeAdhIds"/>
                        <form:input type="hidden" name="poleIds" path="poleIds"/>
                        <form:input type="hidden" name="secteurIds" path="secteurIds"/>
                        <form:input type="hidden" name="activiteIds" path="activiteIds"/>
                        <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>
                        <form:input type="hidden" name="showAll" path="showAll"/>
                        <form:input type="hidden" name="showSousCompte" path="showSousCompte"/>
                        <form:input type="hidden" name="showAdminOnly" path="showAdminOnly"/>
                        <form:input type="hidden" name="showArtipoleOnly" path="showArtipoleOnly"/>
                        <a href="javascript:;" onclick="parentNode.submit();"
                           class="<c:if test = "${pageType == '' || pageType == 'CREATE_ADHERENT'}"> text-green-500 font-bold </c:if> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-600 ">
                            <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                            </svg>
                            <div class=" text-sm ml-3 whitespace-nowrap"><spring:message code="menu.exportExcel"/></div>
                        </a>
                    </form:form>
                </li>
            </sec:authorize>
          
          <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPORT_WURTH' )">
                <li>
                    <form:form class="h-6" id="exportListForm" method="post" modelAttribute="criteria" action="exportListAll">
                        <form:input type="hidden" name="text" path="text"/>
                        <form:input type="hidden" name="typeAdhIds" path="typeAdhIds"/>
                        <form:input type="hidden" name="poleIds" path="poleIds"/>
                        <form:input type="hidden" name="secteurIds" path="secteurIds"/>
                        <form:input type="hidden" name="activiteIds" path="activiteIds"/>
                        <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>
                        <form:input type="hidden" name="showAll" path="showAll"/>
                        <form:input type="hidden" name="showSousCompte" path="showSousCompte"/>
                        <form:input type="hidden" name="showAdminOnly" path="showAdminOnly"/>
                        <form:input type="hidden" name="showArtipoleOnly" path="showArtipoleOnly"/>
                        <a href="javascript:;" onclick="parentNode.submit();"
                           class="<c:if test = "${pageType == '' || pageType == 'CREATE_ADHERENT'}"> text-green-500 font-bold </c:if> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-600">
                            <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                            </svg>
                            <div class="text-sm ml-3 whitespace-nowrap"><spring:message code="label.exportW&B"/></div>
                        </a>
                    </form:form>
                </li>
            </sec:authorize>

            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPORT_INTERNE')">
                <li>
                    <form:form id="exportListForm" method="post" modelAttribute="criteria" action="exportListAll">
                        <form:input type="hidden" name="text" path="text"/>
                        <form:input type="hidden" name="typeAdhIds" path="typeAdhIds"/>
                        <form:input type="hidden" name="poleIds" path="poleIds"/>
                        <form:input type="hidden" name="secteurIds" path="secteurIds"/>
                        <form:input type="hidden" name="activiteIds" path="activiteIds"/>
                        <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>
                        <form:input type="hidden" name="showAll" path="showAll"/>
                        <form:input type="hidden" name="showSousCompte" path="showSousCompte"/>
                        <form:input type="hidden" name="showAdminOnly" path="showAdminOnly"/>
                        <form:input type="hidden" name="showArtipoleOnly" path="showArtipoleOnly"/>
                        <a href="javascript:;" onclick="parentNode.submit();"
                           class="<c:if test = "${pageType == '' || pageType == 'CREATE_ADHERENT'}"> text-green-500 font-bold </c:if> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-600">
                            <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                            </svg>
                            <div class="text-sm ml-3 whitespace-nowrap"><spring:message code="label.exportAll"/></div>
                        </a>
                    </form:form>
                </li>
            </sec:authorize>
        </ul>

    </div>

<!--    <button type="button" data-modal-toggle="crypto-modal"
            class="text-gray-900 bg-white hover:bg-gray-100 border border-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center">
        <svg class=" mr-3 w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
             xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
        </svg>
        Plus d'options
    </button>-->
</aside>
