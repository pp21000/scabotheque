<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="flex w-full">
  <c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="logistique"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
  <div class="w-1/12">
    <button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      <spring:message code="label.retour"/>
    </button>
  </div>
  <div class="w-5/6 flex justify-center items-center gap-2">
    <div class="flex items-center p-1.5 bg-gray-200 dark:bg-gray-600 rounded-2xl gap-2 min-w-[35rem]">
      <div class="w-1/2 flex justify-center gap-2">
        <span class="text-2xl"><spring:message code="label.livraison"/></span>
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
          <span class="font-semibold leading-none truncate">${adherent.denomination}</span>
          <div class="flex">
            <span class="bg-green-600 text-white text-xs font-medium px-2 py-0.5 mb-0.5 rounded">${adherent.code}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<form:form class="" method="post" modelAttribute="editForm" action="editLivraisonAdh">
  <form:input type="hidden" path="editLogistiqueAdh.id"/>
  <form:input type="hidden" name="editLogistiqueAdh.adherentId" path="editLogistiqueAdh.adherentId"/>

  <fieldset class="flex justify-center mt-5">
    <div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-80 text-right">
          <span><spring:message code="label.agence"/></span>
        </div>
        <span class="text-black dark:text-white ml-2">${adherent.agence.libelle}</span>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-80 text-right">
          <span><spring:message code="label.secteur"/></span>
        </div>
        <span class="text-black dark:text-white ml-2">${adherent.secteur.libelle}</span>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-80 text-right">
          <span><spring:message code="label.tournee"/></span>
        </div>
        <span class="text-black dark:text-white ml-2">${adherent.tournee.libelle}</span>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-80 text-right">
          <form:label path="editLogistiqueAdh.adresseLivraison"><spring:message code="label.adresseLivraison"/></form:label>
        </div>
        <form:input class="w-96 input-text" name="editLogistiqueAdh.adresseLivraison" path="editLogistiqueAdh.adresseLivraison"/>
        <form:errors class="error-message" path="editLogistiqueAdh.adresseLivraison"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-80 text-right">
          <form:label path="editLogistiqueAdh.adresseComplement"><spring:message code="label.adresseComplement"/></form:label>
        </div>
        <form:input class="w-96 input-text" name="editLogistiqueAdh.adresseComplement" path="editLogistiqueAdh.adresseComplement"/>
        <form:errors class="error-message" path="editLogistiqueAdh.adresseComplement"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-80 text-right">
          <form:label path="editLogistiqueAdh.commune.libelle"><spring:message code="label.commune"/></form:label>
        </div>
        <form:label path="editLogistiqueAdh.commune">
          <div class="flex w-96 h-10">
            <a type="button" data-modal-toggle="commune-modal" class="input-group-text inline-flex items-center px-3 text-gray-900 bg-gray-200 hover:bg-gray-300 rounded-l border border-r-0 border-gray-300" href="#" id="editAdhCommune" data-toggle="modal" data-target="#modal-adherentCommune">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"></path>
              </svg>
            </a>
            <form:input id="communeAdhId" type="hidden" path="editLogistiqueAdh.commune.id"/>
            <form:input type="hidden" path="editLogistiqueAdh.commune.codePostal"/>
            <form:input type="hidden" path="editLogistiqueAdh.commune.libelle"/>

            <%--<spring:message code="message.commune" arguments="${editLogistiqueAdh.commune.codePostal}, ${editLogistiqueAdh.commune.libelle}"/>--%>
            <input type="text" id="communeAdhLibelle" disabled class="rounded-r bg-gray-50 text-sm border border-gray-300 text-gray-900 flex-1 min-w-0 border-gray-300"
                   placeholder="" value="${logistiqueAdh.commune.codePostal} - ${logistiqueAdh.commune.libelle}">
          </div>
        </form:label>
        <form:errors class="error-message" path="editLogistiqueAdh.commune"/>
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
                  <form:label class="sr-only" path="editLogistiqueAdh.Commune"><spring:message code="label.commune"/></form:label>
                  <form:select id="communeAdhListe" class="block py-2.5 px-0 w-full text-sm text-black bg-transparent border-0 border-b-2 border-gray-200 appearance-none focus:outline-none focus:ring-0 focus:border-gray-200 peer" name="editLogistiqueAdh.commune" path="editLogistiqueAdh.commune.id">
                    <form:options items="${communeList}" itemValue="id" itemLabel="libelle" class="ml-1"/>
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
        <div class="w-80 text-right">
          <form:label path="editLogistiqueAdh.contactReceptionId"><spring:message code="label.chargeReception"/></form:label>
        </div>
        <form:select class="w-72 input-select" name="editLogistiqueAdh.contactReceptionId" path="editLogistiqueAdh.contactReceptionId">
          <form:option value=""></form:option>
          <form:options items="${contacts}" itemValue="id" itemLabel="libelle"/>
        </form:select>
        <form:errors class="error-message" path="editLogistiqueAdh.contactReceptionId"/>
      </div>
      
      <div class="flex items-center mt-2 gap-2">
        <div class="w-80 text-right">
          <form:label path="editLogistiqueAdh.isAccesSemi"><spring:message code="label.accesSemi"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editLogistiqueAdh.isAccesSemi"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-80 text-right">
          <form:label path="editLogistiqueAdh.isMaterielDechargement"><spring:message code="label.materielDechargement"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editLogistiqueAdh.isMaterielDechargement"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class=" w-80 text-right">
          <form:label path="editLogistiqueAdh.isAuthorise"><spring:message code="label.autorisationOutils"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editLogistiqueAdh.isAuthorise"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-80 text-right">
          <form:label path="editLogistiqueAdh.outillageCommentaire"><spring:message code="label.commentaireMateriel"/></form:label>
        </div>
        <form:textarea class="w-96 h-32 block input-textarea" id="outillageCommentaire" name="editordata" path="editLogistiqueAdh.outillageCommentaire"/>
        <%--<form:input class="w-72 input-text" name="editLogistiqueAdh.outillageCommentaire" path="editLogistiqueAdh.outillageCommentaire"/>--%>
        <form:errors class="error-message" path="editLogistiqueAdh.outillageCommentaire"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-80 text-right">
          <form:label path="editLogistiqueAdh.protocolDechargement"><spring:message code="label.protocolDechargement"/></form:label>
        </div>
        <form:textarea class="w-96 h-32 block input-textarea" id="protocolDechargement" name="editordata" path="editLogistiqueAdh.protocolDechargement"/>
        <%--<form:input class="w-72 input-text"--%>
        <!--name="editLogistiqueAdh.adresseLivraison" path="editLogistiqueAdh.adresseLivraison"/>-->
        <form:errors class="error-message" path="editLogistiqueAdh.protocolDechargement"/>
      </div>
    </div>
  </fieldset>

<%--  <fieldset class="flex justify-center">
    <legend class="text-center mt-4"><spring:message code="label.commentaire"/></legend>
    <form:textarea class="w-96 h-32 block input-textarea" id="summernote" name="editordata" path="commentaire"/>
  </fieldset>--%>

  <div class="flex justify-center gap-2 mt-10">
    <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" id="save" type="submit">
      Enregistrer
    </button>
    <button class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      Annuler
    </button>
  </div>

</form:form>

      
<script>
  
  $(function () {
    $(document).ready(function () {
      $('#summernote').summernote({
        placeholder: '<spring:message code="label.commentaire"/>',
        tabsize: 2,
        height: 150
      });
    });
  });
  
</script>
