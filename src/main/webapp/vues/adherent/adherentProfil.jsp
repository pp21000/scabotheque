<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="grid grid-cols-4 gap-5 w-full"> 
  <div class="flex flex-col gap-3">
    <c:choose>
      <c:when test="${adherent.etat.id == '2'}">   <!-- adherent_etat  :  1:Actif  2:Inactif -->
        <div class="bg-red-300 rounded-xl text-center text-gray-600 font-semibold p-2">
          <c:out value="${adherent.etat.libelle}"/>
        </div>
      </c:when>
      <c:when test="${adherent.adherentType.id == '2'}">   <!-- adherent_type  :  1:Adhérent  2:Ancien Adhérent  3:Coopérative  4:Salarié  5:TNA tiers non associé -->
        <div class="bg-gray-300 rounded-xl text-center text-gray-600 font-semibold p-2">
          <c:out value="${adherent.adherentType.libelle}"/>
        </div>
      </c:when>
      <c:when test="${adherent.role.id == '5'}">   <!-- role  :  1:Adhérent  2:Administrateur  3:Président  4:Vice président  5:Ancien Adhérent -->
        <div class="bg-gray-300 rounded-xl text-center text-gray-600 font-semibold p-2">
          <c:out value="${adherent.role.libelle}"/>
        </div>
      </c:when>
      <c:when test="${adherent.compteType.id != '1'}">   <!-- adherent_compte_type  :  1:Pas de blocage  2:Compte sous surveillance  3:Compte bloqué -->
        <div class="bg-red-300 rounded-xl text-center text-gray-600 font-semibold p-2">
          <c:out value="${adherent.compteType.libelle}"/>
        </div>
      </c:when>
      <c:when test="${adherent.cnxEolasAllow == false}">   <!-- Booléen -->
        <div class="bg-orange-300 rounded-xl text-center text-gray-600 font-semibold p-2">
          <spring:message code="label.cnxEolasDenied"/>
        </div>
      </c:when>
    </c:choose>
    
    <div class="bg-neutral-200 rounded-xl p-2">
      
      <div class="flex flex-col items-center justify-center gap-5">
        <div class="flex w-full pr-8<sec:authorize access="not hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')"> pl-8 </sec:authorize>">
          <div class="flex flex-col">
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
              <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
              <a href="${url}" class="rounded-md hover:bg-neutral-400 hover:text-neutral-200 p-0.5 mr-1">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                </svg>
              </a>
            </sec:authorize>  
          </div>
          
          <!-- Denomination et Code adherent -->
          <div class="w-full">
            <div class="text-center text-xl text-gray-600 font-bold">${adherent.denomination}</div>
            <div class="flex justify-center">
              <div class="bg-green-600 text-white text-sm font-medium px-2 py-0.5 rounded">${adherent.code}</div>
            </div>
            <c:if test="${not empty adherent.codeERPParent}">
              <div class="flex justify-center items-center gap-1">
                <div class="text-center text-sm"><spring:message code="label.codeERPParent"/> :</div>
                <div class="bg-green-600 text-white text-xs font-medium px-1.5 py-0.5 rounded">${adherent.codeERPParent}</div>
              </div>
            </c:if> 
          </div>
        </div>
      
        <!-- Logo et Image -->
        <div class="flex flex-col w-full gap-2">
          <c:choose>
            <c:when test="${not empty adherent.logoImg}">
              <div class="flex w-full pr-11">
                <div class="-rotate-90 flex items-center font-thin drop-shadow pr-1.5">
                  Logo
                </div>
                <div class="w-full flex justify-center">
                  <img class="rounded" src="${adherent.logoImg}"/>
                </div>
              </div>
            </c:when>
            <c:otherwise>
              <div class="text-center my-1">
                <spring:message code="label.noLogo"/>
              </div>
            </c:otherwise>
          </c:choose>

          <c:choose>
            <c:when test="${not empty adherent.photoImg}">
              <div class="flex w-full pr-11">
                <div class="-rotate-90 flex items-center font-thin drop-shadow">
                  Photo
                </div>
                <div class="w-full flex justify-center">
                  <img class="rounded" src="${adherent.photoImg}"/>
                </div>
              </div>
            </c:when>
            <c:otherwise>
              <div class="text-center my-1">
                <spring:message code="label.noPhoto"/>
              </div>
            </c:otherwise>
          </c:choose>
        </div>

        <!-- Adhesion Pole & Agence -->
        <div class="w-full leading-none">
          <div class="grid grid-cols-9">
            <span class="col-span-4 flex items-center justify-end text-right font-semibold"><spring:message code="label.adhArtipole"/></span>
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
            <span class="col-span-4 flex items-center justify-end text-right font-semibold"><spring:message code="label.pole"/></span>
            <div class="flex justify-center items-center">
              <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
              </svg>
            </div>
            <span class="col-span-4 flex items-center text-black">${adherent.pole.libelle}</span>
          </div>
          <div class="grid grid-cols-9">
            <span class="col-span-4 flex items-center justify-end text-right font-semibold"><spring:message code="label.agenceRattachement"/></span>
            <div class="flex justify-center items-center">
              <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
              </svg>
            </div>
            <span class="col-span-4 flex items-center text-black">${adherent.agence.libelle}</span>
          </div>
        </div>

        <div class="flex flex-col gap-3 text-center">
          <ul class="text-green-600">
            <li class="hover:underline">
              <a href="mailto:${adherent.mail}">${adherent.mail}</a>
            </li>
            <li class="hover:underline">
              <a href="tel:${adherent.telephone}">${adherent.telephone}</a>
            </li>
          </ul>
          <ul class="text-black leading-none">
            <li>
              <span>${adherent.adresse}</span>
            </li>
            <c:if test="${not empty adherent.adresseComplement}">
              <li>
                <span>${adherent.adresseComplement}</span>
              </li>
            </c:if>
            <li>
              <span><spring:message code="message.commune" arguments="${adherent.commune.codePostal}, ${adherent.commune.libelle}"/></span>
            </li>
          </ul>
          <ul>
            <li>
              <c:choose>
                <c:when test="${adherent.latitude!=0 or adherent.longitude!=0}">
                  <c:url value="https://www.google.com/maps" var="urlMaps"><c:param name="q" value="${adherent.latitude},${adherent.longitude}"/></c:url>
                  <a href="${urlMaps}" target="_blank" class="text-green-600 hover:underline">
                    <spring:message code="label.localisation"/>
                  </a>
                  <span class="text-black"> : ${adherent.latitude}, ${adherent.longitude}</span>
                </c:when>
                <c:otherwise>
                  <span>Coordonnées GPS non renseignées</span>
                </c:otherwise>
              </c:choose>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Livraison -->
    <div class="bg-neutral-200 rounded-xl p-2">
      <div class="flex justify-start">
        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION_EDIT', 'ROLE_ADHERENT_EDIT')">
          <div class="flex flex-col">
            <c:url value="/edit/editLivraisonAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
            <a href="${url}" class="rounded-md hover:bg-neutral-400 hover:text-neutral-200 p-0.5 mr-1">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
              </svg>
            </a>
          </div>
        </sec:authorize>           

        <div class="flex flex-1 justify-center items-center">
          <svg fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="h-8">
            <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 18.75a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h6m-9 0H3.375a1.125 1.125 0 01-1.125-1.125V14.25m17.25 4.5a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h1.125c.621 0 1.129-.504 1.09-1.124a17.902 17.902 0 00-3.213-9.193 2.056 2.056 0 00-1.58-.86H14.25M16.5 18.75h-2.25m0-11.177v-.958c0-.568-.422-1.048-.987-1.106a48.554 48.554 0 00-10.026 0 1.106 1.106 0 00-.987 1.106v7.635m12-6.677v6.677m0 4.5v-4.5m0 0h-12"></path>
          </svg>
          <h4 class="text-center text-lg font-semibold ml-1">
            Livraison
          </h4>
        </div>
      </div>

      <ul class="px-4 py-2">
        <c:choose>
          <c:when test="${not empty infoExploitation.adresseLivraison or not empty infoExploitation.commune.codePostal}">
            <li>
              <spring:message code="label.adresseLivraison"/> : <span class="text-black">${infoExploitation.adresseLivraison}</span>
            </li>
            <c:if test="${not empty infoExploitation.adresseComplement}">
              <li>
                <spring:message code="label.adresseComplement"/> : <span class="text-black">${infoExploitation.adresseComplement}</span>
              </li>
            </c:if>
            <li>
              <spring:message code="label.commune"/> : 
              <span class="text-black">
                <c:if test="${not empty infoExploitation.commune.codePostal}">
                  <spring:message code="message.commune" arguments="${infoExploitation.commune.codePostal}, ${infoExploitation.commune.libelle}"/>
                </c:if>
              </span>
            </li>
          </c:when>
          <c:otherwise>
            <li>
              <span>Adresse non renseignée.</span>
            </li>          
          </c:otherwise>
        </c:choose>
      </ul>
    </div>

    <!-- Agence -->
    <div class="bg-neutral-200 rounded-xl p-2">
      <div class="flex justify-start">
        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION_EDIT', 'ROLE_ADHERENT_EDIT')">
          <div class="flex flex-col">
            <c:url value="/edit/editExploitationAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
            <a href="${url}" class="rounded-md hover:bg-neutral-400 hover:text-neutral-200 p-0.5 mr-1">
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

      <ul class="px-4 py-2">
        <li>
          <spring:message code="label.agenceRattachement"/> : <span class="text-black">${adherent.agence.libelle}</span>
        </li>
        <li>          
          <spring:message code="label.secteur"/> : <span class="text-black">${adherent.secteur.libelle}</span>
        </li>
        <li>          
          <spring:message code="label.tournee"/> : <span class="text-black">${adherent.tournee.libelle}</span>
        </li>
        <li>          
          <spring:message code="label.outilDechargement"/> : 
          <span class="text-black">              
            <c:choose>
              <c:when test="${adherent.isOutilDechargement}"><spring:message code="yes"/></c:when>
              <c:otherwise><spring:message code="no"/></c:otherwise>
            </c:choose>
          </span>
        </li>
      </ul>
    </div>

          
    <!-- Horaires d'ouverture -->
    <div class="bg-neutral-200 rounded-xl p-2">
      <div class="flex justify-start">
        <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
          <div class="flex flex-col">
            <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
            <a href="${url}" class="rounded-md hover:bg-neutral-400 hover:text-neutral-200 p-0.5 mr-1">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
              </svg>
            </a>
          </div>
        </sec:authorize>--%> 
        
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
        Non renseignées.
        <!--<label class="col-sm-2 col-form-label">Lundi : </label>
        <label class="col-sm-2 col-form-label">Mardi : </label>
        <label class="col-sm-2 col-form-label">Mercredi : </label>
        <label class="col-sm-2 col-form-label">Jeudi : </label>
        <label class="col-sm-2 col-form-label">Vendredi : </label>-->
      </div>
    </div>
  </div>

  <div class="col-span-3 w-full">
    <div class="flex gap-2 w-full">
      <div class="flex justify-center w-full">
        <div class="flex flex-col w-full gap-3">
          <div class="flex">
            <c:url value="/listeAdherents" var="urlPrev"></c:url>
            <div class="w-[10%]">
              <button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
                <spring:message code="label.retour"/>
              </button>
            </div> 
              
            <ul class="flex flex-wrap w-[80%] justify-center -mb-px text-sm font-medium text-center gap-0.5" id="myTab" data-tabs-toggle="#myTabContent" role="tablist">
              <li role="presentation">
                <button class="pt-2 pb-3 px-6 border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300"
                        id="contacts-tab" data-tabs-target="#contacts" type="button" role="tab" aria-controls="contacts" onclick="changeUrlParameterTabValue('contacts')"
                        aria-selected="<c:if test = "${param.tab == 'contacts'}">true</c:if>">Contacts
                </button>
              </li>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM')">
                <li role="presentation">
                  <button class="pt-2 pb-3 px-6 border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300"
                          id="crm-tab" data-tabs-target="#crm" type="button" role="tab" aria-controls="crm" onclick="changeUrlParameterTabValue('crm')"
                          aria-selected="<c:if test = "${param.tab == 'crm'}">true</c:if>">CRM
                  </button>
                </li>
              </sec:authorize>
              <li role="presentation">
                <button class="pt-2 pb-3 px-6 border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300"
                        id="commerce-tab" data-tabs-target="#commerce" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('commerce')"
                        aria-selected="<c:if test = "${param.tab == 'commerce'}">true</c:if>">Commerce
                </button>
              </li>
              <li role="presentation">
                <button class="pt-2 pb-3 px-6 border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300"
                        id="artipole-tab" data-tabs-target="#artipole" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('artipole')"
                        aria-selected="<c:if test = "${param.tab == 'artipole'}">true</c:if>">Artipôle
                </button>
              </li>
              <li role="presentation">
                <button class="pt-2 pb-3 px-6 border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300"
                        id="logistique-tab" data-tabs-target="#logistique" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('logistique')"
                        aria-selected="<c:if test = "${param.tab == 'logistique'}">true</c:if>">Logistique
                </button>
              </li>
              <li role="presentation">
                <button class="pt-2 pb-3 px-6 border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300"
                        id="administratif-tab" data-tabs-target="#administratif" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('administratif')"
                        aria-selected="<c:if test = "${param.tab == 'administratif'}">true</c:if>">Administratif
                </button>
              </li>
              <li role="presentation">
                <button class="pt-2 pb-3 px-6 border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300"
                        id="informatique-tab" data-tabs-target="#informatique" type="button" role="tab" aria-controls="profile" onclick="changeUrlParameterTabValue('informatique')"
                        aria-selected="<c:if test = "${param.tab == 'informatique'}">true</c:if>">Informatique
                </button>
              </li>
            </ul>
          </div>
            
          <div id="myTabContent">
            <div id="contacts" role="tabpanel" aria-labelledby="contacts-tab" class="<c:if test = "${param.tab != 'contacts'}">hidden</c:if>">
              <jsp:include page="../adherentProfilTabs/contacts.jsp"/>
            </div>
            <div id="crm" role="tabpanel" aria-labelledby="crm-tab" class="<c:if test = "${param.tab != 'crm'}">hidden</c:if>">
              <jsp:include page="../adherentProfilTabs/crm.jsp"/>
            </div>
            <div id="commerce" role="tabpanel" aria-labelledby="commerce-tab" class="<c:if test = "${param.tab != 'commerce'}">hidden</c:if>">
              <jsp:include page="../adherentProfilTabs/commerce.jsp"/>
            </div>
            <div id="artipole" role="tabpanel" aria-labelledby="artipole-tab" class="<c:if test = "${param.tab != 'artipole'}">hidden</c:if>">
              <jsp:include page="../adherentProfilTabs/artipole.jsp"/>
            </div>
            <div id="logistique" role="tabpanel" aria-labelledby="logistique-tab" class="<c:if test = "${param.tab != 'logistique'}">hidden</c:if>">
              <jsp:include page="../adherentProfilTabs/logistique.jsp"/>
            </div>
            <div id="administratif" role="tabpanel" aria-labelledby="administratif-tab" class="<c:if test = "${param.tab != 'administratif'}">hidden</c:if>">
              <jsp:include page="../adherentProfilTabs/administratif.jsp"/>
            </div>
            <div id="informatique" role="tabpanel" aria-labelledby="informatique-tab" class="<c:if test = "${param.tab != 'informatique'}">hidden</c:if>">
              <jsp:include page="../adherentProfilTabs/informatique.jsp"/>
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