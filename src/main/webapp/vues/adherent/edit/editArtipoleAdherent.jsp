<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="flex w-full">
  <c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="artipole"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
  <div class="w-1/12">
    <button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      <spring:message code="label.retour"/>
    </button>
  </div>
  <div class="w-5/6 flex justify-center items-center gap-2">
    <div class="flex items-center p-1.5 bg-gray-200 dark:bg-gray-600 rounded-2xl gap-2 min-w-[35rem]">
      <div class="w-1/2 flex justify-center gap-2">
        <span class="text-2xl"><spring:message code="label.artipole"/></span>
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

<form:form method="post" modelAttribute="editForm" action="editArtipoleAdh">

  <!-- Permet de ne pas perdre les données autres que celles modifiées -->
  <form:input type="hidden" path="editAdherent.id"/>
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
  <form:input type="hidden" path="editAdherent.dateCreation"/>
  <form:input type="hidden" path="editAdherent.dateEntree"/>
  <form:input type="hidden" path="editAdherent.dateSortie"/>
  <form:input type="hidden" path="editAdherent.etat.id"/>
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
  <form:input type="hidden" path="editAdherent.adherentType.id"/>
  <form:input type="hidden" path="editAdherent.compteType.id"/>
  <form:input type="hidden" path="editAdherent.nbSalaries"/>
  <form:input type="hidden" path="editAdherent.latitude"/>
  <form:input type="hidden" path="editAdherent.longitude"/>
  <form:input type="hidden" path="editAdherent.telephone"/>
  <form:input type="hidden" path="editAdherent.mail"/>
  <!-- données que je modifie plus bas dans cette page -->
  <%--<form:input type="hidden" path="editAdherent.description_activite"/>--%>
  <%--<form:input type="hidden" path="editAdherent.description_entreprise"/>--%>
  <%--<form:input type="hidden" path="editAdherent.isArtipole"/>--%>
  <%--<form:input type="hidden" path="editAdherent.isCharteArtipole"/>--%>
  <%--<form:input type="hidden" path="editAdherent.isFlocageArtipole"/>--%>
  <%--<form:input type="hidden" path="editAdherent.isWebArtipole"/>--%>
  <%--<form:input type="hidden" path="editAdherent.isFacebookArtipole"/>--%>
  <%--<form:input type="hidden" path="editAdherent.siteWeb"/>--%>
  <%--<form:input type="hidden" path="editAdherent.facebook"/>--%>
  <%--<form:input type="hidden" path="editAdherent.instagram"/>--%>
  <%--<form:input type="hidden" path="editAdherent.linkedin"/>--%>
  <%--<form:input type="hidden" path="editAdherent.youtube"/>--%>
  <%--<form:input type="hidden" path="editAdherent.pinterest"/>--%>
  

  <fieldset class="flex justify-center mt-10">
    <div class="w-3/4">

      <div class="flex items-center mt-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.isArtipole"><spring:message code="label.isArtipole"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editAdherent.isArtipole"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.isArtipole"><spring:message code="label.charteArtipole"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editAdherent.isCharteArtipole"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.isArtipole"><spring:message code="label.flocageArtipole"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editAdherent.isFlocageArtipole"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.isArtipole"><spring:message code="label.siteArtipole"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editAdherent.isWebArtipole"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.isArtipole"><spring:message code="label.facebookArtipole"/></form:label>
        </div>
        <form:checkbox class="input-checkbox" path="editAdherent.isFacebookArtipole"/>
      </div>

      <div class="flex items-center mt-6 gap-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.siteWeb"><spring:message code="label.siteWeb"/></form:label>
        </div>
        <form:input class="w-[550] input-text" name="editAdherent.siteWeb" path="editAdherent.siteWeb"/>
        <form:errors class="error-message" path="editAdherent.siteWeb"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.facebook"><spring:message code="label.facebook"/></form:label>
        </div>
        <form:input class="w-[550] input-text" name="editAdherent.facebook" path="editAdherent.facebook"/>
        <form:errors class="error-message" path="editAdherent.facebook"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.instagram"><spring:message code="label.instagram"/></form:label>
        </div>
        <form:input class="w-[550] input-text" name="editAdherent.instagram" path="editAdherent.instagram"/>
        <form:errors class="error-message" path="editAdherent.instagram"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.linkedin"><spring:message code="label.linkedin"/></form:label>
        </div>
        <form:input class="w-[550] input-text" name="editAdherent.linkedin" path="editAdherent.linkedin"/>
        <form:errors class="error-message" path="editAdherent.linkedin"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.youtube"><spring:message code="label.youtube"/></form:label>
        </div>
        <form:input class="w-[550] input-text" name="editAdherent.youtube" path="editAdherent.youtube"/>
        <form:errors class="error-message" path="editAdherent.youtube"/>
      </div>

      <div class="flex items-center mt-2 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.pinterest"><spring:message code="label.pinterest"/></form:label>
        </div>
        <form:input class="w-[550] input-text" name="editAdherent.pinterest" path="editAdherent.pinterest"/>
        <form:errors class="error-message" path="editAdherent.pinterest"/>
      </div>


      <div class="flex items-center mt-6 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.description_entreprise"><spring:message code="label.description_entreprise"/></form:label>
        </div>
        <form:textarea class="w-3/4 h-52 input-textarea" name="editordata" path="editAdherent.description_entreprise"/>
      </div>

      <div class="flex items-center mt-4 gap-2">
        <div class="w-56 text-right">
        <form:label path="editAdherent.description_entreprise"><spring:message code="label.description_activite"/></form:label>
          </div> 
        <form:textarea class="w-3/4 h-52 block input-textarea" name="editordata" path="editAdherent.description_activite"/>
      </div>

      <div class="flex items-center mt-4 gap-2">
        <div class="w-56 text-right">
          <form:label path="editAdherent.description_entreprise"><spring:message code="label.commentaire"/></form:label>
        </div>
        <form:textarea class="w-3/4 h-18 block input-textarea" id="summernote" name="editordata" path="commentaire"/>
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