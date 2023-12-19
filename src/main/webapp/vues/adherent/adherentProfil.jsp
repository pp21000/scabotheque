<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="grid grid-cols-4 gap-2 w-full"> 
  <div>
    <div class="bg-neutral-200 rounded-xl p-2">
      <div class="flex items-start <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')"> h-[10px] </sec:authorize> ">
        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
          <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
          <a href="${url}" class="rounded-md hover:bg-gray-600 p-0.5 mr-1">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
            </svg>
          </a>
        </sec:authorize>      
      </div>

      
      <div class="flex flex-col items-center justify-center gap-4">

        <!-- Denomination et Code adherent -->
        <div>
          <div class="flex justify-center text-xl text-gray-600 font-semibold">${adherent.denomination}</div>
          <div class="flex justify-center gap-2">
            <div class="text-center"><spring:message code="label.codeAdh"/> :</div>
            <div class="bg-green-200 text-green-800 text-sm font-medium mr-2 px-2 py-0.5 rounded">${adherent.code}</div>
          </div>
          <c:if test="${!adherent.codeERPParent.equals('')}">
            <div class="flex justify-center">
              <div class="text-center"><spring:message code="label.codeERPParent"/> :</div>
              <div class="text-sm font-medium mr-2 px-2 py-0.5 rounded">${adherent.codeERPParent}</div>
            </div>
          </c:if> 
        </div>

        <!-- Logo et Image -->
        <div class="flex justify-center">
          <c:choose>
            <c:when test="${adherent.logoImg == ''}">
              <img class="max-w-[14rem] object-contain rounded-xl" src="<c:url value="/resources/images/noImage.png" />"/>
            </c:when>
            <c:otherwise>
              <img class="max-w-[14rem] object-contain" src="${adherent.logoImg}"/>
            </c:otherwise>
          </c:choose>
        </div>

        <div class="flex justify-center">
          <c:choose>
            <c:when test="${adherent.photoImg == ''}">
              <img class="max-w-[14rem] object-contain rounded-xl" src="<c:url value="/resources/images/noImage.png" />"/>
            </c:when>
            <c:otherwise>
              <img class="max-w-[14rem] object-contain" src="${adherent.photoImg}"/>
            </c:otherwise>
          </c:choose>
        </div>

        <!-- Adhesion Pole & Agence -->
        <div class="w-full">
          <div class="grid grid-cols-9">
            <span class="col-span-4 flex items-center justify-end text-right font-semibold leading-4"><spring:message code="label.adhArtipole"/></span>
            <div class="flex justify-center items-center">
              <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
              </svg>
            </div>
            <span class="col-span-4 flex items-center text-black">
              <c:choose>
                <c:when test="${adherent.isArtipole}"><spring:message code="yes"/></c:when>
                <c:otherwise><spring:message code="no"/></c:otherwise>
              </c:choose>
            </span>
          </div>
          <div class="grid grid-cols-9">
            <span class="col-span-4 flex items-center justify-end text-right font-semibold leading-4"><spring:message code="label.pole"/></span>
            <div class="flex justify-center items-center">
              <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
              </svg>
            </div>
            <span class="col-span-4 flex items-center text-black">${adherent.pole.libelle}</span>
          </div>
          <div class="grid grid-cols-9">
            <span class="col-span-4 flex items-center justify-end text-right font-semibold leading-4"><spring:message code="label.agenceRattachement"/></span>
            <div class="flex justify-center items-center">
              <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
              </svg>
            </div>
            <span class="col-span-4 flex items-center text-black">${adherent.agence.libelle}</span>
          </div>
        </div>
      </div>

      <!--      </div>
            <div class="rounded-xl mt-2 flex flex-col gap-2">-->

      <!-- Informations -->
      <div class="mt-10">
        <div class="flex flex-1 justify-center items-center">
          <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"
               xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="h-8">
            <path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z"></path>
          </svg>
          <h4 class="text-center text-lg font-semibold ml-1">
            Informations
          </h4>
        </div>

        <div class="px-4 py-2">
          <div>
            <spring:message code="label.telephone"/> :
            <span class="text-black">${adherent.telephone}</span>
          </div>
          <div>
            <spring:message code="label.mail"/> :
            <span class="text-black">${adherent.mail}</span>
          </div>
          <div>
            <spring:message code="label.adresse"/> :
            <span class="text-black">${adherent.adresse}</span>
          </div>
          <c:if test="${!adherent.adresseComplement.equals('')}">
            <div>
              <spring:message code="label.adresseComplement"/> :
              <span class="text-black">${adherent.adresseComplement}</span>
            </div>
          </c:if>
          <div>
            <spring:message code="label.commune"/> :
            <span class="text-black"><spring:message code="message.commune" arguments="${adherent.commune.codePostal}, ${adherent.commune.libelle}"/></span>
          </div>
        </div>
      </div>
    </div>

    <div class="mt-2 flex flex-col gap-2">
      <!-- Livraison -->
      <div class="bg-neutral-200 rounded-xl p-2">
        <div class="flex justify-start">

          <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
            <div class="flex items-start">
              <c:url value="/edit/editLivraisonAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
              <a href="${url}" class="rounded-md hover:bg-gray-600 p-0.5 mr-1">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                </svg>
              </a>
            </div>
          </sec:authorize>           
          
          <div class="flex flex-1 justify-center items-center">
            <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"
                 xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="h-8">
              <path stroke-linecap="round" stroke-linejoin="round"
                    d="M8.25 18.75a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h6m-9 0H3.375a1.125 1.125 0 01-1.125-1.125V14.25m17.25 4.5a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h1.125c.621 0 1.129-.504 1.09-1.124a17.902 17.902 0 00-3.213-9.193 2.056 2.056 0 00-1.58-.86H14.25M16.5 18.75h-2.25m0-11.177v-.958c0-.568-.422-1.048-.987-1.106a48.554 48.554 0 00-10.026 0 1.106 1.106 0 00-.987 1.106v7.635m12-6.677v6.677m0 4.5v-4.5m0 0h-12"></path>
            </svg>
            <h4 class="text-center text-lg font-semibold ml-1">
              Livraison
            </h4>
          </div>
        </div>

        <div class="px-4 py-2">
          <div>
            <spring:message code="label.adresseLivraison"/> : 
            <span class="text-black">${infoExploitation.adresseLivraison}</span>
          </div>
          <div>
            <spring:message code="label.adresseComplement"/> : 
            <span class="text-black">${infoExploitation.adresseComplement}</span>
          </div>
          <div>
            <spring:message code="label.commune"/> : 
            <span class="text-black"><c:if test="${not empty infoExploitation.commune.codePostal}"><spring:message code="message.commune" arguments="${infoExploitation.commune.codePostal}, ${infoExploitation.commune.libelle}"/></c:if></span>
          </div>
        </div>
      </div>

      <!-- Agence -->
      <div class="bg-neutral-200 rounded-xl p-2">
        <div class="flex justify-start">
          
          <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
            <div class="flex items-start">
              <c:url value="/edit/editExploitationAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
              <a href="${url}" class="rounded-md hover:bg-gray-600 p-0.5 mr-1">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                </svg>
              </a>
            </div>
          </sec:authorize>           

          <div class="flex flex-1 justify-center items-center">
            <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"
                 xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="h-8">
              <path stroke-linecap="round" stroke-linejoin="round"
                    d="M2.25 21h19.5m-18-18v18m10.5-18v18m6-13.5V21M6.75 6.75h.75m-.75 3h.75m-.75 3h.75m3-6h.75m-.75 3h.75m-.75 3h.75M6.75 21v-3.375c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21M3 3h12m-.75 4.5H21m-3.75 3.75h.008v.008h-.008v-.008zm0 3h.008v.008h-.008v-.008zm0 3h.008v.008h-.008v-.008z"></path>
            </svg>
            <h4 class="text-center text-lg font-semibold ml-1">
              Agence
            </h4>
          </div>
        </div>
        
        <div class="px-4 py-2">
          <div>
            <spring:message code="label.agenceRattachement"/> : 
            <span class="text-black">${adherent.agence.libelle}</span>
          </div>

          <div>          
            <spring:message code="label.secteur"/> : 
            <span class="text-black">${adherent.secteur.libelle}</span>
          </div>

          <div>          
            <spring:message code="label.tournee"/> : 
            <span class="text-black">${adherent.tournee.libelle}</span>
          </div>
        </div>

      </div>
    </div>

    <!-- Horaires d'ouverture -->
    <div class="bg-neutral-200 mt-2 rounded-xl p-2">
      <div class="flex justify-start">

        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
          <%--<div class="flex items-start">
            <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
            <a href="${url}" class="rounded-md hover:bg-gray-600 p-0.5 mr-1">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
              </svg>
            </a>
          </div>--%>
        </sec:authorize> 
        
        <div class="flex flex-1 justify-center items-center">
          <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"
               xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="h-8">
            <path stroke-linecap="round" stroke-linejoin="round"
                  d="M12 6v6h4.5m4.5 0a9 9 0 11-18 0 9 9 0 0118 0z"></path>
          </svg>
          <h4 class="text-center text-lg font-semibold ml-1">
            Horaires d'ouverture
          </h4>
        </div>
      </div>
      
      <div class="flex flex-col px-4 py-2">
        <label class="col-sm-2 col-form-label">Lundi : </label>
        <label class="col-sm-2 col-form-label">Mardi : </label>
        <label class="col-sm-2 col-form-label">Mercredi : </label>
        <label class="col-sm-2 col-form-label">Jeudi : </label>
        <label class="col-sm-2 col-form-label">Vendredi : </label>
      </div>
    </div>

    <!--Informations complémentaires -->
    <div class="bg-neutral-200 mt-2 rounded-xl p-2">
      <div class="flex justify-start">
        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
          <div class="flex items-start">
            <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
            <a href="${url}" class="rounded-md hover:bg-gray-600 p-0.5 mr-1">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
              </svg>
            </a>
          </div>
        </sec:authorize> 
        
        <div class="flex flex-1 justify-center items-center">
          <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"
               xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="h-8">
            <path stroke-linecap="round" stroke-linejoin="round"
                  d="M9.879 7.519c1.171-1.025 3.071-1.025 4.242 0 1.172 1.025 1.172 2.687 0 3.712-.203.179-.43.326-.67.442-.745.361-1.45.999-1.45 1.827v.75M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9 5.25h.008v.008H12v-.008z"></path>
          </svg>
          <h4 class="text-center text-lg font-semibold ml-1">
            Informations complémentaires
          </h4>
        </div>
      </div>
      
      <div class="px-4 py-2">

        <div>
          <spring:message code="label.latitude"/> :
          <span class="text-black">${adherent.latitude}</span>
        </div>

        <div>
          <spring:message code="label.longitude"/> :
          <span class="text-black">${adherent.longitude}</span>
        </div>

      </div>
    </div>
  </div>

  <div class="col-span-3 w-full">
    <div class="flex gap-2 w-full">
      <div class="flex justify-center w-full">
        <div class="flex flex-col w-full">
          <div class="w-full flex justify-center mb-1">
            <ul class="flex flex-wrap -mb-px text-sm font-medium text-center" id="myTab" data-tabs-toggle="#myTabContent" role="tablist">
              <li class="mr-0.5" role="presentation">
                <button class="inline-block py-3 px-6 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 text-gray-500 border-gray-100"
                        id="profile-tab" data-tabs-target="#profile" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('contacts')"
                        aria-selected="<c:if test = "${param.tab == 'contacts'}">true</c:if>">Contacts
                </button>
              </li>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM')">
              <li class="mr-0.5" role="presentation">
                <button class="inline-block py-3 px-6 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 text-gray-500 border-gray-100"
                        id="settings-tab" data-tabs-target="#settings" type="button" role="tab" aria-controls="settings" onclick="changeUrlParameterTabValue('crm')"
                        aria-selected="<c:if test = "${param.tab == 'crm'}">true</c:if>">CRM
                </button>
              </li>
              </sec:authorize>
              <li class="mr-0.5" role="presentation">
                <button class="inline-block py-3 px-6 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 text-gray-500 border-gray-100"
                        id="commerce-tab" data-tabs-target="#commerce" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('commerce')"
                        aria-selected="<c:if test = "${param.tab == 'commerce'}">true</c:if>">Commerce
                </button>
              </li>
              <li class="mr-0.5" role="presentation">
                <button class="inline-block py-3 px-6 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 text-gray-500 border-gray-100"
                        id="artipole-tab" data-tabs-target="#artipole" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('artipole')"
                        aria-selected="<c:if test = "${param.tab == 'artipole'}">true</c:if>">Artipôle
                </button>
              </li>
              <li class="mr-0.5" role="presentation">
                <button class="inline-block py-3 px-6 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 text-gray-500 border-gray-100"
                        id="logistique-tab" data-tabs-target="#logistique" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('logistique')"
                        aria-selected="<c:if test = "${param.tab == 'logistique'}">true</c:if>">Logistique
                </button>
              </li>
              <li class="mr-0.5" role="presentation">
                <button class="inline-block py-3 px-6 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 text-gray-500 border-gray-100"
                        id="administratif-tab" data-tabs-target="#administratif" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('administratif')"
                        aria-selected="<c:if test = "${param.tab == 'administratif'}">true</c:if>">Administratif
                </button>
              </li>
              <li class="mr-0.5" role="presentation">
                <button class="inline-block py-3 px-6 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 text-gray-500 border-gray-100"
                        id="informatique-tab" data-tabs-target="#informatique" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('informatique')"
                        aria-selected="<c:if test = "${param.tab == 'informatique'}">true</c:if>">Informatique
                </button>
              </li>
              <%--                                <sec:authorize access="hasAnyRole('ROLE_ADMIN')">--%>
              <%--                                    <li role="presentation">--%>
              <%--                                        <button class="inline-block p-4 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300"--%>
              <%--                                                id="contacts-tab" data-tabs-target="#contacts" type="button" role="tab"--%>
              <%--                                                aria-controls="contacts" aria-selected="false">Edition--%>
              <%--                                        </button>--%>
              <%--                                    </li>--%>
              <%--                                </sec:authorize>--%>
            </ul>
          </div>
            
          <div id="myTabContent" class="ml-4">
            <div id="profile" role="tabpanel" aria-labelledby="profile-tab">
              <div class="flex items-center mb-1 <sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">px-2 h-[28px]</sec:authorize>">
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
                  <c:url value="/edit/editAdherentContact" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                  <a href="${url}" class="rounded-md hover:bg-gray-300 p-0.5 mr-1">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                    </svg>
                  </a>
                </sec:authorize>    
              </div>
              
              <div class="grid grid-cols-5 gap-2">
                <c:forEach items="${contacts}" var="contact">
                  <div class="flex flex-col w-full justify-between items-center gap-1 bg-neutral-200 rounded-lg p-1">
                    <ul class="w-full">  
                      <li class="flex justify-center">
                        <c:choose>
                          <c:when test="${contact.photoImg == ''}">
                            <img class="h-24 w-24 rounded-full" src="<c:url value="/resources/images/noAdh.png"/>"/>
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

                    <ul class="text-sm text-center text-green-500 w-full">
                      <li class="hover:underline hover:drop-shadow truncate">
                        <a href="mailto:${contact.mail}">${contact.mail}</a>
                      </li>

                      <li class="hover:underline hover:drop-shadow truncate">
                        <a href="tel:${contact.fixe}">${contact.fixe}</a>
                      </li>

                      <c:if test="${contact.mobile != ''}">
                        <li class="hover:underline hover:drop-shadow truncate">
                          <a href="tel:${contact.mobile}">${contact.mobile}</a>
                        </li>                              
                      </c:if>
                    </ul>

                    <ul class="w-full text-sm text-center">
                      <li class="text-xs truncate">
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${contact.dateNaissance}"/>
                        <spring:message code="Age" arguments="${contact.age}"/>
                      </li>

                      <li class="flex flex-col gap-2 p-2">
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
                        <div id="dropdown-${contact.id}" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44">
                          <ul class="py-2 text-sm text-gray-700" aria-labelledby="dropdownDefaultButton-${contact.id}">
                            <li>
                              <div href="#" class="flex gap-1 text-gray-600 py-2 px-3 block hover:bg-gray-100 transition duration-150">
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
                              <div href="#" class="flex gap-1 border-t border-gray-100 text-gray-600 py-2 px-3 block hover:bg-gray-100 transition duration-150">
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
                              <div href="#" class="flex gap-1 border-t border-gray-100 text-gray-600 py-2 px-3 block hover:bg-gray-100 transition duration-150">
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
                              <div href="#" class="flex gap-1 border-t border-gray-100 text-gray-600 py-2 px-3 block hover:bg-gray-100 transition duration-150">
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
                            <li><c:choose>
                                <c:when test="${contact.isAccessEOLAS}">
                                  <div href="#" class="flex gap-1 border-t border-gray-100 text-gray-600 py-2 px-3 block hover:bg-gray-100 transition duration-150">
                                    <svg class="w-6 h-6 text-neutral-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>
                                    </svg>
                                    Accès Spe Eolas
                                  </div>
                                </c:when>
                              </c:choose></li>
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
            <div id="commerce" role="tabpanel" aria-labelledby="commerce-tab">
              <jsp:include page="../customViewsAdhProfil/commerce.jsp"/>
            </div>
            <div id="artipole" role="tabpanel" aria-labelledby="artipole-tab">
              <jsp:include page="../customViewsAdhProfil/artipole.jsp"/>
            </div>
            <div id="logistique" role="tabpanel" aria-labelledby="logistique-tab">
              <jsp:include page="../customViewsAdhProfil/logistique.jsp"/>
            </div>
            <div id="administratif" role="tabpanel" aria-labelledby="administratif-tab">
              <jsp:include page="../customViewsAdhProfil/administratif.jsp"/>
            </div>
            <div id="informatique" role="tabpanel" aria-labelledby="informatique-tab">
              <jsp:include page="../customViewsAdhProfil/informatique.jsp"/>
            </div>
            <div id="settings" role="tabpanel" aria-labelledby="settings-tab">
              <!--CRM-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM')">
                <div class="card-body">
                  <form:form class="addAdherentSuivi" method="post" modelAttribute="suiviToAdd" action="edit/addAdherentSuivi">
                    <form:input type="hidden" path="suiviVisiteAdh.adherentId"/>
                    <div class="post">
                      <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" id="openFormButton" type="button">
                        Ajouter un suivi
                      </button>
                    </div>
                    <div id="openForm" class="post" style="display:none" title="Ajouter un contact">
                      <fieldset>
                        <%--                                                    <legend><spring:message code="label.addSuivi"/></legend>--%>
                        <div class="user-block">
                          <%--                                                        <form:label--%>
                          <%--                                                                path="suiviVisiteAdh.dateCommentaire"><spring:message--%>
                          <%--                                                                code="label.dateSuivi"/></form:label>--%>
                          <div class="col-2 flex gap-4 mt-2" id="reservationdate" data-target-input="nearest">
                            <form:input class="input-text" type="date" path="suiviVisiteAdh.dateCommentaire" placeholder="Date de livraison"/>
                            <form:textarea class="w-2/3 block input-textarea" id="summernote" name="editordata" path="suiviVisiteAdh.commentaire"/>
                            <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">
                              Enregistrer le suivi
                            </button>
                          </div>
                          <form:errors class="error-message" path="suiviVisiteAdh.dateCommentaire"/>
                        </div>
                      </fieldset>
                    </div>
                  </form:form>


                  <div class="grid grid-cols-1 gap-4">
                    <c:forEach items="${infoSuiviVisite}" var="visite">
                      <div class="post bg-white border bg-neutral-50 border-neutral-200 rounded-lg p-2">
                        <div class="user-block">
                          <span class="username">
                            <span class="text-sm">
                              <spring:message code="label.dateSuivi"/>:
                              <fmt:formatDate pattern="dd/MM/yyyy" value="${visite.dateCommentaire}"/>
                            </span>
                            <c:url value="/edit/editCRMAdh" var="url">
                              <c:param name="idAdh" value="${adherent.id}"/>
                              <c:param name="idSuivi" value="${visite.id}"/>
                            </c:url>
                            <a href="${url}" class="float-right btn-default"><i class="fa fa-pencil"></i></a>
                          </span>
                        </div>
                        <p>${visite.commentaireString}</p>
                      </div>
                    </c:forEach>
                  </div>
                </div>
              </sec:authorize>
            </div>
            
            <div class="hidden p-4 rounded-lg" id="contacts" role="tabpanel" aria-labelledby="contacts-tab">
              <div>
                <div class="flex flex-col gap-6">
                  <div class="flex justify-evenly">
                    <%--                                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">--%>
                    <%--                                                <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh"--%>
                    <%--                                                                                                        value="${adherent.id}"/></c:url>--%>
                    <%--                                                <a href="${url}" class="nav-link flex gap-1">--%>

                    <%--                                                    <svg class="w-6 h-6" fill="none" stroke="currentColor"--%>
                    <%--                                                         viewBox="0 0 24 24"--%>
                    <%--                                                         xmlns="http://www.w3.org/2000/svg">--%>
                    <%--                                                        <path stroke-linecap="round" stroke-linejoin="round"--%>
                    <%--                                                              stroke-width="2"--%>
                    <%--                                                              d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path>--%>
                    <%--                                                    </svg>--%>
                    <%--                                                    <div>Infos adherent</div>--%>

                    <%--                                                </a>--%>
                    <%--                                            </sec:authorize>--%>
                    <%--                                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">--%>
                    <%--                                                <c:url value="/edit/editAdherentContact" var="url"><c:param name="idAdh"--%>
                    <%--                                                                                                            value="${adherent.id}"/></c:url>--%>
                    <%--                                                <a href="${url}" class="nav-link flex gap-1">--%>

                    <%--                                                    <svg class="w-6 h-6" fill="none" stroke="currentColor"--%>
                    <%--                                                         viewBox="0 0 24 24"--%>
                    <%--                                                         xmlns="http://www.w3.org/2000/svg">--%>
                    <%--                                                        <path stroke-linecap="round" stroke-linejoin="round"--%>
                    <%--                                                              stroke-width="2"--%>
                    <%--                                                              d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>--%>
                    <%--                                                    </svg>--%>
                    <%--                                                    <div>Contacts</div>--%>

                    <%--                                                </a>--%>
                    <%--                                            </sec:authorize>--%>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION_EDIT')">
                      <c:url value="/edit/editExploitationAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                      <a href="${url}" class="nav-link flex gap-1">

                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                          <path d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z"></path>
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0"></path>
                        </svg>
                        <div>
                          Logistique
                        </div>
                      </a>
                    </sec:authorize>
                  </div>
                  <c:url value="/adherentDetail" var="urlDetail"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                  <c:url value="/adherentActivite" var="urlActivite"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                  <c:url value="/adherentArtipole" var="urlArtipole"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                  <c:url value="/adherentLogistique" var="urlExploit"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                  <c:url value="/adherentAdministratif" var="urlAdmin"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                  <c:url value="/adherentInformatique" var="urlInfo"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                  <%--<c:url value="/adherentCRM" var="urlCRM"><c:param name="idAdh" value="${adherent.id}"/></c:url>--%>

                  <div class="flex justify-center">
                    <%--                                            <c:url value="/enCours" var="url"/>--%>
                    <%--                                            <a class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_DETAIL'}"> bottomNavBar-active</c:if>"--%>
                    <%--                                               href="${urlDetail}">--%>
                    <%--                                                <!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->--%>
                    <%--                                                <spring:message code="menu.contact"/>--%>
                    <%--                                            </a>--%>
                    <%--                                            ---%>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE')">
                      <a href="${urlActivite}" class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_ACTIVITE'}"> bottomNavBar-active</c:if>">
                        <!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
                        <spring:message code="label.activite"/>
                      </a>
                    </sec:authorize>
                    -
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE')">
                      <a href="${urlArtipole}" class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_ARTIPOLE'}"> bottomNavBar-active</c:if>">
                        <!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
                        <spring:message code="label.artipole"/>
                      </a>
                    </sec:authorize>
                    -
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION')">
                      <a href="${urlExploit}" class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_EXPLOITATION'}"> bottomNavBar-active</c:if>">
                        <!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
                        <spring:message code="label.exploitation"/>
                      </a>
                    </sec:authorize>
                    <%--                                            ---%>
                    <%--                                            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM')">--%>
                    <%--                                                <a class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_CRM'}"> bottomNavBar-active</c:if>"--%>
                    <%--                                                   href="${urlCRM}">--%>
                    <%--                                                    <!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->--%>
                    <%--                                                    <spring:message code="label.crm"/>--%>
                    <%--                                                </a>--%>
                    <%--                                            </sec:authorize>--%>
                    -
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE')">
                      <a href="${urlAdmin}" class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_ADMINISTRATIF'}"> bottomNavBar-active</c:if>">
                        <!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
                        <spring:message code="label.administratif"/>
                      </a>
                    </sec:authorize>
                    -
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE')">
                      <a href="${urlInfo}" class="bottom-menu-item <c:if test = "${pageType == 'ADHERENT_INFORMATIQUE'}"> bottomNavBar-active</c:if>">
                        <!--<svg class="menu-item-icon" ><use xlink:href="resources/images/icones.svg#supply"></use></svg>-->
                        <spring:message code="label.informatique"/>
                      </a>
                    </sec:authorize>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.js"></script>


<script>
  
function changeUrlParameterTabValue(newValue) {
    var url = new URL(window.location.href);
    url.searchParams.set('tab', newValue);
    window.history.replaceState({}, '', url.href);
}


</script>