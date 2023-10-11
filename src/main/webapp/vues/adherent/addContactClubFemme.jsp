<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<h1 class="text-3xl text-center"><spring:message code="label.addContactClubFemme"/></h1>

<form:form class="content" method="post" modelAttribute="addContactForm" action="addContactClubFemme">
  <div class="mx-16">
    <div class="col-md-6">
      <div class="card card-secondary">
        <div class="mb-6">
          <div class="text-2xl">Adherent de référence</div>
        </div>
        <form:select class="form-control select2" name="editContactClubFemme.adherentId" data-placeholder="Adhérent de référence" path="editContactClubFemme.adherentId" >
          <form:option value="" label="-"  />
          <form:options items="${listAdherents}"  />
        </form:select>
        <form:errors class="text-red-600 animate-pulse" path="editContactClubFemme.adherentId"/>
      </div>
      <div class="card card-secondary">
        <div class="mb-6">
          <div class="text-2xl"><spring:message code="label.identite"/></div>
        </div>
        <div class="card-body">
          <div class="grid px-4 md:grid-cols-4 md:gap-6">
            <div class="relative z-0 mb-6 w-full group">
              <form:label path="editContactClubFemme.civilite"><spring:message code="label.civilite"/></form:label>
              <form:select class="valeur" name="contact.civilite" path="editContactClubFemme.civilite">
                <form:options items="${civilite}"/>
                <%--<form:option selected="true" value="Mme" />--%>
              </form:select>
              <form:errors class="error" path="editContactClubFemme.civilite"/>

            </div>   
            <div class="relative z-0 mb-6 w-full group">
              <form:label path="editContactClubFemme.nom"
                          class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"><spring:message
                  code="label.nom"/></form:label>
              <form:input
                class="form-control block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="editContactClubFemme.nom" path="editContactClubFemme.nom" autofocus="true"/>
              <form:errors class="text-red-600 animate-pulse" path="editContactClubFemme.nom"/>
            </div>

            <div class="relative z-0 mb-6 w-full group">
              <form:label path="editContactClubFemme.prenom"
                          class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"><spring:message
                  code="label.prenom"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="editContactClubFemme.prenom" path="editContactClubFemme.prenom"/>
              <form:errors class="text-red-600 animate-pulse" path="editContactClubFemme.prenom"/>
            </div>

            <div class="relative z-0 mb-6 w-full group">
              <form:label path="editContactClubFemme.fixe"
                          class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"><spring:message
                  code="label.fixe"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="editContactClubFemme.fixe" path="editContactClubFemme.fixe"/>
              <form:errors class="text-red-600 animate-pulse" path="editContactClubFemme.fixe"/>
            </div>
          </div>
          <div class="grid px-4 md:grid-cols-2 md:gap-6">
            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                path="editContactClubFemme.mobile"><spring:message code="label.mobile"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="editContactClubFemme.mobile" path="editContactClubFemme.mobile"/>
              <form:errors class="text-red-600 animate-pulse" path="editContactClubFemme.mobile"/>
            </div>

            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                path="editContactClubFemme.mail"><spring:message code="label.mail"/>
              </form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="editContactClubFemme.mail" path="editContactClubFemme.mail"/>
              <form:errors class="text-red-600 animate-pulse" path="editContactClubFemme.mail"/>
            </div>
          </div>
            
                      <div class="grid px-4 md:grid-cols-3 md:gap-6">
            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                path="editContactClubFemme.adresse"><spring:message code="label.adresse"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="editContactClubFemme.adresse" path="editContactClubFemme.adresse"/>
              <form:errors class="text-red-600 animate-pulse" path="editContactClubFemme.adresse"/>
            </div>
            <div class="relative z-0 mb-6 w-full group">
              <form:label class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                          path="editContactClubFemme.adresseComplement"><spring:message code="label.adresseComplement"/></form:label>
              <form:input class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                          name="editContactClubFemme.adresseComplement" path="editContactClubFemme.adresseComplement"/>
              <form:errors class="text-red-600 animate-pulse" path="editContactClubFemme.adresseComplement"/>
            </div>
            <div class="relative z-0 mb-6 w-full group">
              <form:label class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                          path="editContactClubFemme.commune">
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
                  <input type="text" id="communeAdhLibelle" disabled class="rounded-none text-lg rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-5"
                         placeholder="<spring:message code="label.commune"/>">
                </div>
                <form:errors class="text-red-600 animate-pulse" path="editContactClubFemme.commune"/>
              </form:label>
            </div>
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
                      <form:label class="sr-only" path="editContactClubFemme.commune"><spring:message code="label.commune"/></form:label>
                      <form:select id="communeAdhListe"
                                   class="block py-2.5 px-0 w-full text-sm text-gray-500 bg-transparent border-0 border-b-2 border-gray-200 appearance-none   focus:outline-none focus:ring-0 focus:border-gray-200 peer"
                                   name="editContactClubFemme.commune"
                                   path="editContactClubFemme.commune.id">
                        <form:options items="${communeList}" itemValue="id" itemLabel="libelle"/>
                      </form:select>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                      <button type="button" id="valideAdhCommune" data-modal-toggle="commune-modal"
                              class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center  ">
                        Selectionner
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
            
          <div class="grid px-4 md:grid-cols-3 md:gap-6">
            <div class="relative z-0 mb-6 w-full group">
              <form:label
                class="peer-focus:font-medium absolute text-sm text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                path="editContactClubFemme.commentaire"><spring:message code="label.commentaire"/></form:label>
              <form:input
                class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                name="editContactClubFemme.commentaire" path="editContactClubFemme.commentaire"/>
              <form:errors class="text-red-600 animate-pulse" path="editContactClubFemme.commentaire"/>
            </div>
          </div>
        </div>


      </div>
      <!-- /.card-body -->
    </div>
    <!-- /.card -->
    <div class="flex justify-center">
      <div class="col-12">
        <a href="#"
           class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2">Annuler</a>
        <input type="submit" value="Création"
               class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 focus:outline-none">
      </div>
    </div>
  </div>
</form:form>        