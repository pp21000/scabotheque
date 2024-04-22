<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="flex justify-center">
  <h1 class="px-14 py-1.5 text-3xl bg-gray-200 dark:bg-gray-600 rounded-2xl"><spring:message code="label.addAdherent"/></h1>
</div>
  
<form:form class="content" method="post" modelAttribute="adhToAdd" action="addAdherent">
  <form:input type="hidden" path="adherent.id"/>
  <form:input type="hidden" path="adherent.rcsCommune.id" id="communeRCSId"/>
  <form:input type="hidden" path="adherent.rmCommune.id" id="communeRMId"/>
  
  <!-- IDENTITÉ -->
  <div class="flex flex-col gap-10 mx-8">
    <div class="flex flex-col gap-4">
      <span class="text-2xl"><spring:message code="label.identite"/></span>
      <div class="flex flex-col gap-6 ml-10">
        <div class="grid grid-cols-7 gap-6">
          <div>
            <form:label path="adherent.code" class="text-xs"><spring:message code="label.codeAdh"/></form:label>
            <form:input class="form-control block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.code" path="adherent.code" autofocus="true"/>
            <form:errors class="error-message" path="adherent.code"/>
          </div>

          <div>
            <form:label path="adherent.codeERP" class="text-xs"><spring:message code="label.codeERP"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.codeERP" path="adherent.codeERP"/>
            <form:errors class="error-message" path="adherent.codeERP"/>
          </div>

          <div class="truncate">
            <form:label path="adherent.codeERPParent" class="text-xs"><spring:message code="label.codeERPParent"/></form:label>
            <form:input
              class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.codeERPParent" path="adherent.codeERPParent"/>
            <form:errors class="error-message" path="adherent.codeERPParent"/>
          </div>
          
          <div>
            <form:label class="text-xs" path="adherent.pole"><spring:message code="label.pole"/></form:label>
            <form:select class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                         name="adherent.pole" path="adherent.pole.id">
              <form:options items="${poleList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
            </form:select>
            <form:errors class="error-message" path="adherent.pole"/>
          </div>

          <div>
            <form:label path="adherent.telephone" class="text-xs"><spring:message code="label.telephone"/></form:label>
            <form:input
              class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.telephone" path="adherent.telephone"/>
            <form:errors class="error-message" path="adherent.telephone"/>
          </div>

          <div class="col-span-2">
            <form:label path="adherent.mail" class="text-xs"><spring:message code="label.mail"/></form:label>
            <form:input
              class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.mail" path="adherent.mail"/>
            <form:errors class="error-message" path="adherent.mail"/>
          </div>
        </div>
          
        <div class="grid grid-cols-2 gap-6">
          <div>
            <form:label class="text-xs" path="adherent.libelle"><spring:message code="label.nomRecherche"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.libelle" path="adherent.libelle"/>
            <form:errors class="error-message" path="adherent.libelle"/>
          </div>

          <div>
            <form:label class="text-xs" path="adherent.denomination"><spring:message code="label.denomination"/>
            </form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.denomination" path="adherent.denomination"/>
            <form:errors class="error-message" path="adherent.denomination"/>
          </div>
        </div>

        <div class="grid grid-cols-9 gap-6">
          <div class="col-span-2">
            <form:label class="text-xs" path="adherent.adresse"><spring:message code="label.adresse"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.adresse" path="adherent.adresse"/>
            <form:errors class="error-message" path="adherent.adresse"/>
          </div>

          <div class="col-span-2">
            <form:label class="text-xs" path="adherent.adresseComplement"><spring:message code="label.adresseComplement"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.adresseComplement" path="adherent.adresseComplement"/>
            <form:errors class="error-message" path="adherent.adresseComplement"/>
          </div>

          <div class="col-span-2">
            <form:label class="text-xs" path="adherent.commune">
              <spring:message code="label.commune"/>
              <div class="flex h-10 mt-0.5">
                <a type="button" data-modal-toggle="commune-modal" class="input-group-text inline-flex items-center px-3 text-gray-900 bg-gray-200 hover:bg-gray-300 rounded-l border border-r-0 border-gray-300"
                   href="#" id="editAdhCommune" data-toggle="modal"
                   data-target="#modal-adherentCommune">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"></path>
                  </svg>
                </a>
                <input type="text" id="communeAdhLibelle" disabled class="rounded-r bg-gray-50 text-sm border border-gray-300 text-gray-900 flex-1 min-w-0 border-gray-300" placeholder="">
              </div>
              <form:errors class="error-message" path="adherent.commune"/>
            </form:label>
          </div>

          <!-- Main modal -->
          <div id="commune-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full">
            <div class="relative p-4 w-full max-w-md h-full md:h-auto">
              <div class="relative bg-white rounded-lg shadow">
                <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="commune-modal">
                  <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                  </svg>
                  <span class="sr-only">Close modal</span>
                </button>
                <div class="py-6 px-6 lg:px-8">
                  <h3 class="mb-4 text-xl font-medium text-gray-900">Commune</h3>
                  <div class="space-y-6">
                    <div class="modal-body">
                      <label class="block mb-2 text-sm font-medium text-gray-900 ">Recherche</label>
                      <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" id="filterCPCommuneAdh" type="text" placeholder="Code postal ou Nom"/>
                      <br>
                      <form:label class="sr-only" path="adherent.commune"><spring:message code="label.commune"/></form:label>
                      <form:select id="communeAdhListe" class="block py-2.5 px-0 w-full text-sm text-black bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer" name="adherent.commune" path="adherent.commune.id">
                        <form:options items="${communeList}" itemValue="id" itemLabel="libelle"/>
                      </form:select>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                      <button type="button" id="valideAdhCommune" data-modal-toggle="commune-modal" class="w-full btn btn-green focus:ring-4 focus:outline-none focus:ring-blue-300">
                        Sélectionner
                      </button>
                      <button type="button" data-modal-toggle="commune-modal" class="w-full btn btn-red focus:ring-4 focus:outline-none focus:ring-blue-300">
                        Annuler
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
                      
          <div>
            <form:label path="adherent.latitude" class="text-xs"><spring:message code="label.latitude"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.latitude" path="adherent.latitude"/>
            <form:errors class="error-message" path="adherent.latitude"/>
          </div>

          <div>
            <form:label path="adherent.longitude" class="text-xs"><spring:message code="label.longitude"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
              name="adherent.longitude" path="adherent.longitude"/>
            <form:errors class="error-message" path="adherent.longitude"/>
          </div>  
          
          <div class="flex items-end justify-center items-center gap-1.5">
            <form:checkbox class="input-checkbox" path="adherent.isArtipole"/>  
            <form:label class="text-sm" path="adherent.isArtipole"><spring:message code="label.isArtipole"/></form:label>
          </div>
        </div>
      </div>
    </div>

    <!-- ADMINISTRATIF -->
    <div class="flex flex-col gap-4">
      <span class="text-2xl"><spring:message code="label.administratif"/></span>
      <div class="flex flex-col gap-6 ml-10">
        <div class="grid grid-cols-8 gap-6">
          <div>
            <form:label class="text-xs" path="adherent.dateEntree"><spring:message code="label.dateEntree"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        type="date" name="adherent.dateEntree" path="adherent.dateEntree"/>
            <form:errors class="error-message" path="adherent.dateEntree"/>
          </div>
          
          <div>
            <form:label class="text-xs" path="adherent.dateSortie"><spring:message code="label.dateSortie"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        type="date" name="adherent.dateSortie" path="adherent.dateSortie"/>
            <form:errors class="error-message" path="adherent.dateSortie"/>
          </div>

          <div class="truncate">
            <form:label class="text-xs" path="adherent.dateClotureExe"><spring:message code="label.dateClotureExe"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        type="date" name="adherent.dateClotureExe" path="adherent.dateClotureExe"/>
            <form:errors class="error-message" path="adherent.dateClotureExe"/>
          </div>

          <div class="truncate">
            <form:label class="text-xs" path="adherent.dateCreation"><spring:message code="label.dateCreation"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        type="date" name="adherent.dateCreation" path="adherent.dateCreation"/>
            <form:errors class="error-message" path="adherent.dateCreation"/>
          </div>

          <div>
            <form:label class="text-xs" path="adherent.role"><spring:message code="label.role"/></form:label>
            <form:select class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                         name="adherent.role" path="adherent.role.id">
              <form:options items="${roleList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
            </form:select>
            <form:errors class="error-message" path="adherent.role"/>
          </div>

          <div>
            <form:label class="text-xs" path="adherent.adherentType"><spring:message code="label.adherentType"/></form:label>
            <form:select class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                         name="adherent.adherentType" path="adherent.adherentType.id">
              <form:options items="${adherentTypeList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
            </form:select>
          </div>

          <div>
            <form:label class="text-xs" path="adherent.compteType"><spring:message code="label.compteType"/></form:label>
            <form:select class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                         name="adherent.compteType" path="adherent.compteType.id">
              <form:options items="${compteTypeList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
            </form:select>
          </div>

          <div>
            <form:label class="text-xs" path="adherent.etat"><spring:message code="label.etat"/></form:label>
            <form:select class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                         name="adherent.etat" path="adherent.etat.id">
              <form:options items="${etatList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
            </form:select>
          </div>
        </div>

        <div class="grid grid-cols-7 gap-6">
          <div>
            <form:label class="text-xs" path="adherent.formeJuridique"><spring:message code="label.formeJuridique"/></form:label>
            <form:select class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                         name="adherent.formeJuridique" path="adherent.formeJuridique.id">
              <form:options items="${formJuridList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
            </form:select>
            <form:errors class="error-message" path="adherent.formeJuridique"/>
          </div>

          <div class="col-span-2">
            <form:label class="text-xs" path="adherent.ape"><spring:message code="label.ape"/></form:label>
            <form:select class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                         name="adherent.ape" path="adherent.ape.id">
              <form:options items="${apeList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
            </form:select>
          </div>

          <div class="col-span-2">
            <form:label class="text-xs" path="adherent.FormationDirigeant"><spring:message code="label.formationCommerce"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        name="adherent.FormationDirigeant" path="adherent.FormationDirigeant"/>
            <form:errors class="error-message" path="adherent.FormationDirigeant"/>
          </div>
          
          <div>
            <form:label class="text-xs" path="adherent.nbSalaries"><spring:message code="label.nbSalaries"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        name="adherent.nbSalaries" path="adherent.nbSalaries"/>
            <form:errors class="error-message" path="adherent.nbSalaries"/>
          </div>

          <div class="flex items-end justify-center items-center gap-1.5">
            <form:checkbox class="input-checkbox" path="adherent.cnxEolasAllow" checked="checked"/>  
            <form:label class="text-sm" path="adherent.cnxEolasAllow"><spring:message code="label.cnxEolasAllow"/></form:label>
          </div>
        </div>

        <div class="grid grid-cols-9 gap-6">
          <div>
            <form:label class="text-xs" path="adherent.siren"><spring:message code="label.siren"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        name="adherent.siren" path="adherent.siren"/>
            <form:errors class="error-message" path="adherent.siren"/>
          </div>

          <div>
            <form:label class="text-xs" path="adherent.siret"><spring:message code="label.siret"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        name="adherent.siret" path="adherent.siret"/>
            <form:errors class="error-message" path="adherent.siret"/>
          </div>
          
          <div class="col-span-2">
            <form:label class="text-xs" path="adherent.numRepMetier"><spring:message code="label.numRepMetier"/></form:label>
            <form:input class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        name="adherent.numRepMetier" path="adherent.numRepMetier"/>
            <form:errors class="error-message" path="adherent.numRepMetier"/>
          </div>

          <div>
            <form:label class="text-xs" path="adherent.rcsRm"><spring:message code="label.rcsRm"/></form:label>
            <form:select class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                         name="adherent.rcsRm" path="adherent.rcsRm">
              <form:option value="" class="dark:bg-gray-600"></form:option>
              <form:option value="RCS" class="dark:bg-gray-600">RCS</form:option>
              <form:option value="RM" class="dark:bg-gray-600">RM</form:option>
            </form:select>
            <form:errors class="error-message" path="adherent.rcsRm"/>
          </div>

          <div class="col-span-2 items-end">
            <form:label code="label.rcsCommune" class="text-xs" path="adherent.rcsCommune">
              <spring:message code="label.rcsCommune"/>
              <div class="flex h-10 mt-0.5">
                <a type="button" data-modal-toggle="rcscommune-modal" class="input-group-text inline-flex items-center px-3 text-gray-900 bg-gray-200 hover:bg-gray-300 rounded-l border border-r-0 border-gray-300"
                   href="#" id="editRcsCommune" data-toggle="modal"
                   data-target="#modal-rcsCommune">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"></path>
                  </svg>
                </a>
                <input type="text" id="communeRCSLibelle" disabled class="rounded-r bg-gray-50 text-sm border border-gray-300 text-gray-900 flex-1 min-w-0 border-gray-300" placeholder="">
              </div>
              <form:errors class="error-message" path="adherent.rcsCommune"/>
            </form:label>
          </div>

          <!-- Main modal -->
          <div id="rcscommune-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full">
            <div class="relative p-4 w-full max-w-md h-full md:h-auto">
              <div class="relative bg-white rounded-lg shadow">
                <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="rcscommune-modal">
                  <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                  </svg>
                  <span class="sr-only">Close modal</span>
                </button>
                <div class="py-6 px-6 lg:px-8">
                  <h3 class="mb-4 text-xl font-medium text-gray-900">Commune</h3>
                  <div class="space-y-6">
                    <div class="modal-body">
                      <label class="block mb-2 text-sm font-medium text-gray-900 ">Recherche</label>
                      <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" id="filterCpRCSCommune" type="text" placeholder="Code postal ou Nom"/>
                      <br>
                      <form:label class="sr-only" path="adherent.rcsCommune"><spring:message code="label.commune"/></form:label>
                      <form:select id="communeRCSListe" class="block py-2.5 px-0 w-full text-sm text-black bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer" name="adherent.rcsCommune" path="adherent.rcsCommune.id">
                        <form:options items="${communeList}" itemValue="id" itemLabel="libelle"/>
                      </form:select>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                      <button type="button" data-dismiss="modal" id="valideRcsCommune" data-modal-toggle="rcscommune-modal" class="w-full btn btn-green focus:ring-4 focus:outline-none focus:ring-blue-300">
                        Sélectionner
                      </button>
                      <button type="button" data-modal-toggle="rcscommune-modal" class="w-full btn btn-red focus:ring-4 focus:outline-none focus:ring-blue-300">
                        Annuler
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-span-2 items-end">
            <form:label code="label.rmCommune" class="text-xs" path="adherent.rmCommune">
              <spring:message code="label.rmCommune"/>
              <div class="flex h-10 mt-0.5">
                <a type="button" data-modal-toggle="rmcommune-modal" class="input-group-text inline-flex items-center px-3 text-gray-900 bg-gray-200 hover:bg-gray-300 rounded-l border border-r-0 border-gray-300"
                   href="#" id="editRmCommune" data-toggle="modal"
                   data-target="#modal-rmCommune">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"></path>
                  </svg>
                </a>
                <input type="text" id="communeRMLibelle" disabled class="rounded-r bg-gray-50 text-sm border border-gray-300 text-gray-900 flex-1 min-w-0 border-gray-300" placeholder="">
              </div>
              <form:errors class="error-message" path="adherent.rmCommune"/>
            </form:label>
          </div>

          <!-- Main modal -->
          <div id="rmcommune-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full">
            <div class="relative p-4 w-full max-w-md h-full md:h-auto">
              <div class="relative bg-white rounded-lg shadow">
                <button type="button" class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="rmcommune-modal">
                  <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                  </svg>
                  <span class="sr-only">Close modal</span>
                </button>
                <div class="py-6 px-6 lg:px-8">
                  <h3 class="mb-4 text-xl font-medium text-gray-900">Commune</h3>
                  <div class="space-y-6">
                    <div class="modal-body">
                      <label class="block mb-2 text-sm font-medium text-gray-900 ">Recherche</label>
                      <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" id="filterCpRMCommune" type="text" placeholder="Code postal ou Nom"/>
                      <br>
                      <form:label class="sr-only" path="adherent.rmCommune"><spring:message code="label.commune"/></form:label>
                      <form:select id="communeRMListe" class="block py-2.5 px-0 w-full text-sm text-black bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer" name="adherent.rmCommune" path="adherent.rmCommune.id">
                        <form:options items="${communeList}" itemValue="id" itemLabel="libelle"/>
                      </form:select>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                      <button type="button" data-dismiss="modal" id="valideRmCommune" data-modal-toggle="rmcommune-modal" class="w-full btn btn-green focus:ring-4 focus:outline-none focus:ring-blue-300">
                        Sélectionner
                      </button>
                      <button type="button" data-modal-toggle="rmcommune-modal" class="w-full btn btn-red focus:ring-4 focus:outline-none focus:ring-blue-300">
                        Annuler
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- LOGISTIQUE -->
    <div class="flex flex-col gap-4">
      <span class="text-2xl"><spring:message code="label.exploitation"/></span>
      <div class="flex flex-col gap-6 ml-10">
        <div class="grid grid-cols-4 gap-6">
          <div>
            <form:label class="text-xs" path="adherent.agence"><spring:message code="label.agenceRattachement"/></form:label>
            <form:select class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
              name="adherent.agence" path="adherent.agence.id">
              <form:options items="${agenceList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
            </form:select>
            <form:errors class="error-message" path="adherent.agence"/>
          </div>

          <div>
            <form:label class="text-xs" path="adherent.secteur"><spring:message code="label.secteur"/></form:label>
            <form:select class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
              name="adherent.secteur" path="adherent.secteur.id">
              <form:options items="${secteurList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
            </form:select>
            <form:errors class="error-message" path="adherent.secteur"/>
          </div>

          <div>
            <form:label class="text-xs" path="adherent.tournee"><spring:message code="label.tournee"/></form:label>
            <form:select
              class="block py-2.5 px-1 w-full text-sm text-gray-900 dark:text-white bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
              name="adherent.tournee" path="adherent.tournee.id">
              <form:options items="${tourneeList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
            </form:select>
          </div>

          <div class="flex items-end justify-center items-center gap-1.5">
            <form:checkbox class="input-checkbox" path="adherent.isOutilDechargement"/>  
            <form:label class="text-sm" path="adherent.isOutilDechargement"><spring:message code="label.outilDechargement"/></form:label>
          </div>
        </div>
      </div>
    </div>

    <div class="flex justify-center gap-2">
      <c:url value="/listeAdherents" var="url"/>
      <button type="submit" class="btn btn-green focus:ring-4 focus:ring-blue-300 focus:outline-none">
        Enregistrer
      </button>
      <button type="reset" onClick="window.location = '${url}'" class="btn btn-red focus:outline-none focus:ring-4 focus:ring-red-300">
        Annuler
      </button>
    </div>
  </div>

</form:form>