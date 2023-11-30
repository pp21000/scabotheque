<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="artipole"/><c:param name="idAdh" value="${editForm.editAdherent.id}"/></c:url>

<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${urlPrev}'">
  <spring:message code="label.retour"/>
</button>

<div class="flex justify-center">
  <div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
    <div>
      <c:choose>
        <c:when test="${editForm.editAdherent.photo == ''}">
          <img class="rounded-full h-32" src="<c:url value="/resources/images/noAdh.png" />"/>
        </c:when>
        <c:otherwise>
          <img class="rounded-full h-32" src="${editForm.editAdherent.photo}">
        </c:otherwise>
      </c:choose>
    </div>
    <div class="flex flex-col">
      <div class="text-center text-lg font-semibold">
        ${editForm.editAdherent.denomination}
      </div>
      <div class="text-center text-sm">
        <spring:message code="label.codeAdh"/> : ${editForm.editAdherent.code}
       
      </div>
    </div>
  </div>
</div>

<form:form method="post" modelAttribute="editForm" action="editArtipoleAdh">
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

  <fieldset class="flex justify-center mt-10">
    <div>
      <%--<legend class="text-center mt-4"><spring:message code="label.artipole"/></legend>--%>

      <div class="flex items-center mt-2">
        <div class="w-56 mr-2 text-right">
          <form:label path="editAdherent.isArtipole"><spring:message code="label.adhArtipole"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editAdherent.isArtipole"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="w-56 mr-2 text-right">
          <form:label path="editAdherent.isArtipole"><spring:message code="label.charteArtipole"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editAdherent.isCharteArtipole"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="w-56 mr-2 text-right">
          <form:label path="editAdherent.isArtipole"><spring:message code="label.flocageArtipole"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editAdherent.isFlocageArtipole"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="w-56 mr-2 text-right">
          <form:label path="editAdherent.isArtipole"><spring:message code="label.siteArtipole"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editAdherent.isWebArtipole"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="w-56 mr-2 text-right">
          <form:label path="editAdherent.isArtipole"><spring:message code="label.facebookArtipole"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editAdherent.isFacebookArtipole"/>
      </div>

      <div class="flex items-center mt-4">
        <div class="flex-grow w-56 mr-2 text-right">
          <form:label path="editAdherent.siteWeb"><spring:message code="label.siteWeb"/></form:label>
        </div>
        <form:input class="flex-grow w-96 input-text"
                    name="editAdherent.siteWeb" path="editAdherent.siteWeb"/>
        <form:errors class="error-message" path="editAdherent.siteWeb"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mr-2 text-right">
          <form:label path="editAdherent.facebook"><spring:message code="label.facebook"/></form:label>
        </div>
        <form:input class="flex-grow w-96 input-text"
                    name="editAdherent.facebook" path="editAdherent.facebook"/>
        <form:errors class="error-message" path="editAdherent.facebook"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mr-2 text-right">
          <form:label path="editAdherent.instagram"><spring:message code="label.instagram"/></form:label>
        </div>
        <form:input class="flex-grow w-96 input-text"
                    name="editAdherent.instagram" path="editAdherent.instagram"/>
        <form:errors class="error-message" path="editAdherent.instagram"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mr-2 text-right">
          <form:label path="editAdherent.linkedin"><spring:message code="label.linkedin"/></form:label>
        </div>
        <form:input class="flex-grow w-96 input-text"
                    name="editAdherent.linkedin" path="editAdherent.linkedin"/>
        <form:errors class="error-message" path="editAdherent.linkedin"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mr-2 text-right">
          <form:label path="editAdherent.youtube"><spring:message code="label.youtube"/></form:label>
        </div>
        <form:input class="flex-grow w-96 input-text"
                    name="editAdherent.youtube" path="editAdherent.youtube"/>
        <form:errors class="error-message" path="editAdherent.youtube"/>
      </div>

      <div class="flex items-center mt-2">
        <div class="flex-grow w-56 mr-2 text-right">
          <form:label path="editAdherent.pinterest"><spring:message code="label.pinterest"/></form:label>
        </div>
        <form:input class="flex-grow w-96 input-text"
                    name="editAdherent.pinterest" path="editAdherent.pinterest"/>
        <form:errors class="error-message" path="editAdherent.pinterest"/>
      </div>


      <div class="flex items-center mt-4">
        <div class="flex-grow w-56 mr-2 text-right">
          <form:label path="editAdherent.description_entreprise"><spring:message code="label.description_entreprise"/></form:label>
        </div>
        <form:textarea class="flex-grow w-96 h-32 input-textarea" name="editordata" path="editAdherent.description_entreprise"/>
      </div>

      <div class="flex items-center mt-4">
        <div class="flex-grow w-56 mr-2 text-right">
        <form:label path="editAdherent.description_entreprise"><spring:message code="label.description_activite"/></form:label>
          </div> 
        <form:textarea class="w-96 h-32 block input-textarea" name="editordata" path="editAdherent.description_activite"/>
      </div>

      <div class="flex items-center mt-4">
        <div class="flex-grow w-56 mr-2 text-right">
          <form:label path="editAdherent.description_entreprise"><spring:message code="label.commentaire"/></form:label>
        </div>
        <form:textarea class="w-96 h-32 block input-textarea" id="summernote" name="editordata" path="commentaire"/>
      </div>

      <div class="flex justify-center gap-2 mt-10">
        <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">
          Enregistrer
        </button>
        <button class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${urlPrev}'">
          Annuler 
        </button>
      </div>
        
    </div> 
  </fieldset>
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