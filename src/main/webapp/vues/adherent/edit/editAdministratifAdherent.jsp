<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script src="https://code.jquery.com/jquery-1.13.2.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>


<div class="flex w-full">
  <c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="administratif"/><c:param name="idAdh" value="${editForm.editAdherent.id}"/></c:url>
  <div class="w-1/12">
    <button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      <spring:message code="label.retour"/>
    </button>
  </div>
  <div class="w-5/6 flex justify-center items-center gap-2">
    <div class="flex items-center p-1.5 bg-gray-200 dark:bg-gray-600 rounded-2xl gap-2 min-w-[35rem]">
      <div class="w-1/2 flex justify-center gap-2">
        <span class="text-2xl"><spring:message code="label.administratif"/></span>
      </div>
      <div class="w-1/2 flex items-center gap-1">
        <c:choose>
          <c:when test="${empty adherent.photoImg}">
            <img class="rounded h-10" src="<c:url value="/resources/images/noAdhPhoto.png"/>"/>
          </c:when>
          <c:otherwise>
            <img class="rounded h-10" src="${adherent.photoImg}">
          </c:otherwise>
        </c:choose>
        <div class="w-full flex flex-col gap-0.5 truncate">
          <span class="font-semibold leading-none truncate">${editForm.editAdherent.denomination}</span>
          <div class="flex">
            <span class="bg-green-600 text-white text-xs font-medium px-2 py-0.5 mb-0.5 rounded">${editForm.editAdherent.code}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<form:form class="editAdherent" method="post" modelAttribute="editForm" action="editAdministratifAdh">

  <!-- Permet de ne pas perdre les données autres que celles modifiées -->
  <form:input type="hidden" name="editAdherent.id" path="editAdherent.id"/>
  <form:input type="hidden" name="editAdherent.code" path="editAdherent.code"/>
  <form:input type="hidden" name="editAdherent.codeERP" path="editAdherent.codeERP"/>
  <form:input type="hidden" name="editAdherent.codeERPParent" path="editAdherent.codeERPParent"/>
  <form:input type="hidden" name="editAdherent.libelle" path="editAdherent.libelle"/>
  <form:input type="hidden" name="editAdherent.denomination" path="editAdherent.denomination"/>
  <form:input type="hidden" name="editAdherent.adresse" path="editAdherent.adresse"/>
  <form:input type="hidden" name="editAdherent.adresseComplement" path="editAdherent.adresseComplement"/>
  <form:input type="hidden" path="editAdherent.commune.id"/>
  <form:input type="hidden" path="editAdherent.pole.id"/>
  <form:input type="hidden" path="editAdherent.agence.id"/>
  <form:input type="hidden" path="editAdherent.secteur.id"/>
  <form:input type="hidden" path="editAdherent.tournee.id"/>
  <form:input type="hidden" path="editAdherent.isOutilDechargement"/>
  <!-- données que je modifie plus bas dans cette page -->
  <%--<form:input type="hidden" path="editAdherent.dateCreation"/>--%>
  <%--<form:input type="hidden" path="editAdherent.dateEntree"/>--%>
  <%--<form:input type="hidden" path="editAdherent.dateSortie"/>--%>
  <%--<form:input type="hidden" path="editAdherent.etat.id"/>--%>
  <%--<form:input type="hidden" path="editAdherent.role"/>--%>
  <%--<form:input type="hidden" path="editAdherent.formeJuridique"/>--%>
  <%--<form:input type="hidden" path="editAdherent.siren"/>--%>
  <%--<form:input type="hidden" path="editAdherent.siret"/>--%>
  <%--<form:input type="hidden" path="editAdherent.ape"/>--%>
  <%--<form:input type="hidden" path="editAdherent.numRepMetier"/>--%>
  <%--<form:input type="hidden" path="editAdherent.rcsRm"/>--%>
  <%--<form:input type="hidden" path="editAdherent.rcsCommune"/>--%>
  <%--<form:input type="hidden" path="editAdherent.rmCommune"/>--%>
  <%--<form:input type="hidden" path="editAdherent.dateClotureExe"/>--%>
  <%--<form:input type="hidden" path="editAdherent.formationDirigeant"/>--%>
  <%--<form:input type="hidden" path="editAdherent.cnxEolasAllow"/>--%>
  <%--<form:input type="hidden" path="editAdherent.adherentType"/>--%>
  <%--<form:input type="hidden" path="editAdherent.compteType"/>--%>
  <form:input type="hidden" path="editAdherent.nbSalaries"/>
  <form:input type="hidden" path="editAdherent.latitude"/>
  <form:input type="hidden" path="editAdherent.longitude"/>
  <form:input type="hidden" path="editAdherent.telephone"/>
  <form:input type="hidden" path="editAdherent.mail"/>
  <form:input type="hidden" path="editAdherent.description_entreprise"/>
  <form:input type="hidden" path="editAdherent.description_activite"/>
  <form:input type="hidden" path="editAdherent.isArtipole"/>
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
  
  
  <fieldset class="flex flex-col gap-2 justify-center items-center mt-10">
    <div class="grid grid-cols-2 gap-2 w-full w-1/2">
        
      <div class="flex flex-col">
        <form:label path="editAdherent.role"><spring:message code="label.role"/></form:label>
        <form:select class="w-96 input-select" name="editAdherent.role" path="editAdherent.role.id">
          <form:options items="${roleList}" itemValue="id" itemLabel="libelle"/>
        </form:select>
        <form:errors class="error-message" path="editAdherent.role"/>
      </div>
      
      <div class="flex flex-col">
        <form:label path="editAdherent.dateEntree"><spring:message code="label.dateEntree"/></form:label>
        <form:input class="w-36 input-text" type="date" name="editAdherent.dateEntree" path="editAdherent.dateEntree"/>
        <form:errors class="error-message" path="editAdherent.dateEntree"/>
      </div>

      <div class="flex flex-col">
        <form:label path="editAdherent.adherentType"><spring:message code="label.adherentType"/></form:label>
        <form:select class="w-96 input-select" name="editAdherent.adherentType" path="editAdherent.adherentType.id">
          <form:options items="${adhTypesList}" itemValue="id" itemLabel="libelle"/>
        </form:select>
      </div>
        
      <div class="flex flex-col">
        <form:label path="editAdherent.dateSortie"><spring:message code="label.dateSortie"/></form:label>
        <form:input class="w-36 input-text" type="date" name="editAdherent.dateSortie" path="editAdherent.dateSortie"/>
        <form:errors class="error-message" path="editAdherent.dateSortie"/>
      </div>        

      <div class="flex flex-col">
        <form:label path="editAdherent.compteType"><spring:message code="label.reglement"/></form:label>
        <form:select class="w-96 input-select" name="editAdherent.compteType" path="editAdherent.compteType.id">
          <form:options items="${compteTypeList}" itemValue="id" itemLabel="libelle"/>
        </form:select>
      </div>
        
      <div class="flex flex-col">
        <form:label path="editAdherent.dateClotureExe"><spring:message code="label.dateClotureExe"/></form:label>
        <form:input class="w-36 input-text" type="date" name="editAdherent.dateClotureExe" path="editAdherent.dateClotureExe"/>
        <form:errors class="error-message" path="editAdherent.dateClotureExe"/>
      </div>

      <div class="flex flex-col">
        <form:label path="editAdherent.etat"><spring:message code="label.etat"/></form:label>
        <form:select class="w-96 input-select" name="editAdherent.etat" path="editAdherent.etat.id">
          <form:options items="${etatList}" itemValue="id" itemLabel="libelle"/>
        </form:select>
      </div>
        
      <div class="flex flex-col">
        <form:label path="editAdherent.dateCreation"><spring:message code="label.dateCreation"/></form:label>
        <form:input class="w-36 input-text" type="date" name="editAdherent.dateCreation" path="editAdherent.dateCreation"/>
        <form:errors class="error-message" path="editAdherent.dateCreation"/>
      </div>
        
      <div class="flex flex-col">
        <form:label path="editAdherent.formeJuridique"><spring:message code="label.formeJuridique"/></form:label>
        <form:select class="w-96 input-select" name="editAdherent.formeJuridique" path="editAdherent.formeJuridique.id">
          <form:options items="${formJuridList}" itemValue="id" itemLabel="libelle"/>
        </form:select>
      </div>

      <div class="flex flex-col">
        <form:label path="editAdherent.siren"><spring:message code="label.siren"/></form:label>
        <form:input class="w-96 input-text" name="editAdherent.siren" path="editAdherent.siren"/>
        <form:errors class="error-message" path="editAdherent.siren"/>
      </div>

      <div class="flex flex-col">
        <form:label path="editAdherent.ape"><spring:message code="label.ape"/></form:label>
        <form:select class="w-96 input-select" name="editAdherent.ape" path="editAdherent.ape.id">
          <form:options items="${apeList}" itemValue="id" itemLabel="libelle"/>
        </form:select>
      </div>

      <div class="flex flex-col">
        <form:label path="editAdherent.siret"><spring:message code="label.siret"/></form:label>
        <form:input class="w-96 input-text" name="editAdherent.siret" path="editAdherent.siret"/>
        <form:errors class="error-message" path="editAdherent.siret"/>
      </div>

      <div class="flex flex-col">
        <form:label path="editAdherent.nbSalaries"><spring:message code="label.nbSalaries"/></form:label>
        <form:input class="w-96 input-text" name="editAdherent.nbSalaries" path="editAdherent.nbSalaries"/>
        <form:errors class="error-message" path="editAdherent.nbSalaries"/>
      </div>

      <div class="flex flex-col">
        <form:label path="editAdherent.numRepMetier"><spring:message code="label.numRepMetier"/></form:label>
        <form:input class="w-96 input-text" name="editAdherent.numRepMetier" path="editAdherent.numRepMetier"/>
        <form:errors class="error-message" path="editAdherent.numRepMetier"/>
      </div>

      <div class="flex flex-col"> 
        <form:label path="editAdherent.rcsRm" ><spring:message code="label.rcsRm"/></form:label> 
        <form:select class="w-96 input-select" name="editAdherent.rcsRm" path="editAdherent.rcsRm">
          <form:option value=""></form:option>
          <form:option value="RCS">RCS</form:option>
          <form:option value="RM">RM</form:option>
        </form:select>
        <form:errors class="error-message" path="editAdherent.rcsRm" />
      </div> 
                  
      <div class="flex flex-col">
        <form:label path="editAdherent.formationDirigeant"><spring:message code="label.formationCommerce"/></form:label>
        <form:input class="w-96 input-text" name="editAdherent.formationDirigeant" path="editAdherent.formationDirigeant"/>
      </div>

      <div class="relative z-0 w-full group">
        <!--<div class="grid grid-cols-2 gap-2 w-full w-1/2">-->
        <form:label code="label.rcsCommune" path="editAdherent.rcsCommune">
          <spring:message code="label.rcsCommune"/>
          <div class="flex h-10 w-96">
            <a type="button" data-modal-toggle="rcscommune-modal" class="input-group-text inline-flex items-center px-3 text-gray-900 bg-gray-200 hover:bg-gray-300 rounded-l border border-r-0 border-gray-300" href="#" id="editRcsCommune" data-toggle="modal" data-target="#modal-rcsCommune">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"></path>
              </svg>
            </a>
            <input type="text" id="communeRCSLibelle" disabled class="rounded-r bg-gray-50 text-sm border border-gray-300 text-gray-900 flex-1 min-w-0 border-gray-300" placeholder="${editForm.editAdherent.rcsCommune.codePostal} - ${editForm.editAdherent.rcsCommune.libelle}">
          </div>
          <form:errors class="error-message" path="editAdherent.rcsCommune"/>
        </form:label>
      </div>

      <!-- Main modal RCS commune-->
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
              <h3 class="mb-4 text-xl font-medium text-gray-900"><spring:message code="label.rcsCommune"/></h3>
              <div class="space-y-6">
                <div class="modal-body">
                  <label class="block mb-2 text-sm font-medium text-gray-900 ">Recherche</label>
                  <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" id="filterCpRCSCommune" type="text" placeholder="Code postal ou Nom"/>
                  <br>
                  <form:label class="sr-only" path="editAdherent.rcsCommune"><spring:message code="label.commune"/></form:label>
                  <form:select id="communeRCSListe" class="block py-2.5 px-0 w-full text-sm text-black bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer" name="editAdherent.rcsCommune" path="editAdherent.rcsCommune.id">
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
      
      <div class="flex items-center">
        <form:checkbox class="mr-2 input-checkbox" path="editAdherent.cnxEolasAllow"/>
        <form:label path="editAdherent.cnxEolasAllow"><spring:message code="label.cnxEolasAllow"/></form:label>
      </div>
      
      <div class="relative z-0 w-full group">
        <!--<div class="grid grid-cols-2 gap-2 w-full w-1/2">-->
        <form:label code="label.rmCommune" path="editAdherent.rmCommune" >
          <spring:message code="label.rmCommune"/>
          <div class="flex h-10 w-96">
            <a type="button" data-modal-toggle="rmcommune-modal" class="input-group-text inline-flex items-center px-3 text-gray-900 bg-gray-200 hover:bg-gray-300 rounded-l border border-r-0 border-gray-300" href="#" id="editRmCommune" data-toggle="modal" data-target="#modal-rmCommune">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"></path>
              </svg>
            </a>
            <input type="text" id="communeRMLibelle" disabled class="rounded-r bg-gray-50 text-sm border border-gray-300 text-gray-900 flex-1 min-w-0 border-gray-300" placeholder="${editForm.editAdherent.rmCommune.codePostal} - ${editForm.editAdherent.rmCommune.libelle}">
          </div>
          <form:errors class="error-message" path="editAdherent.rmCommune"/>
        </form:label>
      </div>
              
      <!-- Main modal RM commune-->
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
              <h3 class="mb-4 text-xl font-medium text-gray-900"><spring:message code="label.rmCommune"/></h3>
              <div class="space-y-6">
                <div class="modal-body">
                  <label class="block mb-2 text-sm font-medium text-gray-900">Recherche</label>
                  <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" id="filterCpRMCommune" type="text" placeholder="Code postal ou Nom"/>
                  <br>
                  <form:label class="sr-only" path="editAdherent.rmCommune"><spring:message code="label.rmCommune"/></form:label>
                  <form:select id="communeRMListe" class="block py-2.5 px-0 w-full text-sm text-black bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer" name="editAdherent.rmCommune" path="editAdherent.rmCommune.id">
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
        
      <!--<div class="grid grid-cols-2 gap-2">-->
        <%--<form:label path="editAdherent.etat"><spring:message code="label.etat"/> :</form:label>--%>
        <%--<form:select--%>
          <!--class="flex py-2 px-4 w-96 input-select"-->
          <!--name="editAdherent.etat" path="editAdherent.etat.id">-->
          <%--<form:options items="${etatList}" itemValue="id" itemLabel="libelle"/>--%>
        <%--</form:select>--%>
      <!--</div>-->

  </fieldset>

  <fieldset class="flex justify-center mt-4">
    <legend class="text-center mt-4"><spring:message code="label.commentaire"/></legend>
    <form:textarea class="w-96 h-32 block input-textarea" id="summernote" name="editordata" path="commentaire"/>
  </fieldset>

  <div class="flex justify-center gap-2 mt-10">
    <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" id="save" type="submit">
      Enregistrer
    </button>
    <button class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      Annuler
    </button>
  </div>

</form:form>


