<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adhToEdit.editAdherent.id}"/></c:url>
  <button class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 focus:outline-none"
          type="reset" onClick="window.location = '${url}'">Retour
</button>

<div class="flex justify-center">
  <div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
    <div>
      <c:choose>
        <c:when test="${adhToEdit.editAdherent.photo == ''}">
          <img class="rounded-full" src="<c:url value="/resources/images/noAdh.png" />"/>
        </c:when>
        <c:otherwise>
          <img class="rounded-full" src="${adhToEdit.editAdherent.photo}">
        </c:otherwise>
      </c:choose>
    </div>
    <div class="flex flex-col">
      <div class="text-center text-lg font-semibold">
        ${adhToEdit.editAdherent.denomination}
      </div>
      <div class="text-center text-sm">
        <spring:message code="label.codeAdh"/> :
        ${adhToEdit.editAdherent.code}
      </div>
    </div>
  </div>
</div>

<form:form method="post" modelAttribute="adhToEdit" action="editArtipoleAdh">
  <form:input type="hidden" path="editAdherent.id"/>

  <!-- Permet de ne pas perdre les données autre que celles modifié -->
  <form:input type="hidden" name="editAdherent.code" path="editAdherent.code"/>
  <form:input type="hidden" name="editAdherent.code" path="editAdherent.codeERP"/>
  <form:input type="hidden" name="editAdherent.codeParent" path="editAdherent.codeERPParent"/>
  <form:input type="hidden" name="editAdherent.libelle" path="editAdherent.libelle"/>
  <form:input type="hidden" name="editAdherent.denomination" path="editAdherent.denomination"/>
  <form:input type="hidden" name="editAdherent.adresse" path="editAdherent.adresse"/>
  <form:input type="hidden" name="editAdherent.adresseComplement" path="editAdherent.adresseComplement"/>
  <form:input type="hidden" path="editAdherent.commune.id"/>
  <form:input type="hidden" path="editAdherent.pole.id"/>
  <%-- 	<form:input type="hidden" path="adherent.isArtipole"/> --%>
  <%-- 	<form:input type="hidden" path="adherent.isCharteArtipole"/> --%>
  <%-- 	<form:input type="hidden" path="adherent.isFlocageArtipole"/> --%>
  <%-- 	<form:input type="hidden" path="adherent.isWebArtipole"/> --%>
  <%-- 	<form:input type="hidden" path="adherent.isFacebookArtipole"/> --%>

  <%--<form:input type="hidden" path="adherent.siteWeb"/>--%>
  <%--<form:input type="hidden" path="adherent.Facebook"/>--%>
  <%--<form:input type="hidden" path="adherent.Instagram"/>--%>
  <%--<form:input type="hidden" path="adherent.Linkedin"/>--%>
  <%--<form:input type="hidden" path="adherent.Youtube"/>--%>
  <%--<form:input type="hidden" path="adherent.Pinterest"/>--%>

  <form:input type="hidden" path="editAdherent.agence.id"/>
  <form:input type="hidden" path="editAdherent.secteur.id"/>
  <form:input type="hidden" path="editAdherent.tournee.id"/>
  <form:input type="hidden" path="editAdherent.isOutilDechargement"/>
  <form:input type="hidden" path="editAdherent.dateEntree"/>
  <form:input type="hidden" path="editAdherent.dateCreation"/>
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
  <%--<form:input type="hidden" path="adherent.contactComptable"/>--%>
  <form:input type="hidden" path="editAdherent.formationDirigeant"/>
  <form:input type="hidden" path="editAdherent.cnxEolasAllow"/>
  <form:input type="hidden" path="editAdherent.etat.id"/>
  <form:input type="hidden" path="editAdherent.adherentType.id"/>
  <form:input type="hidden" path="editAdherent.compteType.id"/>

  <fieldset class="flex justify-center">
    <div>
      <legend class="text-center mt-4 mb-2 underline"><spring:message code="label.artipole"/></legend>

      <div class="flex items-center mt-2">
        <div class="w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.isArtipole"><spring:message code="label.adhArtipole"/></form:label>
          </div>
        <form:checkbox class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500  focus:ring-2 " path="editAdherent.isArtipole"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.isArtipole"><spring:message code="label.charteArtipole"/></form:label>
          </div>
        <form:checkbox class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500  focus:ring-2 " path="editAdherent.isCharteArtipole"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.isArtipole"><spring:message code="label.flocageArtipole"/></form:label>
          </div>
        <form:checkbox class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500  focus:ring-2 " path="editAdherent.isFlocageArtipole"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.isArtipole"><spring:message code="label.siteArtipole"/></form:label>
          </div>
        <form:checkbox class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500  focus:ring-2 " path="editAdherent.isWebArtipole"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.isArtipole"><spring:message code="label.facebookArtipole"/></form:label>
          </div>
        <form:checkbox class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500  focus:ring-2 " path="editAdherent.isFacebookArtipole"/>
      </div>


      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.siteWeb"><spring:message code="label.siteWeb"/></form:label>
          </div>
        <form:input class="flex-grow py-2 px-4 w-96 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"
                    name="editAdherent.siteWeb" path="editAdherent.siteWeb"/>
        <b><i><form:errors path="editAdherent.siteWeb"/></i></b>
      </div>

      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.facebook"><spring:message code="label.facebook"/></form:label>
          </div>
        <form:input class="flex-grow py-2 px-4 w-96 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"
                    name="editAdherent.facebook" path="editAdherent.facebook"/>
        <b><i><form:errors path="editAdherent.facebook"/></i></b>
      </div>

      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.instagram"><spring:message code="label.instagram"/></form:label>
          </div>
        <form:input class="flex-grow py-2 px-4 w-96 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"
                    name="editAdherent.instagram" path="editAdherent.instagram"/>
        <b><i><form:errors path="editAdherent.instagram"/></i></b>
      </div>

      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.linkedin"><spring:message code="label.linkedin"/></form:label>
          </div>
        <form:input class="flex-grow py-2 px-4 w-96 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"
                    name="editAdherent.linkedin" path="editAdherent.linkedin"/>
        <b><i><form:errors path="editAdherent.linkedin"/></i></b>
      </div>

      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.youtube"><spring:message code="label.youtube"/></form:label>
          </div>
        <form:input class="flex-grow py-2 px-4 w-96 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"
                    name="editAdherent.youtube" path="editAdherent.youtube"/>
        <b><i><form:errors path="editAdherent.youtube"/></i></b>
      </div>

      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mx-2">
          <form:label class="flex items-center mt-2 text-left" path="editAdherent.pinterest"><spring:message code="label.pinterest"/></form:label>
          </div>
        <form:input class="flex-grow py-2 px-4 w-96 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"
                    name="editAdherent.pinterest" path="editAdherent.pinterest"/>
        <b><i><form:errors path="editAdherent.pinterest"/></i></b>
      </div>

    </div>
  </fieldset>

  <fieldset class="flex justify-center">
    <legend class="text-center mt-4 mb-2 underline"><spring:message code="label.description_entreprise"/></legend>
    <form:textarea class="w-96 h-32 block text-sm text-gray-900 rounded-lg border border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editordata" path="editAdherent.description_entreprise"/>
  </fieldset>

  <fieldset class="flex justify-center">
    <legend class="text-center mt-4 mb-2 underline"><spring:message code="label.description_activite"/></legend>
    <form:textarea class="w-96 h-32 block text-sm text-gray-900 rounded-lg border border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"  name="editordata" path="editAdherent.description_activite"/>
  </fieldset>


  <fieldset class="flex justify-center">
    <legend class="text-center mt-4 mb-2 underline"><spring:message code="label.commentaire"/></legend>
    <form:textarea class="w-96 h-32 block text-sm text-gray-900 rounded-lg border border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" id="summernote" name="editordata" path="commentaire"/>
  </fieldset>

  <div class="flex justify-center gap-2 mt-2">
    <button class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 focus:outline-none"
            type="submit">Enregistrer
    </button>
    <c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adhToEdit.editAdherent.id}"/></c:url>
      <button class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2"
              type="reset" onClick="window.location = '${url}'">Annuler </button>
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