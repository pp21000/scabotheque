<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="contacts"/><c:param name="idAdh" value="${editForm.editAdherent.id}"/></c:url>
<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${urlPrev}'">
  <spring:message code="label.retour"/>
</button>

<form:form class="" method="post" modelAttribute="editForm" action="editIdentiteAdh?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
  <fieldset class="flex justify-center">

      <!-- Permet de ne pas perdre les données autres que celles modifiées -->
      <form:input type="hidden" name="editAdherent.id" path="editAdherent.id"/> 
      <form:input type="hidden" name="editAdherent.code" path="editAdherent.code"/> 
      <%--<form:input type="hidden" name="editAdherent.codeERP" path="editAdherent.codeERP"/>--%>
      <%--<form:input type="hidden" name="editAdherent.codeERPParent" path="editAdherent.codeERPParent"/>--%> 
      <%--<form:input type="hidden" name="adherent.libelle" path="adherent.libelle"/>--%>
      <%--<form:input type="hidden" name="adherent.denomination" path="adherent.denomination"/>--%>
      <%--<form:input type="hidden" name="adherent.adresse" path="adherent.adresse"/>--%>
      <%--<form:input type="hidden" name="adherent.adresseComplement" path="adherent.adresseComplement"/>--%>
      <%--<form:input type="hidden" path="adherent.commune.id"/>--%> 
      <%--<form:input type="hidden" path="adherent.pole.id"/> --%>
      <form:input type="hidden" path="editAdherent.agence.id"/>
      <form:input type="hidden" path="editAdherent.secteur.id"/>
      <form:input type="hidden" path="editAdherent.tournee.id"/>
      <form:input type="hidden" path="editAdherent.isOutilDechargement"/>
      <form:input type="hidden" path="editAdherent.dateCreation"/>
      <form:input type="hidden" path="editAdherent.dateEntree"/>
      <form:input type="hidden" path="editAdherent.dateSortie"/>
      <form:input type="hidden" path="editAdherent.role.id"/>
      <form:input type="hidden" path="editAdherent.formeJuridique.id"/>
      <form:input type="hidden" path="editAdherent.siren"/>
      <form:input type="hidden" path="editAdherent.siret"/>
      <form:input type="hidden" path="editAdherent.ape.id"/>
      <form:input type="hidden" path="editAdherent.numRepMetier"/>
      <form:input type="hidden" path="editAdherent.rcsRm"/>
      <form:input type="hidden" path="editAdherent.rcsCommune.id"/>
      <form:input type="hidden" path="editAdherent.rmCommune.id"/>
      <form:input type="hidden" path="editAdherent.dateClotureExe"/>
      <form:input type="hidden" path="editAdherent.formationDirigeant"/>
      <form:input type="hidden" path="editAdherent.cnxEolasAllow"/>
      <form:input type="hidden" path="editAdherent.etat.id"/>
      <form:input type="hidden" path="editAdherent.adherentType.id"/>
      <form:input type="hidden" path="editAdherent.compteType.id"/>
      <form:input type="hidden" path="editAdherent.description_entreprise"/>
      <form:input type="hidden" path="editAdherent.description_activite"/>
      <%--<form:input type="hidden" path="adherent.isArtipole"/> --%>
      <form:input type="hidden" path="editAdherent.isCharteArtipole"/>
      <form:input type="hidden" path="editAdherent.isFlocageArtipole"/>
      <form:input type="hidden" path="editAdherent.isWebArtipole"/>
      <form:input type="hidden" path="editAdherent.isFacebookArtipole"/>
      <form:input type="hidden" path="editAdherent.siteWeb"/>
      <form:input type="hidden" path="editAdherent.facebook"/>
      <form:input type="hidden" path="editAdherent.instagram"/>
      <form:input type="hidden" path="editAdherent.linkedin"/>
      <form:input type="hidden" path="editAdherent.youtube"/>
      <form:input type="hidden" path="editAdherent.pinterest"/>
      
      
      <div class="w-5/6">
        <div class="flex gap-20">
          <div class="flex flex-col w-2/5 rounded-3xl text-sm text-center bg-gray-200 dark:bg-gray-600 p-4">
            
            <div class="flex flex-col">
              <div class="text-xl font-bold">
                ${editForm.editAdherent.denomination}
              </div>
              <div class="flex justify-center">
                <div class="bg-green-600 text-white text-sm font-medium px-2 py-0.5 rounded">${editForm.editAdherent.code}</div>
              </div>
              <c:if test="${not empty adherent.codeERPParent}">
                <div class="flex justify-center items-center gap-1">
                  <div class="text-center text-sm"><spring:message code="label.codeERPParent"/> :</div>
                  <div class="bg-green-600 text-white text-xs font-medium px-1.5 py-0.5 rounded">${adherent.codeERPParent}</div>
                </div>
              </c:if> 
            </div> 
                
            <div class="flex flex-col flex-grow justify-evenly">
              <div class="flex flex-col gap-2">
                <c:choose>
                  <c:when test="${not empty adherent.logoImg}">
                    <div class="flex pr-10">
                      <div class="-rotate-90 flex items-center">
                        <span class="font-normal text-lg">Logo</span>
                      </div>                
                      <div class="w-full">
                        <img class="max-w-80 max-h-48 mx-auto" src="${adherent.logoImg}" alt="Logo de l'entreprise">
                      </div>
                    </div>
                  </c:when>
                  <c:otherwise>
                    <div class="text-xl my-2">
                      <spring:message code="label.noLogo"/>
                    </div>
                  </c:otherwise>
                </c:choose>
                <form:input path="editAdherent.fileLogo" class="mx-auto font-semibold" type="file" name="file" accept="image/x-png,image/gif,image/jpeg"/>
              </div>
              
              <div class="flex flex-col gap-2">
                <c:choose>
                  <c:when test="${not empty adherent.photoImg}">
                    <div class="flex pr-10">
                      <div class="-rotate-90 flex items-center">
                        <span class="font-normal text-lg">Photo</span>
                      </div>                
                      <div class="w-full">                
                        <img class="max-w-80 max-h-48 mx-auto" src="${adherent.photoImg}" alt="Photo de l'entreprise"/>
                      </div>
                    </div>
                  </c:when>
                    <c:otherwise>
                      <div class="text-xl my-2">
                        <spring:message code="label.noPhoto"/>
                      </div>
                    </c:otherwise>
                </c:choose>
                <form:input path="editAdherent.filePhoto" class="mx-auto font-semibold" type="file" name="file" accept="image/x-png,image/gif,image/jpeg"/>
              </div>
            </div>
          </div>

        <%--<form:form class="card" method="post" modelAttribute="editForm" action="editIdentiteAdh">--%>
        <%--<form:input class="card-header" type="hidden" path="adherent.id"/>--%>
        <%--<form:form class="" method="post" modelAttribute="editForm" action="editIdentiteAdh${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">--%>

          <div class="w-3/5">
            <fieldset>

              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.codeERP"><spring:message code="label.codeERP"/></form:label>
                </div>
                <form:input class="w-20 input-text" name="editAdherent.codeERP" path="editAdherent.codeERP"/>
                <form:errors class="error-message" path="editAdherent.codeERP"/>
              </div>


              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.codeERPParent"><spring:message code="label.codeERPParent"/></form:label>
                </div>
                <form:input class="w-20 input-text" name="editAdherent.codeERPParent" path="editAdherent.codeERPParent"/>
                <form:errors class="error-message" path="editAdherent.codeERPParent"/>
              </div>

              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.libelle"><spring:message code="label.libelle"/></form:label>
                </div>
                <form:input class="w-80 input-text" name="editAdherent.libelle" path="editAdherent.libelle"/>
                <form:errors class="error-message" path="editAdherent.libelle"/>
              </div>


              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.denomination"><spring:message code="label.denomination"/></form:label>
                </div>
                <form:input class="w-80 input-text" name="editAdherent.denomination" path="editAdherent.denomination"/>
                <form:errors class="error-message" path="editAdherent.denomination"/>
              </div>

              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.telephone"><spring:message code="label.telephone"/></form:label>
                </div>
                <form:input class="w-32 input-text" name="editAdherent.telephone" path="editAdherent.telephone"/>
                <form:errors class="error-message" path="editAdherent.telephone"/>
              </div>


              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.mail"><spring:message code="label.mail"/></form:label>
                </div>
                <form:input class="w-80 input-text" name="editAdherent.mail" path="editAdherent.mail"/>
                <form:errors class="error-message" path="editAdherent.mail"/>
              </div>

              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.adresse"><spring:message code="label.adresse"/></form:label>
                </div>
                <form:input class="w-80 input-text" name="editAdherent.adresse" path="editAdherent.adresse"/>
                <form:errors class="error-message" path="editAdherent.adresse"/>
              </div>


              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.adresseComplement"><spring:message code="label.adresseComplement"/></form:label>
                </div>
                <form:input class="w-80 input-text" name="editAdherent.adresseComplement" path="editAdherent.adresseComplement"/>
                <form:errors class="error-message" path="editAdherent.adresseComplement"/>
              </div>

              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.commune"><spring:message code="label.commune"/></form:label>
                </div>
                <form:label path="editAdherent.commune">
                  <div class="flex w-80 h-10">
                    <a type="button" data-modal-toggle="commune-modal" class="input-group-text inline-flex items-center px-3 text-gray-900 bg-gray-200 hover:bg-gray-300 rounded-l border border-r-0 border-gray-300" href="#" id="editAdhCommune" data-toggle="modal" data-target="#modal-adherentCommune">
                      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"></path>
                      </svg>
                    </a>
                    <form:input id="communeAdhId" type="hidden" path="editAdherent.commune.id"/>
                    <form:input type="hidden" path="editAdherent.commune.codePostal"/>
                    <form:input type="hidden" path="editAdherent.commune.libelle"/>
                    <input type="text" id="communeAdhLibelle" disabled class="rounded-r bg-gray-50 text-sm border border-gray-300 text-gray-900 flex-1 min-w-0 border-gray-300"
                           placeholder="" value="${editForm.editAdherent.commune.codePostal} - ${editForm.editAdherent.commune.libelle}">
                  </div>
                </form:label>
                <form:errors class="error-message" path="editAdherent.commune"/>
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
                          <form:label class="sr-only" path="editAdherent.rcsCommune"><spring:message code="label.commune"/></form:label>
                          <form:select id="communeAdhListe" class="block py-2.5 px-0 w-full text-sm text-black bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer" name="editAdherent.commune" path="editAdherent.commune.id">
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

              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.pole.id"><spring:message code="label.pole"/></form:label>
                </div>
                <form:select class=" input-select" name="editAdherent.pole" path="editAdherent.pole.id">
                  <form:option value=""></form:option>
                  <form:options items="${poleList}" itemValue="id" itemLabel="libelle"/>
                </form:select>
                <form:errors class="error-message" path="editAdherent.pole"/>
              </div>

              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.isArtipole"><spring:message code="label.adhArtipole"/></form:label>
                </div>
                <form:checkbox class="input-checkbox" path="editAdherent.isArtipole"/>
              </div>

              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.latitude"><spring:message code="label.latitude"/></form:label>
                </div>
                <form:input class="w-32 input-text" name="editAdherent.latitude" path="editAdherent.latitude"/>
                <form:errors class="error-message" path="editAdherent.latitude"/>
              </div>

              <div class="flex items-center mt-2 gap-2">
                <div class="w-64 text-right">
                  <form:label path="editAdherent.longitude"><spring:message code="label.longitude"/></form:label>
                </div>
                <form:input class="w-32 input-text" name="editAdherent.longitude" path="editAdherent.longitude"/>
                <form:errors class="error-message" path="editAdherent.longitude"/>
              </div>
            </fieldset>
          </div>    
        </div>

        <div class="mt-10 flex gap-2 justify-center">
          <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" id="save" type="submit">
            Enregistrer
          </button>
          <button class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${urlPrev}'">
            Annuler
          </button>
        </div>
      </div>
      
</form:form>





