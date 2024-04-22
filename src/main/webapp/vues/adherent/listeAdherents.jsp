<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="flex">
    <div class="text-2xl">
      <spring:message code="label.adherents"/>
    </div>

    <div class="flex flex-grow justify-center">
        <!-- RECHERCHE -->
        <form:form id="searchform" class="form-inline" method="post" modelAttribute="criteria" action="listeAdherents">
            <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>

            <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only">
                <spring:message code="label.texteRecherche" var="recherchePH"/>
            </label>

            <div class="flex gap-2">
                <form:input type="search" path="text" placeholder="${recherchePH}" aria-label="Search" autofocus="true" class="p-2 w-96 bg-white rounded-lg border border-gray-200 text-black"/>
                <c:url value="/initListeAdherents" var="urlInit"/>
                <div class="flex gap-2">
                    <button id="actionButton" type="submit" class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300">
                      Rechercher
                    </button>
                    <button class="btn btn-black focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onclick="window.location.href='${urlInit}'">
                      Réinitialiser
                    </button>
                </div>
            </div>
        </form:form>
    </div>
</div>

<!-- RECHERCHE AVANCÉE -->
<div id="accordion-collapse" data-accordion="collapse" class="bg-gray-200 rounded-2xl shadow-lg">
  <h2 id="accordion-collapse-head-1">
      <button type="button"
              class="focus:text-white bg-gray-800 hover:bg-gray-900 bg-gray-100 dark:bg-gray-800 dark:hover:bg-gray-900 w-full p-3 font-medium rounded-t-xl"
              data-accordion-target="#accordion-collapse-body-1" aria-expanded="false"
              aria-controls="accordion-collapse-body-1" onclick="toggleAdvancedSearchForm()">
          <span class="text-center"><spring:message code="label.rechercheAvance"/></span>
      </button>
  </h2>

  <div id="accordion-collapse-body-1" class="hidden" aria-labelledby="accordion-collapse-head-1">
    <form:form id="advanceSerachForm" method="post" modelAttribute="criteria" action="listeAdherents" class="card card-outline card-info collapsed-card mb-0">
      <form:input type="hidden" name="text" path="text"/>
      <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>
      <spring:message code="label.texteRecherche" var="recherchePH"/>
      <div class="card-body">
        <div class="flex justify-evenly py-3">
          <div class="flex flex-col w-full px-6">
            <label><spring:message code="label.adherentType"/></label>
            <form:select class="form-control select2" name="typeAdhIds" data-placeholder="" path="typeAdhIds" multiple="multiple">
                <form:options items="${adhTypesList}" itemValue="id" itemLabel="libelle"/>
            </form:select>

            <label>Pôle</label>
            <form:select class="form-control select2" name="poleIds" data-placeholder="Tous les pôles" path="poleIds" multiple="multiple">
                <form:options items="${polesList}" itemValue="id" itemLabel="libelle"/>
            </form:select>

            <label>Secteurs</label>
            <form:select class="form-control select2" name="secteurIds" data-placeholder="Tous les secteurs" path="secteurIds" multiple="multiple">
                <form:options items="${secteursList}" itemValue="id" itemLabel="libelle"/>
            </form:select>
          </div>

          <div class="flex flex-col w-full px-6">
            <label>Activités</label>
            <form:select class="form-control select2" name="activiteIds" data-placeholder="Toutes les activités" path="activiteIds" multiple="multiple">
                <form:options items="${activitesList}" itemValue="id" itemLabel="libelle"/>
            </form:select>

            <label>Agences</label>
            <form:select class="form-control select2" name="agenceIds" data-placeholder="Toutes les agences" path="agenceIds" multiple="multiple">
                <form:options items="${agencesList}" itemValue="id" itemLabel="libelle"/>
            </form:select>
          </div>

          <div class="flex flex-col w-full px-6 gap-1 my-auto">
            <div class="flex items-center gap-1.5">
              <form:checkbox class="input-checkbox" id="showAdminOnly" name="showAdminOnly" path="showAdminOnly"/>
              <label class="text-gray-500" style="float:none;" for="showAdminOnly"><spring:message code="label.filtre.isAdministrateur"/></label>
            </div>

            <div class="flex items-center gap-1.5">
              <form:checkbox class="input-checkbox" id="showArtipoleOnly" name="showArtipoleOnly" path="showArtipoleOnly"/>
              <label class="text-gray-500" style="float:none;" for="showArtipoleOnly"><spring:message code="label.filtre.isArtipole"/></label>
            </div>

            <div class="flex items-center gap-1.5">
              <form:checkbox class="input-checkbox" id="showSousCompte" name="showSousCompte" path="showSousCompte"/>
              <label class="text-gray-500" style="float:none;" for="showSousCompte"><spring:message code="label.filtre.sousCompte"/></label>
            </div>

            <div class="flex items-center gap-1.5">
              <form:checkbox class="input-checkbox" id="showAll" name="showAll" path="showAll"/>
              <label class="text-gray-500" style="float:none;" for="showAll"><spring:message code="label.filtre.inactif"/></label>
            </div>

            <div class="flex gap-2 justify-center mt-3">
              <button id="actionButton" type="submit" class="btn btn-green btn-small focus:ring-4 focus:outline-none focus:ring-neutral-300">
                Filtrer la recherche
              </button>
              <!--<button type="reset" onclick="window.location.href='${urlInit}'" class="btn btn-black btn-small focus:ring-4 focus:outline-none focus:ring-neutral-300">
                Effacer
              </button>-->
            </div>
          </div>
        </div>
      </div>
    </form:form>
  </div>
