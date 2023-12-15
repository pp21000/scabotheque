<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<c:url value="/AA-page-metiers" var="url"/>
<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${url}'">
  <spring:message code="label.retour"/>
</button>
<button class="btn btn-green" id="addBtn" type="button" onclick="showNewForm()">Ajouter un Métier</button>
  
<div class="flex flex-col items-center">

  <form:form class="hidden w-2/3" method="post" modelAttribute="addForm" action="AA-add-metier">
    <div class="" id="addForm" title="Ajouter un Metier">
      <fieldset>
        <div>
          <div class="flex items-center mt-2 text-right">
            <div class="w-32 mr-2">
              <form:label path="addMetier.libelle">Libellé</form:label>
              </div>
            <form:input class="w-72 input-text" name="addMetier.libelle" path="addMetier.libelle"/>
            <form:errors class="error-message" path="addMetier.libelle"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="w-32 mr-2">
              <form:label path="addMetier.description">Description</form:label>
              </div>
            <form:textarea class="flex-grow w-72 input-textarea h-20" name="addMetier.description" path="addMetier.description"/>
            <form:errors class="error-message" path="addMetier.description"/>
          </div>
        </div>
      </fieldset>
    </div>

    <div class="text-center my-10">
      <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer le métier</button>
    </div>

  </form:form>        



  <form:form class="w-11/12 mt-5" method="post" modelAttribute="editForm" action="AA-edit-metiers">    

    <c:forEach items="${editForm.metiers}" var="edit" varStatus="status">
      <form:input type="hidden" path="editMetiers[${status.index}].id"/>
      <div class="flex items-center gap-2 mb-6">
          <label class="block text-right" for="libelle">
            Libellé
          </label>

          <div class="w-1/6 mr-7">
            <form:input class="flex-grow w-full input-text" type="text" name="editMetiers[${status.index}].libelle" path="editMetiers[${status.index}].libelle" id="libelle"/>
            <form:errors class="error-message" path="editMetiers[${status.index}].libelle"/>
          </div>

          <label class="block text-right" for="libelle">
            Description
          </label>

          <div class="flex-1">
            <form:textarea class="flex-grow w-full input-textarea h-18" name="editMetiers[${status.index}].description" path="editMetiers[${status.index}].description" id="description"/>
            <form:errors class="error-message" path="editMetiers[${status.index}].description"/>
          </div>
      </div>
    </c:forEach>
    
    <div class="mt-4 flex justify-center gap-2">
      <button type="submit" class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300">Enregistrer les modifications</button>
      <button type="reset" onClick="window.location = '${url}'" class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300">Annuler</button>
    </div>
  </div>

</form:form>

  
  
<script>

  function showNewForm() {
    $("#addForm").toggle('quick');
  }

</script>
