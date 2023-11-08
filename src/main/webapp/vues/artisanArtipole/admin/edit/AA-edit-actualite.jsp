<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<c:url value="/AA-page-actualites" var="url"/>
<button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${url}'">
  Retour
</button>

<div>

  <form:form method="post" modelAttribute="editForm" action="AA-edit-actualite">    
    <form:input type="hidden" path="editAAActualite.id"/>

    <fieldset class="mx-auto justify-center">
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5">
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="titre">
            Titre
          </label>
        </div>
        <div class="w-3/5">
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200 text-black" type="text" name="editAAActualite.titre" path="editAAActualite.titre" id="titre"/>
          <form:errors class="error-message" path="editAAActualite.titre"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6 w-full">
        <div class="w-1/5">
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="contenu">
            Contenu
          </label>
        </div >
        <div class="w-3/5">
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200 text-black" type="text" name="editAAActualite.contenu" path="editAAActualite.contenu" id="contenu"/>
          <form:errors class="error-message" path="editAAActualite.contenu"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="type">
            Type
          </label>
        </div>
        <div class="w-3/5" >    
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200 text-black" type="text" name="editAAActualite.type" path="editAAActualite.type" id="type"/>
          <form:errors class="error-message" path="editAAActualite.type"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="sous_type">
            Sous type
          </label>
        </div>
        <div class="w-3/5" >    
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200 text-black" type="text" name="editAAActualite.sous_type" path="editAAActualite.sous_type" id="sous_type"/>
          <form:errors class="error-message" path="editAAActualite.sous_type"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="position">
            Position
          </label>
        </div>
        <div class="w-3/5" >
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200 text-black" type="text" name="editAAActualite.position" path="editAAActualite.position" id="position"/>
          <form:errors class="error-message" path="editAAActualite.position"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="date_ajout">
            Date d'ajout
          </label>
        </div>
        <div class="w-3/5" >
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200 text-black" type="date" name="editAAActualite.date_ajout" path="editAAActualite.date_ajout" id="date_ajout"/>
          <form:errors class="error-message" path="editAAActualite.date_ajout"/>
        </div>
      </div>
        
        <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="date_ajout">
            Associer l'actu à un adherent
          </label>
        </div>
        <div class="w-3/5" >
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200 text-black" type="number" name="editAAActualite.id_adherent" path="editAAActualite.id_adherent" id="id_adherent"/>
          <form:errors class="error-message" path="editAAActualite.id_adherent"/>
        </div>
      </div>
        
    </fieldset>

    <div class="mt-4 flex justify-center gap-2">
      <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer</button>
      <%--<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>--%>
      <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${url}'">Annuler</button>
    </div>
  </form:form>
</div>