</div>
<!-- RECHERCHE AVANCÉE -->

          
<!-- Default box -->
<div class="card card-lightneutral">
  <div class="card-header">
    <h3 class="card-title px-1.5 py-2"><spring:message code="count" arguments="${nbAdherents}"/></h3>
  </div>
  
  <div class="card-body">
    <div class="grid grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
      <c:forEach items="${listeAdherents}" var="adherent">
        <div class="flex flex-col min-h-40 bg-white border border-gray-300 rounded-lg cursor-pointer transition-transform transform hover:scale-105" id="${adherent.id}">
          
          <h5 class="mt-2 px-1 text-center bg-[#0F638C;] font-medium text-white truncate">
            <c:out value="${adherent.libelle}"/>
          </h5>
          
          <c:choose>
            <c:when test="${adherent.etat.id == '2'}">   <!-- adherent_etat  :  1:Actif  2:Inactif -->
              <div class="bg-red-300 rounded-b-full text-xs text-center text-gray-600 font-semibold p-0.5">
                <c:out value="${adherent.etat.libelle}"/>
              </div>
            </c:when>
            <c:when test="${adherent.adherentType.id == '2'}">   <!-- adherent_type  :  1:Adhérent  2:Ancien Adhérent  3:Coopérative  4:Salarié  5:TNA tiers non associé -->
              <div class="bg-gray-300 rounded-b-full text-xs text-center text-gray-600 font-semibold p-0.5">
                <c:out value="${adherent.adherentType.libelle}"/>
              </div>
            </c:when>
            <c:when test="${adherent.role.id == '5'}">   <!-- role  :  1:Adhérent  2:Administrateur  3:Président  4:Vice président  5:Ancien Adhérent -->
              <div class="bg-gray-300 rounded-b-full text-xs text-center text-gray-600 font-semibold p-0.5">
                <c:out value="${adherent.role.libelle}"/>
              </div>
            </c:when>
            <c:when test="${adherent.compteType.id != '1'}">   <!-- adherent_compte_type  :  1:Pas de blocage  2:Compte sous surveillance  3:Compte bloqué -->
              <div class="bg-red-300 rounded-b-full text-xs text-center text-gray-600 font-semibold p-0.5">
                <c:out value="${adherent.compteType.libelle}"/>
              </div>
            </c:when>
            <c:when test="${adherent.cnxEolasAllow == false}">   <!-- Booléen -->
              <div class="bg-orange-300 rounded-b-full text-xs text-center text-gray-600 font-semibold p-0.5">
                <spring:message code="label.cnxEolasDenied"/>
              </div>
            </c:when>
          </c:choose>                 
         
          <div class="grid grid-cols-3 gap-2 flex-grow items-center text-gray-500 p-2">
            <c:choose>
              <c:when test="${empty adherent.photoImg}">
                <img src="<c:url value="/resources/images/noAdhPhoto.png"/>" class="rounded object-cover mx-auto">
              </c:when>
              <c:otherwise>
                <img src="${adherent.photoImg}" alt="" class="rounded object-cover mx-auto">
              </c:otherwise>
            </c:choose>
                
            <div class="col-span-2 flex flex-col h-full gap-1 justify-between">
              <ul>
                <li class="flex">
                  <div class="bg-green-600 text-white text-xs font-medium px-1.5 py-0.5 rounded">
                    <c:out value="${adherent.code}"/>
                  </div>
                </li> 
              </ul>
                  
              <ul>
                <li class="truncate">
                  <c:out value="${adherent.secteur.libelle}"/>
                </li> 
                <li class="truncate">
                  <c:out value="${adherent.agence.libelle}"/>
                </li>
                <li class="truncate">
                  <c:out value="${adherent.commune.codePostal}"/> <c:out value="${adherent.commune.libelle}"/>
                </li> 
              </ul>
              
              <ul>
                <li class="font-bold"><c:out value="${adherent.pole.libelle}"/></li> 
              </ul>
            </div>
          </div>
        </div>
        <script>
          <c:url value="/adherentProfil" var="urlShowAdh"><c:param name="tab" value="contacts"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
          document.getElementById("${adherent.id}").addEventListener("click", function () {
            window.location.href = "${urlShowAdh}";
          });
        </script>
      </c:forEach>
    </div>
  </div>

  <nav class="flex justify-center mt-4" aria-label="Contacts Page Navigation">
    <ul class="inline-flex items-center -space-x-px">
      <c:if test="${maxPage > 0}">
        <li>
          <a href="listeAdherents?page=1" class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
            Début
          </a>
        </li>

        <li>
          <a href="listeAdherents?page=${page - 1}" class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
            <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"></path>
            </svg>
          </a>
        </li>

        <c:forEach var="i" begin="${page == 1 ? 1 : page-1}" end="${page == maxPage ? maxPage : page+1 }">
          <li>
            <a href="listeAdherents?page=${i}" class="<c:if test="${page == i}"> text-neutral-600 bg-neutral-200 border-neutral-300 hover:bg-neutral-200</c:if> block py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
              ${i}
            </a>
          </li>
        </c:forEach>

        <li>
          <a href="listeAdherents?page=${page + 1}" class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
            <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"></path>
            </svg>
          </a>
        </li>
        
        <li>
          <a href="listeAdherents?page=${maxPage}" class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
            Fin
          </a>
        </li>
      </c:if>
    </ul>
  </nav>
</div>
  
  
<style>
    .select2-selection__choice {margin-bottom: 5px;}
</style>

<script>
  function toggleAdvancedSearchForm() {
    $("#accordion-collapse-body-1").slideToggle(200);
  }
</script>





