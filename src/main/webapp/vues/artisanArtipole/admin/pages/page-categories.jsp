<%--
  User: ludovic.spina - Date: 21/02/2023 - Time: 11:51
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="my-10">
  <h1 class="text-2xl text-neutral-700  dark:text-gray-400 text-center underline">Edition des catégories</h1>
</div>

<div class="flex flex-col items-center">

  <div class="w-full text-right">
    <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" 
            id="addCategorieBtn" type="button" onclick="showNewEmplacement()">Ajouter un Emplacement</button>
  </div>


  <form:form class="editAdherent" method="post" modelAttribute="addForm" action="AA-add-categorie">
    <div class="hidden" id="addCategorieForm" title="Ajouter une categorie">
      <fieldset>
        <!--<legend class="legend"><spring:message code="label.addContact"/></legend>-->
        <div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAACategorie.libelle">Libellé</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAACategorie.libelle" path="editAACategorie.libelle"/>
            <form:errors class="error" path="editAACategorie.libelle"/>
          </div>

          <div class="text-center my-10">
            <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer le contact</button>
          </div>
        </div>
      </fieldset>
    </div>
  </form:form>        
</div>


<c:forEach items="${listeCategories}" var="categorie">  
  <div id="accordion-collapse-<c:out value='${categorie.id}'/>" data-accordion="collapse" class="text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg dark:bg-gray-700 dark:border-gray-600 dark:text-white">
    <a href="#" aria-current="true" >
      <%--<c:out value="${categorie.libelle}"/>--%>
      <button type="button" class="flex items-center justify-between w-full p-5 font-medium text-left text-gray-500 border border-b-0 border-gray-200 rounded-t-xl focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-800 dark:border-gray-700 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-800"
              data-accordion-target="#accordion-collapse-body-<c:out value='${categorie.id}'/>" aria-expanded="true" aria-controls="accordion-collapse-body-<c:out value='${categorie.id}'/>">
        <span><c:out value="${categorie.libelle}"/></span>
        <svg data-accordion-icon class="w-6 h-6 rotate-180 shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
      </button>
    </a>
    <div id="accordion-collapse-body-<c:out value='${categorie.id}'/>" class="hidden" aria-labelledby="accordion-collapse-heading-<c:out value='${categorie.id}'/>">
      <c:forEach items="${categorie.specialites}" var="specialite">
        <a href="#" class="block w-full px-4 py-2 border-b border-gray-200 cursor-pointer hover:bg-gray-100 hover:text-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:border-gray-600 dark:hover:bg-gray-600 dark:hover:text-white dark:focus:ring-gray-500 dark:focus:text-white">
          <c:out value="${specialite.libelle}"/>
        </a>
      </c:forEach>
    </div>
  </div>
</c:forEach>



<script>
  $(function () {

    $("#addCategorieBtn").click(function (e) {
      alert("test");
      $("#addCategorieForm").toggle('slow');
    });
  });

  function showNewEmplacement() {
    $("#addCategorieForm").toggle('slow');
  }

</script>

