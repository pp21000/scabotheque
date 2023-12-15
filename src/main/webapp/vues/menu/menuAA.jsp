
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

      <li class="flex justify-center text-xl px-1 py-5 mt-12 text-gray-600 font-medium w-full border-b border-gray-500">
          <spring:message code="menu.AA-ArtisantArtipole"/>
      </li>

      <li>
        <a href=<c:url value="/AA-page-accueil"/>  class="<c:choose><c:when test = "${pageType == 'AA_ACCUEIL'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap">Accueil</span>
        </a>
      </li>
        
      <li>
        <a href=<c:url value="/AA-page-actualites"/> 
           class="<c:choose><c:when test = "${pageType == 'AA_ACTUALITES'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-Actualites"/></span>
        </a>
      </li>
      
      <li>
        <a href=<c:url value="/AA-page-emplacements"/>
           class="<c:choose><c:when test = "${pageType == 'AA_EMPLACEMENTS'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-Emplacements"/></span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-photos"/>
           class="<c:choose><c:when test = "${pageType == 'AA_PHOTOS'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap">Photos</span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-certifications"/>
           class="<c:choose><c:when test = "${pageType == 'AA_CERTIFICATIONS'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-Certifications"/></span>
        </a>
      </li>      
        
      <li>
        <a href=<c:url value="/AA-page-metiers"/>
           class="<c:choose><c:when test = "${pageType == 'GESTION_METIER'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-Metiers"/></span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-travaux"/>
           class="<c:choose><c:when test = "${pageType == 'AA_TRAVAUX'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-Travaux"/></span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-je-cherche-un-artisan"/>
           class="<c:choose><c:when test = "${pageType == 'AA_JE_CHERCHE_UN_ARTISAN'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-RechercheArtisan"/></span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-inspirations"/>
           class="<c:choose><c:when test = "${pageType == 'AA_INSPIRATIONS'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
          </svg>
          <span class="flex-1 ml-3 whitespace-nowrap"><spring:message code="menu.AA-Inspirations"/></span>
        </a>
      </li>

      <li>
        <a href=<c:url value="/AA-page-salle-exposition"/>
           class="<c:choose><c:when test = "${pageType == 'AA_SALLE_EXPOSITION'}">bg-green-600 hover:bg-green-700 </c:when><c:otherwise> hover:bg-gray-100 dark:hover:bg-gray-600 </c:otherwise></c:choose> flex items-center p-2 text-base font-normal text-gray-900 dark:text-gray-50 rounded-lg">
          <svg aria-hidden="true"
               class="w-6 h-6 text-gray-500 transition duration-75 group-hover:text-gray-900"
               fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
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
