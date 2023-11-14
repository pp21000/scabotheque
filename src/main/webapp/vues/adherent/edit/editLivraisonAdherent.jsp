<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adhToEdit.adherent.id}"/></c:url>
  <button class="px-3 py-2 text-xs font-medium text-center text-white bg-neutral-700 rounded-lg hover:bg-neutral-800 focus:ring-4 focus:outline-none focus:ring-neutral-300"
          id="cancel" type="reset" onClick="window.location = '${url}'">Retour
</button>

<div class="flex flex-col items-center">
  <div class="flex justify-center">
    <div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
      <div>
        <c:choose>
          <c:when test="${adhToEdit.adherent.photo == ''}">
            <img class="rounded-full" src="<c:url value="/resources/images/noAdh.png" />"/>
          </c:when>
          <c:otherwise>
            <img class="rounded-full" src="${adhToEdit.adherent.photo}">
          </c:otherwise>
        </c:choose>
      </div>
      <div class="flex flex-col">
        <div class="text-center text-lg font-semibold">
          ${adhToEdit.adherent.denomination}
        </div>
        <div class="text-center text-sm">
          <spring:message code="label.codeAdh"/> :
          ${adhToEdit.adherent.code}
        </div>
      </div>
    </div>
  </div>


  <form:form class="editAdherent" method="post" modelAttribute="adhToEdit" action="editExploitationAdh">
    <form:input type="hidden" path="adherent.id"/>

    <!-- Permet de ne pas perdre les données autre que celles modifié -->
    <form:input type="hidden" name="adherent.code" path="adherent.code"/>
    <form:input type="hidden" name="adherent.code" path="adherent.codeERP"/>
    <form:input type="hidden" name="adherent.codeParent" path="adherent.codeERPParent"/>
    <form:input type="hidden" name="adherent.libelle" path="adherent.libelle"/>
    <form:input type="hidden" name="adherent.denomination" path="adherent.denomination"/>
    <form:input type="hidden" name="adherent.adresse" path="adherent.adresse"/>
    <form:input type="hidden" name="adherent.adresseComplement" path="adherent.adresseComplement"/>
    <form:input type="hidden" path="adherent.commune.id"/>
    <form:input type="hidden" path="adherent.pole.id"/>
    <form:input type="hidden" path="adherent.isArtipole"/>
    <form:input type="hidden" path="adherent.isCharteArtipole"/>
    <form:input type="hidden" path="adherent.isFlocageArtipole"/>
    <form:input type="hidden" path="adherent.isWebArtipole"/>
    <form:input type="hidden" path="adherent.isFacebookArtipole"/>

    <form:input type="hidden" path="adherent.siteWeb"/>
    <form:input type="hidden" path="adherent.facebook"/>
    <form:input type="hidden" path="adherent.instagram"/>
    <form:input type="hidden" path="adherent.linkedin"/>
    <form:input type="hidden" path="adherent.youtube"/>
    <form:input type="hidden" path="adherent.pinterest"/>

    <%-- 	<form:input type="hidden" path="adherent.agence.id"/> --%>
    <%-- 	<form:input type="hidden" path="adherent.secteur.id"/> --%>
    <%-- 	<form:input type="hidden" path="adherent.tournee.id"/> --%>
    <%-- 	<form:input type="hidden" path="adherent.isOutilDechargement"/> --%>
    <form:input type="hidden" path="adherent.dateEntree"/>
    <form:input type="hidden" path="adherent.dateCreation"/>
    <form:input type="hidden" path="adherent.dateSortie"/>
    <form:input type="hidden" path="adherent.role.id"/>
    <form:input type="hidden" path="adherent.formeJuridique.id"/>
    <form:input type="hidden" path="adherent.siren"/>
    <form:input type="hidden" path="adherent.siret"/>
    <form:input type="hidden" path="adherent.ape.id"/>
    <form:input type="hidden" path="adherent.numRepMetier"/>
    <form:input type="hidden" path="adherent.rcsRm"/>
    <form:input type="hidden" path="adherent.rcsCommune.id"/>
    <form:input type="hidden" path="adherent.rmCommune.id"/>
    <form:input type="hidden" path="adherent.dateClotureExe"/>
    <%--<form:input type="hidden" path="adherent.contactComptable"/>--%>
    <form:input type="hidden" path="adherent.formationDirigeant"/>
    <form:input type="hidden" path="adherent.cnxEolasAllow"/>
    <form:input type="hidden" path="adherent.etat.id"/>
    <form:input type="hidden" path="adherent.adherentType.id"/>
    <form:input type="hidden" path="adherent.compteType.id"/>
    <form:input type="hidden" path="adherent.description_entreprise"/>
    <form:input type="hidden" path="adherent.description_activite"/>


    <fieldset>
      <%--            <legend class="legend"><spring:message code="label.exploitation"/></legend>--%>

      <div class="flex items-center mt-2 text-center">
        <div class="flex-grow w-32 mx-2">
          <form:label path="adherent.agence"><spring:message code="label.agenceRattachement"/></form:label>
          </div>
        <form:select
          class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"
          name="adherent.agence" path="adherent.agence.id">
          <form:options items="${agenceList}" itemValue="id" itemLabel="libelle"/>
        </form:select>
      </div>

      <div class="flex items-center mt-2 text-center">
        <div class="flex-grow w-32  mx-2">
          <form:label path="adherent.secteur"><spring:message code="label.secteur"/></form:label></div>
          <form:select
            class="flex-grow justify-center py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"
            name="adherent.secteur" path="adherent.secteur.id">
            <form:options items="${secteurList}" itemValue="id" itemLabel="libelle"/>
          </form:select>
      </div>

      <div class="flex items-center mt-2 text-center">
        <div class="flex-grow w-32  mx-2">
          <form:label path="adherent.tournee"><spring:message code="label.tournee"/></form:label></div>
          <form:select
            class="flex-grow flex py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"
            name="adherent.tournee" path="adherent.tournee.id">
            <form:options items="${tourneeList}" itemValue="id" itemLabel="libelle"/>
          </form:select>
      </div>

      <div class="flex items-center mx-2 mt-2 text-center">
        <form:label path="adherent.isOutilDechargement"><spring:message
            code="label.outilDechargement"/></form:label>
        <form:checkbox
          class="mx-2 w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500 focus:ring-2"
          path="adherent.isOutilDechargement"/>
      </div>
    </fieldset>

    <%--	<fieldset>--%>
    <%--	   	<legend class="legend"><spring:message code="label.commentaire"/></legend>--%>
    <%--		<form:textarea id="summernote" name="editordata" path="commentaire"/>--%>
    <%--	</fieldset>--%>

    <div class="flex justify-center gap-2 mt-2">
      <button class="px-3 py-2 text-xs font-medium text-center text-white bg-neutral-700 rounded-lg hover:bg-neutral-800 focus:ring-4 focus:outline-none focus:ring-neutral-300"
              id="save" type="submit">Enregistrer
      </button>
      <c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adhToEdit.adherent.id}"/></c:url>
        <button class="px-3 py-2 text-xs font-medium text-center text-white bg-neutral-700 rounded-lg hover:bg-neutral-800 focus:ring-4 focus:outline-none focus:ring-neutral-300"
                id="cancel" type="reset" onClick="window.location = '${url}'">Annuler
      </button>
    </div>

  </form:form>
</div>
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
