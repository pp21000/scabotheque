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
            id="addBtn" type="button" onclick="showNewForm()">Ajouter un Métier</button>
  </div>

  <form:form class="hidden w-2/3" method="post" modelAttribute="addForm" action="AA-add-metier">
    <div class="" id="addForm" title="Ajouter un Metier">
      <fieldset>
        <div>
          <div class="flex items-center mt-2 text-right">
            <div class="w-32 mx-2">
              <form:label path="addMetier.libelle">Libellé</form:label>
              </div>
            <form:input class="py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="addMetier.libelle" path="addMetier.libelle"/>
            <form:errors class="error" path="addMetier.libelle"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="w-32 mx-2">
              <form:label path="addMetier.description">Description</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="addMetier.description" path="addMetier.description"/>
            <form:errors class="error" path="addMetier.description"/>
          </div>
        </div>
      </fieldset>
    </div>

    <div class="text-center my-10">
      <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer le metier</button>
    </div>

  </form:form>        



  <form:form class="w-full p-5" method="post" modelAttribute="editForm" action="AA-edit-metiers">    

    <c:forEach items="${editForm.metiers}" var="edit" varStatus="status">
      <form:input type="hidden" path="editMetiers[${status.index}].id"/>

      <fieldset class="mx-auto justify-center">
        <div class="flex items-center mb-6">
          <div class="w-32" >
            <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="libelle">
              Libellé
            </label>
          </div>
          <div class="w-1/5" >
            <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200" type="text" name="editMetiers[${status.index}].libelle" path="editMetiers[${status.index}].libelle" id="libelle"/>
            <form:errors path="editMetiers[${status.index}].libelle"/>
          </div>
<!--        </div>
        <div class="flex items-center mb-6">-->
          <div class="w-32" >
            <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="libelle">
              Description
            </label>
          </div>
          <div class="flex-1" >
            <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200" type="text" name="editMetiers[${status.index}].description" path="editMetiers[${status.index}].description" id="description"/>
            <form:errors path="editMetiers[${status.index}].description"/>
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
    $("#addForm").toggle('slow');
  }

</script>
