<%--
  User: ludovic.spina - Date: 21/02/2023 - Time: 11:03
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<aside class=" w-60 fixed flex flex-col justify-between" aria-label="Sidebar">
  <div class="overflow-y-auto flex flex-col justify-between py-4 px-3 bg-zinc-200 min-h-screen bg-gray-50 dark:bg-gray-800 dark:text-gray-50">
    <ul class="space-y-2">

      <li class="flex justify-center text-xl px-1 py-5 mt-12 text-gray-600 font-medium w-full border-b border-gray-400">
          <spring:message code="menu.AA-ArtisantArtipole"/>
      </li>

      <li>
        <a href=<c:url value="/AA-page-accueil"/>  class="<c:choose><c:when test = "${pageType == 'AA_ACCUEIL'}"> bg-[#28a745] </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap">Accueil</span>
        </a>
      </li>
        
      <li>
        <a href=<c:url value="/AA-page-actualites"/> 
           class="<c:choose><c:when test = "${pageType == 'AA_ACTUALITES'}"> bg-[#28a745] </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-Actualites"/></span>
        </a>
      </li>
      
      <li>
        <a href=<c:url value="/AA-page-emplacement"/>
           class="<c:choose><c:when test = "${pageType == 'AA_EMPLACEMENT'}"> bg-[#28a745] </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-Emplacements"/></span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-photos"/>
           class="<c:choose><c:when test = "${pageType == 'AA_PHOTO'}"> bg-[#28a745] </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap">Photos</span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-listes"/>
           class="<c:choose><c:when test = "${pageType == 'GESTION_METIER'}"> bg-[#28a745] </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap">Les listes / <spring:message code="menu.AA-NosMetiers"/></span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-je-cherche-un-artisan"/>
           class="<c:choose><c:when test = "${pageType == 'AA_JE_CHERCHE_UN_ARTISAN'}"> bg-[#28a745] </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-RechercheArtisan"/></span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-inspirations"/>
           class="<c:choose><c:when test = "${pageType == 'AA_INSPIRATIONS'}"> bg-[#28a745] </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-Inspirations"/></span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-salle-exposition"/>
           class="<c:choose><c:when test = "${pageType == 'AA_SALLE_EXPOSITION'}"> bg-[#28a745] </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75  group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
            <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-SalleExposition"/></span>
        </a>
      </li>
      <!--</ul>-->
      <!--</div>-->
      <!--</li>-->
    </ul>
  </div>
</aside>
