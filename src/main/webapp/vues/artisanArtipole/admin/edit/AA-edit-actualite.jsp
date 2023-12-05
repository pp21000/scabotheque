<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<c:url value="/AA-page-actualites" var="url"/>
<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${url}'">
  <spring:message code="label.retour"/>
</button>

<div>

  <form:form method="post" modelAttribute="editForm" action="AA-edit-actualite">    
    <form:input type="hidden" path="editAAActualite.id"/>
    <form:input type="hidden" path="editAAActualite.date_ajout"/>

    <fieldset class="mx-auto justify-center">
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="titre">
            Titre
          </label>
        </div>
        <div class="w-3/5">
          <form:input class="input-text w-full" type="text" name="editAAActualite.titre" path="editAAActualite.titre" id="titre"/>
          <form:errors class="error-message" path="editAAActualite.titre"/>
        </div>
      </div>
        
      <div class="md:flex md:items-center mb-6 w-full">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="contenu">
            Contenu
          </label>
        </div >
        <div class="w-3/5">
          <form:input class="input-text w-full" type="text" name="editAAActualite.contenu" path="editAAActualite.contenu" id="contenu"/>
          <form:errors class="error-message" path="editAAActualite.contenu"/>
        </div>
      </div>
        
      <div class="md:flex md:items-center mb-6 w-full">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="detail_contenu">
            Détail contenu
          </label>
        </div >
        <div class="w-3/5">
          <form:input class="input-text w-full" type="text" name="editAAActualite.detail_contenu" path="editAAActualite.detail_contenu" id="detail_contenu"/>
          <form:errors class="error-message" path="editAAActualite.detail_contenu"/>
        </div>
      </div>
        
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="type">
            Type
          </label>
        </div>
        <div class="w-3/5">    
          <form:input class="input-text w-96" type="text" name="editAAActualite.type" path="editAAActualite.type" id="type"/>
          <form:errors class="error-message" path="editAAActualite.type"/>
        </div>
      </div>
        
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="sous_type">
            Sous type
          </label>
        </div>
        <div class="w-3/5">    
          <form:input class="input-text w-96" type="text" name="editAAActualite.sous_type" path="editAAActualite.sous_type" id="sous_type"/>
          <form:errors class="error-message" path="editAAActualite.sous_type"/>
        </div>
      </div>
        
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="lien_url">
            Lien url
          </label>
        </div>
        <div class="w-3/5">    
          <form:input class="input-text w-96" type="text" name="editAAActualite.lien_url" path="editAAActualite.lien_url" id="lien_url"/>
          <form:errors class="error-message" path="editAAActualite.lien_url"/>
        </div>
      </div>
        
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="position">
            Position
          </label>
        </div>
        <div class="w-3/5">
          <form:input class="input-text w-12" type="text" name="editAAActualite.position" path="editAAActualite.position" id="position"/>
          <form:errors class="error-message" path="editAAActualite.position"/>
        </div>
      </div>
        
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="adherentId">
            Adhérent
          </label>
        </div>
        <div class="w-3/5">
          <form:select class="select2" data-placeholder="Toutes les agences" name="editAAActualite.adherentId" path="editAAActualite.adherentId">
            <form:option value="" label="Aucun (actualité générale)"></form:option>            
            <form:options items="${adherentsList}" itemValue="id" itemLabel="libelle"/>
          </form:select>   
          <form:errors class="error-message" path="editAAActualite.adherentId"/>
        </div>
      </div>
    </fieldset>

    <div class="mt-4 flex justify-center gap-2">
      <button type="submit" class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300">
        Enregistrer
      </button>
      <button type="reset" onClick="window.location = '${url}'" class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300">
        Annuler
      </button>
    </div>
  </form:form>
</div>




