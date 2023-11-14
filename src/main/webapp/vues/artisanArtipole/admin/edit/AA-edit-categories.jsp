<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>



  <c:url value="/AA-page-listes" var="url"/>
  <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
          type="reset" onClick="window.location = '${url}'">< Retour
  </button>

<div class="flex flex-col items-center">

  <div class="w-full text-right">
    <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" 
            id="addBtn" type="button" onclick="showNewForm()">Ajouter une Catégorie</button>
  </div>

  <form:form class="hidden w-2/3" method="post" modelAttribute="addForm" action="AA-add-categorie">
    <div class="" id="addForm" title="Ajouter une Catégorie">
      <fieldset>
        <div>
          <div class="flex items-center mt-2 text-right">
            <div class="w-32 mx-2">
              <form:label path="addCategorie.libelle">Libellé</form:label>
              </div>
            <form:input class="py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="addCategorie.libelle" path="addCategorie.libelle"/>
            <form:errors class="error-message" path="addCategorie.libelle"/>
          </div>
        </div>
      </fieldset>
    </div>

    <div class="text-center my-10">
      <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer la categorie</button>
    </div>

  </form:form>        



  <form:form class="w-full" method="post" modelAttribute="editForm" action="AA-edit-categories">    

    <c:forEach items="${editForm.editCategories}" var="edit" varStatus="status">
      <form:input type="hidden" path="editCategories[${status.index}].id"/>

      <fieldset class="mx-auto justify-center">
        <div class="flex items-center mb-6">
          <div class="w-32" >
            <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="libelle">
              Libellé
            </label>
          </div>
          <div class="w-1/5" >
            <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200 text-black" type="text" name="editCategories[${status.index}].libelle" path="editCategories[${status.index}].libelle" id="libelle"/>
            <form:errors class="error-message" path="editCategories[${status.index}].libelle"/>
          </div>
        </div>
      </fieldset>


    </c:forEach>
    <div class="mt-4 flex justify-center gap-2">
      <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer les modifications</button>
      <%--<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>--%>
      <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${url}'">Annuler</button>
    </div>
  </div>


</form:form>

<script>
  $(function () {

    $("#addBtn").click(function (e) {
//      alert("test");
      $("#addForm").toggle('slow');
    });
  });

  function showNewForm() {
    $("#addForm").toggle('quick');
  }

</script>
