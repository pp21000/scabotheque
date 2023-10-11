<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<h1 class="text-3xl text-center"><spring:message code="label.addAdherent"/></h1>

<form:form class="content" method="post" modelAttribute="adhToAdd" action="addAdherent">
  <form:input type="hidden" path="adherent.id"/>
  <form:input id="communeRCSId" type="hidden" path="adherent.rcsCommune.id"/>
  <form:input id="communeRMId" type="hidden" path="adherent.rmCommune.id"/>

  <div class="mx-16">
    <div class="col-md-6">
      <div class="card card-secondary">
        <div class="mb-6">
          <div class="text-2xl"><spring:message code="label.identite"/></div>
        </div>
        <div class="card-body">
          <div class="grid px-4 md:grid-cols-3 md:gap-6">
            <div class="relative z-0 mb-6 w-full group">
              <form:label path="adherent.code" class="text-xs"><spring:message code="label.codeAdh"/></form:label>
              <form:input
                class="form-control block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.code" path="adherent.code" autofocus="true"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.code"/>
            </div>

            <div class="relative z-0 mb-6 w-full group">
              <form:label path="adherent.codeERP" class="text-xs"><spring:message code="label.codeERP"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.codeERP" path="adherent.codeERP"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.codeERP"/>
            </div>

            <div class="relative z-0 mb-6 w-full group">
              <form:label path="adherent.codeERPParent" class="text-xs"><spring:message code="label.codeERPParent"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.codeERPParent" path="adherent.codeERPParent"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.codeERPParent"/>
            </div>
          </div>
          <div class="grid px-4 md:grid-cols-2 md:gap-6">
            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="text-xs"
                path="adherent.libelle"><spring:message code="label.nomRecherche"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.libelle" path="adherent.libelle"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.libelle"/>
            </div>

            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="text-xs"
                path="adherent.denomination"><spring:message code="label.denomination"/>
              </form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.denomination" path="adherent.denomination"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.denomination"/>
            </div>
          </div>
          <div class="grid px-4 md:grid-cols-3 md:gap-6">
            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="text-xs"
                path="adherent.adresse"><spring:message code="label.adresse"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.adresse" path="adherent.adresse"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.adresse"/>
            </div>

            <div class="relative z-0 mb-6 w-full group">
              <form:label class="text-xs" path="adherent.adresseComplement"><spring:message code="label.adresseComplement"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.adresseComplement"
                path="adherent.adresseComplement"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.adresseComplement"/>
            </div>

            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="text-xs"
                path="adherent.commune">
                <div class="flex">
                  <div class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300   ">
                    <a type="button" data-modal-toggle="commune-modal" class="input-group-text"
                       href="#" id="editAdhCommune" data-toggle="modal"
                       data-target="#modal-adherentCommune">
                      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                           xmlns="http://www.w3.org/2000/svg">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"></path>
                      </svg>
                    </a>
                  </div>
                  <input type="text" id="communeAdhLibelle" disabled
                         class="rounded-none text-lg rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-5"
                         placeholder="<spring:message code="label.commune"/>">
                </div>
                <form:errors class="text-red-600 animate-pulse" path="adherent.commune"/>
              </form:label>
            </div>

            <!-- Main modal -->
            <div id="commune-modal" tabindex="-1" aria-hidden="true"
                 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full">
              <div class="relative p-4 w-full max-w-md h-full md:h-auto">
                <div class="relative bg-white rounded-lg shadow ">
                  <button type="button"
                          class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center  "
                          data-modal-toggle="commune-modal">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                          clip-rule="evenodd"></path>
                    </svg>
                    <span class="sr-only">Close modal</span>
                  </button>
                  <div class="py-6 px-6 lg:px-8">
                    <h3 class="mb-4 text-xl font-medium text-gray-900 ">Commune</h3>
                    <div class="space-y-6">
                      <div class="modal-body">
                        <label class="block mb-2 text-sm font-medium text-gray-900 ">Recherche</label>
                        <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 "
                               id="filterCPCommuneAdh" type="text"
                               placeholder="Code postal ou Nom"/>
                        <br>
                        <form:label class="sr-only" path="adherent.rcsCommune"><spring:message
                            code="label.commune"/></form:label>
                        <form:select id="communeAdhListe"
                                     class="block py-2.5 px-0 w-full text-sm text-gray-500 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                                     name="adherent.commune"
                                     path="adherent.commune.id">
                          <form:options items="${communeList}" itemValue="id"
                                        itemLabel="libelle"/>
                        </form:select>
                      </div>
                      <div class="grid grid-cols-2 gap-4">
                        <button type="button" id="valideAdhCommune"
                                data-modal-toggle="commune-modal"
                                class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center  ">
                          Sélectionner
                        </button>
                        <button type="button" data-modal-toggle="commune-modal"
                                class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center  ">
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

      <div class="card card-secondary">
        <div class="mt-10 mb-6">
          <div class="text-2xl"><spring:message code="label.exploitation"/></div>
        </div>
        <div class="card-body">
          <div class="grid px-4 grid-cols-3 gap-6">
            <div class="form-group">
              <form:label class="text-xs" path="adherent.agence"><spring:message
                  code="label.agenceRattachement"/></form:label>
              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.agence" path="adherent.agence.id">
                <form:options items="${agenceList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
              </form:select>
              <form:errors class="text-red-600 animate-pulse" path="adherent.agence"/>
            </div>

            <div class="form-group">
              <form:label class="text-xs"
                          path="adherent.secteur"><spring:message code="label.secteur"/></form:label>
              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.secteur" path="adherent.secteur.id">
                <form:option value="" class="dark:bg-gray-600"></form:option>
                <form:options items="${secteurList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
              </form:select>
              <form:errors class="text-red-600 animate-pulse" path="adherent.secteur"/>
            </div>
            <div class="form-group">
              <form:label class="text-xs"
                          path="adherent.tournee"><spring:message code="label.tournee"/></form:label>
              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.tournee" path="adherent.tournee.id">
                <form:options items="${tourneeList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
              </form:select>
            </div>
          </div>

          <div class="form-group">
            <form:label class="text-xs"
                        path="adherent.isOutilDechargement"><spring:message code="label.outilDechargement"/></form:label>
            <form:checkbox
              class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500   focus:ring-2  "
              path="adherent.isOutilDechargement"/>
          </div>


        </div>
        <!-- /.card-body -->
      </div>

    </div>


    <div class="col-md-6">
      <div class="card card-secondary">
        <div class="mt-10 mb-6">
          <div class="text-2xl"><spring:message code="label.administratif"/></div>
        </div>
        <div class="card-body">
          <div class="grid px-4 grid-cols-4 gap-6">
            <div class="form-group">
              <form:label class="text-xs"
                          path="adherent.dateEntree"><spring:message code="label.dateEntree"/></form:label>
              <form:input class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                          type="date" name="adherent.dateEntree"
                          path="adherent.dateEntree"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.dateEntree"/>
            </div>

            <div class="form-group">
              <form:label class="text-xs" path="adherent.role"><spring:message code="label.role"/></form:label>
              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.role" path="adherent.role.id">
                <form:options items="${roleList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
              </form:select>
              <form:errors class="text-red-600 animate-pulse" path="adherent.role"/>
            </div>

            <div class="form-group">
              <form:label class="text-xs"
                          path="adherent.pole"><spring:message code="label.pole"/></form:label>
              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.pole" path="adherent.pole.id">
                <form:options items="${poleList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
              </form:select>
              <form:errors class="text-red-600 animate-pulse" path="adherent.role"/>
            </div>
            <div class="form-group">
              <form:label class="text-xs" path="adherent.formeJuridique"><spring:message
                  code="label.formeJuridique"/></form:label>
              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.formeJuridique"
                path="adherent.formeJuridique.id">
                <form:options items="${formJuridList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
              </form:select>
              <form:errors class="text-red-600 animate-pulse" path="adherent.formeJuridique"/>
            </div>

          </div>
          <div class="grid px-4 grid-cols-3 gap-6 mt-6">

            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="text-xs"
                path="adherent.siren"><spring:message code="label.siren"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.siren" path="adherent.siren"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.siren"/>
            </div>

            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="text-xs"
                path="adherent.siret"><spring:message code="label.siret"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.siret" path="adherent.siret"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.siret"/>
            </div>
            <div class="form-group">
              <form:label class="text-xs"
                          path="adherent.ape"><spring:message code="label.ape"/></form:label>
              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.ape" path="adherent.ape.id">
                <form:options items="${apeList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
              </form:select>
            </div>
          </div>
          <div class="grid px-4 grid-cols-4 gap-6">

            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="text-xs"
                path="adherent.numRepMetier"><spring:message
                  code="label.numRepMetier"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.numRepMetier" path="adherent.numRepMetier"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.numRepMetier"/>
            </div>


            <div class="form-group">
              <form:label class="text-xs"
                          path="adherent.rcsRm"><spring:message code="label.rcsRm"/></form:label>

              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.rcsRm" path="adherent.rcsRm">
                <form:option value="" class="dark:bg-gray-600"></form:option>
                <form:option value="RCS" class="dark:bg-gray-600">RCS</form:option>
                <form:option value="RM" class="dark:bg-gray-600">RM</form:option>
              </form:select>
              <form:errors class="text-red-600 animate-pulse" path="adherent.rcsRm"/>
            </div>

            <div class="form-group">
              <form:label class="text-xs" path="adherent.dateClotureExe"><spring:message code="label.dateClotureExe"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                type="date" name="adherent.dateClotureExe"
                path="adherent.dateClotureExe"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.dateClotureExe"/>
            </div>

            <div class="relative z-0 mb-6 w-full group">
              <form:label code="label.rcsCommune" class="text-xs" path="adherent.rcsCommune">
                <div class="flex">
                  <div class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300   ">
                    <a type="button" data-modal-toggle="rcscommune-modal" class="input-group-text"
                       href="#" id="editRcsCommune" data-toggle="modal"
                       data-target="#modal-rcsCommune">
                      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                           xmlns="http://www.w3.org/2000/svg">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"></path>
                      </svg>
                    </a>
                  </div>
                  <input type="text" id="communeRCSLibelle" disabled
                         class="rounded-none text-lg rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-5"
                         placeholder="<spring:message code="label.rcsCommune"/>">
                </div>
                <form:errors class="text-red-600 animate-pulse" path="adherent.rcsCommune"/>
              </form:label>
            </div>

            <!-- Main modal -->
            <div id="rcscommune-modal" tabindex="-1" aria-hidden="true"
                 class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full">
              <div class="relative p-4 w-full max-w-md h-full md:h-auto">
                <div class="relative bg-white rounded-lg shadow ">
                  <button type="button"
                          class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center  "
                          data-modal-toggle="rcscommune-modal">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                          clip-rule="evenodd"></path>
                    </svg>
                    <span class="sr-only">Close modal</span>
                  </button>
                  <div class="py-6 px-6 lg:px-8">
                    <h3 class="mb-4 text-xl font-medium text-gray-900 ">Commune</h3>
                    <div class="space-y-6">
                      <div class="modal-body">
                        <label class="block mb-2 text-sm font-medium text-gray-900 ">Recherche</label>
                        <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 "
                               id="filterCpRCSCommune" type="text"
                               placeholder="Code postal ou Nom"/>
                        <br>
                        <form:label class="sr-only" path="adherent.rcsCommune"><spring:message
                            code="label.commune"/></form:label>
                        <form:select id="communeRCSListe"
                                     class="block py-2.5 px-0 w-full text-sm text-gray-500 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                                     name="adherent.rcsCommune" path="adherent.rcsCommune.id">
                          <form:options items="${communeList}" itemValue="id"
                                        itemLabel="libelle"/>
                        </form:select>
                      </div>
                      <div class="grid px-4 grid-cols-2 gap-4">
                        <button type="button" data-dismiss="modal" id="valideRcsCommune"
                                data-modal-toggle="rcscommune-modal"
                                class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center  ">
                          Selectionner
                        </button>
                        <button type="button" data-modal-toggle="rcscommune-modal"
                                class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center  ">
                          Annuler
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="grid grid-cols-4 gap-6 px-4">
            <div class="relative z-0 mb-6 w-full group">
              <form:label class="text-xs" path="adherent.FormationDirigeant"><spring:message code="label.formationCommerce"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="adherent.FormationDirigeant"
                path="adherent.FormationDirigeant"/>
              <form:errors class="text-red-600 animate-pulse" path="adherent.FormationDirigeant"/>
            </div>

            <div class="form-group">
              <form:label class="text-xs" path="adherent.etat"><spring:message
                  code="label.etat"/></form:label>
              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.etat" path="adherent.etat.id">
                <form:options items="${etatList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
              </form:select>
            </div>

            <div class="form-group">
              <form:label class="text-xs" path="adherent.adherentType"><spring:message
                  code="label.adherentType"/></form:label>
              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.adherentType" path="adherent.adherentType.id">
                <form:options items="${adherentTypeList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
              </form:select>
            </div>

            <div class="form-group">
              <form:label class="text-xs" path="adherent.compteType"><spring:message
                  code="label.compteStatut"/></form:label>
              <form:select
                class="block py-2.5 px-0 w-full text-sm text-gray-900 dark:text-gray-50 bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                name="adherent.compteType" path="adherent.compteType.id">
                <form:options items="${compteTypeList}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
              </form:select>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>

    <div class="flex justify-center">
      <div class="col-12">
        <c:url value="/listeAdherents" var="url"/>
        <input type="reset" value="Annuler" onClick="window.location = '${url}'" class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2">
        <!--<a href="#" class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2">Annuler</a>-->
        <input type="submit" value="Création" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 focus:outline-none">
      </div>
    </div>
  </div>

</form:form>