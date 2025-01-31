<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<nav class="bg-gray-300 border-b border-gray-400 dark:border-none fixed z-10 w-screen px-2 sm:px-4 py-2 dark:text-gray-50 dark:bg-gray-900">
  <div class="flex flex-wrap justify-between items-center mx-auto">
    <a href="/scabotheque" class="flex items-center">
      <img src="<c:url value="/resources/dist/img/modus.png" />" class="mr-3 h-6 sm:h-9" alt="Scabothèques">
      <span class="self-center text-2xl text-gray-600 dark:text-gray-200 font-semibold whitespace-nowrap">Scabothèque</span>
    </a>
    <div class="flex items-center md:order-2 mr-8">
<!--      <button type="button"
              class="flex mr-3 text-xl rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300"
              id="user-menu-button" aria-expanded="false" data-dropdown-toggle="user-dropdown"
              data-dropdown-placement="bottom">
        <span class="sr-only">Open user menu</span>
      </button>-->
      <div>
        <div class="py-3 px-4">
          <span class="text-sm text-gray-400 dark:text-gray-500">Utilisateur : </span>
          <span class="text-sm text-gray-900 dark:text-gray-50"> <sec:authentication property="name"/></span>
        </div>
      </div>

      <a href="<c:url value="/logout" />" data-tooltip-target="tooltip-logout" class="block p-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-50 dark:hover:bg-gray-700 rounded-md">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
        </svg>
      </a>

      <div id="tooltip-logout" role="tooltip" class="inline-block absolute invisible z-10 py-2 px-3 text-sm font-medium text-white bg-gray-900 rounded-lg shadow-sm opacity-0 transition-opacity duration-300 tooltip">
        Se déconnecter
        <div class="tooltip-arrow" data-popper-arrow></div>
      </div>


<!--      <button data-collapse-toggle="mobile-menu-2" type="button"
              class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200"
              aria-controls="mobile-menu-2" aria-expanded="false">
        <span class="sr-only">Open main menu</span>
        <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"
             xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd"
                d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                clip-rule="evenodd"></path>
        </svg>
      </button>-->
    </div>
        
    <button data-collapse-toggle="navbar-default" type="button" aria-controls="navbar-default" aria-expanded="false" class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200">
      <span class="sr-only">Open main menu</span>
      <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"></path>
      </svg>
    </button>
        
    <div class="hidden w-full md:block md:w-auto" id="navbar-default">
      <ul class="flex bg-gray-200 dark:bg-gray-800 text-gray-400 dark:text-gray-500 rounded-lg font-medium">
        <li>
          <a href="<c:url value="/listeAdherents"/>" class="<c:if test = "${navType == 'ADHERENTS'}"> text-green-600 font-medium animate-pulse </c:if> block px-6 py-2 hover:text-green-600">
             Adhérents
          </a>
        </li>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_EXPLOITATION')">
        <li>
          <a href="<c:url value="/ordreTournee"/>" class="<c:if test = "${navType == 'LOGISTIQUE'}"> text-green-600 font-medium animate-pulse </c:if> block px-6 py-2 hover:text-green-600">
             Tournées
          </a>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_ARTIPOLE_EDIT')">
        <li>
          <a href="<c:url value="/AA-page-accueil"/>" class="<c:if test = "${navType == 'ARTISANS_ARTIPOLE'}"> text-green-600 font-medium animate-pulse </c:if> block px-6 py-2 hover:text-green-600">
             Artisans Artipôle
          </a>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
        <li>
          <a href="<c:url value="/parametrage/listeUtilisateurs"/>" class="<c:if test = "${navType == 'ADMINISTRATION'}"> text-green-600 font-medium animate-pulse </c:if> block px-6 py-2 hover:text-green-600">
            Admin
          </a>
        </li>
        </sec:authorize>
             
        <%--                <li>    --%>
        <%--                    <a href="listeFournisseur"--%>
        <%--                       class="<c:if test = "${navType == 'FOURNISSEURS'}"> text-green-600 font-medium animate-pulse </c:if> block px-6 py-2 hover:text-green-600">Fournisseur</a>--%>
        <%--                </li>--%>
        <%--                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_ARTIPOLE')">--%>
        <%--                    <li>--%>
        <%--                        <a href="listeAdherents"--%>
        <%--                           class="<c:if test = "${navType == 'ARTISANS_ARTIPOLE'}"> text-green-600 font-medium animate-pulse </c:if> block px-6 py-2 hover:text-green-600">Artipôle</a>--%>
        <%--                    </li>--%>
        <%--                </sec:authorize>--%>


        <%--                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_INFORMATIQUE')">--%>
        <%--                    <li>--%>
        <%--                        <a href="listeAdherents"--%>
        <%--                           class="<c:if test = "${navType == 'ADMINISTRATION'}"> text-green-600 font-medium animate-pulse </c:if> block px-6 py-2 hover:text-green-600">Informatique</a>--%>
        <%--                    </li>--%>
        <%--                </sec:authorize>--%>

        <%--                <li>--%>
        <%--                    <a href="<c:url value="http://srvlinux/dokuwiki/doku.php?id=start"/>" target="_blank"--%>
        <%--                       class="<c:if test = "${navType == 'FOURNISSEURS'}"> text-green-600 font-medium animate-pulse </c:if> block px-6 py-2 hover:text-green-600"><spring:message--%>
        <%--                            code="menu.wiki"/></a>--%>
        <%--                </li>--%>

        <li>
          <button id="dropdownNavbarLink" data-dropdown-toggle="dropdownNavbar" class="flex items-center block px-5 py-2 hover:text-green-600">
            Liens utiles
            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"></path>
            </svg>
          </button>
          
          <!-- Dropdown menu -->
          <div id="dropdownNavbar" class="hidden z-10 w-44 font-normal bg-white rounded divide-y divide-gray-100 shadow">
            <ul class="py-1 text-sm bg-gray-200 dark:bg-gray-800" aria-labelledby="dropdownLargeButton">
              <li>
                <a href="<c:url value="http://srvlinux/dokuwiki/doku.php?id=start"/>" target="_blank" class="block py-2 px-4 hover:bg-gray-100"><spring:message code="menu.wiki"/></a>
              </li>
              <li>
                <a href="<c:url value="http://macoop.scabois.fr"/>" target="_blank" class="block py-2 px-4 hover:bg-gray-100"><spring:message code="menu.extranet"/></a>
              </li>
              <li>
                <a href="<c:url value="https://questionnaire.dfiweb.net/"/>" target="_blank" class="block py-2 px-4 hover:bg-gray-100"><spring:message code="menu.defiWeb"/></a>
              </li>
              <li>
                <a href="<c:url value="http://orcab.net/"/>" target="_blank" class="block py-2 px-4 hover:bg-gray-100"><spring:message code="menu.electromenager"/></a>
              </li>
              <%--                            <li>--%>
              <%--                                <a href="<c:url value="https://www.facebook.com/ArtipoleDoleChoisey/"/>" target="_blank"--%>
              <%--                                   class="block py-2 px-4 hover:bg-gray-100"><spring:message--%>
              <%--                                        code="menu.wiki"/></a>--%>
              <%--                            </li>--%>
              <li>
                <a href="<c:url value="http://srvlinux/dokuwiki/doku.php?id=start"/>" target="_blank" class="block py-2 px-4 hover:bg-gray-100"><spring:message code="menu.facebook"/></a>
              </li>
            </ul>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>