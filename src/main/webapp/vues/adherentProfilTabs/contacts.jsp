<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div>
  <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">px-2 h-[28px]</sec:authorize>">
     <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
       <c:url value="/edit/editAdherentContact" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
       <a href="${url}" class="rounded-md hover:bg-gray-300 hover:text-gray-700 p-0.5 mr-1">
         <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
         </svg>
       </a>
     </sec:authorize>    
   </div>

   <div class="grid grid-cols-5 gap-2">
     <c:forEach items="${contacts}" var="contact">
       <div class="flex flex-col w-full items-center justify-between gap-1 bg-neutral-200 rounded-lg p-2">
         <ul class="w-full">  
           <li class="flex justify-center">
             <c:choose>
               <c:when test="${empty contact.photoImg}">
                 <img class="h-24 w-24 rounded-full" src="<c:url value="/resources/images/noContact.png"/>"/>
               </c:when>
               <c:otherwise>
                 <img class="h-24 w-24 rounded-full object-cover" src="${contact.photoImg}"/>
               </c:otherwise>
             </c:choose>
           </li>

           <li>
             <h5 class="text-lg font-bold tracking-tight text-gray-900 text-center truncate">
               <span class="text-sm"><c:out value="${contact.civilite}"/></span>
               <c:out value="${contact.nom} ${contact.prenom}"/>
             </h5>

             <p class="text-center font-semibold text-sm text-gray-500">
               <c:out value="${contact.fonction.libelle}"/>
             </p>
           </li>
         </ul>

         <ul class="text-sm text-center text-green-600 w-full">
           <li class="hover:underline truncate">
             <a href="mailto:${contact.mail}">${contact.mail}</a>
           </li>

           <li class="hover:underline truncate">
             <a href="tel:${contact.fixe}">${contact.fixe}</a>
           </li>

           <c:if test="${(not empty contact.mobile) && contact.mobile != contact.fixe}">
             <li class="hover:underline truncate">
               <a href="tel:${contact.mobile}">${contact.mobile}</a>
             </li>                              
           </c:if>
         </ul>

         <ul class="w-full text-sm text-center">
           <li class="text-xs truncate">
             <fmt:formatDate pattern="dd/MM/yyyy" value="${contact.dateNaissance}"/>
             <spring:message code="age" arguments="${contact.age}"/>
           </li>

           <li class="flex flex-col gap-2 p-1">
             <button id="dropdownDefaultButton-${contact.id}"
                     data-dropdown-toggle="dropdown-${contact.id}"
                     class="flex justify-center text-white bg-neutral-700 hover:bg-neutral-800 focus:ring-4 focus:outline-none focus:ring-neutral-400 font-medium rounded-lg text-sm px-2 py-1 text-center inline-flex items-center"
                     type="button">Rôles
               <svg class="w-4 h-4 ml-2" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                 <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
               </svg>
             </button>
             <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
               <button id="dropdownDefaultId-${contact.id}"
                       data-dropdown-toggle="dropdownId-${contact.id}"
                       class="flex justify-center text-white bg-neutral-700 hover:bg-neutral-800 focus:ring-4 focus:outline-none focus:ring-neutral-400 font-medium rounded-lg text-sm px-2 py-1 text-center inline-flex items-center"
                       type="button">Identifiants
                 <svg class="w-4 h-4 ml-2" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                   <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                 </svg>
               </button>
             </sec:authorize>

             <!-- Dropdown menu -->
             <div id="dropdown-${contact.id}" class="z-10 hidden bg-white rounded-lg shadow w-44">
               <ul class="text-sm text-gray-700 divide-y divide-gray-100 py-1.5" aria-labelledby="dropdownDefaultButton-${contact.id}">

                 <li>
                   <div href="#" class="flex gap-1 items-center text-gray-600 py-1 px-3 block hover:bg-gray-50 transition duration-150">
                     <c:choose>
                       <c:when test="${contact.isMailingDirigeant}">
                         <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                         </svg>
                       </c:when>
                       <c:otherwise>
                         <svg class="text-red-600 w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                         </svg>
                       </c:otherwise>
                     </c:choose>
                     Dirigeant
                   </div>
                 </li>

                 <li>
                   <div href="#" class="flex gap-1 items-center text-gray-600 py-1 px-3 block hover:bg-gray-50 transition duration-150">
                     <c:choose>
                       <c:when test="${contact.isMailingCommerce}">
                         <svg class="text-green-600 w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                         </svg>
                       </c:when>
                       <c:otherwise>
                         <svg class="text-red-600 w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                         </svg>
                       </c:otherwise>
                     </c:choose>
                     Commerce
                   </div>
                 </li>

                 <li>
                   <div href="#" class="flex gap-1 items-center text-gray-600 py-1 px-3 block hover:bg-gray-50 transition duration-150">
                     <c:choose>
                       <c:when test="${contact.isMailingAdministratif}">
                         <svg class="text-green-600 w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                         </svg>
                       </c:when>
                       <c:otherwise>
                         <svg class="text-red-600 w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                         </svg>
                       </c:otherwise>
                     </c:choose>
                     Administratif
                   </div>
                 </li>

                 <li>
                   <div href="#" class="flex gap-1 items-center text-gray-600 py-1 px-3 block hover:bg-gray-50 transition duration-150">
                     <c:choose>
                       <c:when test="${contact.isMailingCompta}">
                         <svg class="text-green-600 w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                         </svg>
                       </c:when>
                       <c:otherwise>
                         <svg class="text-red-600 w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                         </svg>
                       </c:otherwise>
                     </c:choose>
                     Comptabilité
                   </div>
                 </li>

                 <li>
                   <c:choose>
                     <c:when test="${contact.isAccessEOLAS}">
                       <div href="#" class="flex gap-1 items-center text-gray-600 py-1 px-3 block hover:bg-gray-50 transition duration-150">
                         <svg class="w-6 h-6 text-neutral-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                           <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>
                         </svg>
                         Accès Spe Eolas
                       </div>
                     </c:when>
                   </c:choose>
                 </li>

               </ul>
             </div>

             <div id="dropdownId-${contact.id}" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-56">
               <ul class="py-2 text-xs text-gray-700 flex flex-col" aria-labelledby="dropdownDefaultId-${contact.id}">
                 <li class="flex flex-col items-center justify-center gap-1">
                   <span><spring:message code="label.login"/> : ${contact.loginEOLAS}</span>
                 </li>
                 <li class="flex flex-col items-center justify-center gap-1">
                   <span><spring:message code="label.pass"/> : ${contact.passEOLAS}</span>
                 </li>
               </ul>
             </div>

           </li>
         </ul>

       </div>
     </c:forEach>
   </div>
</div> 