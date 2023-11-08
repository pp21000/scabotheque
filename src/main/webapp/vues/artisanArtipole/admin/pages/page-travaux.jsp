
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="flex flex-col items-center">

  <div class="w-full">
    <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" 
            id="addItemBtn" type="button" onclick="showAddForm()"><spring:message code="label.addTravaux"/></button>
  </div>

  <form:form class="editAdherent" method="post" modelAttribute="addForm" action="AA-add-travaux" onsubmit="saveSpecialites()">
    <div class="hidden" id="addItemForm" title="<spring:message code="label.addTravaux"/>">
      <fieldset>
        
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAATravaux.libelle">Libellé</form:label>
            </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAATravaux.libelle" path="editAATravaux.libelle"/>
            <form:errors class="error-message" path="editAATravaux.libelle"/>
          </div>
          
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAATravaux.specialites">Spécialités</form:label>
            </div>
            
            <div id="specialites">
              <button type="button" onclick="showNewSpecialiteInput()" class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300">
                <svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-gray-800 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#plus"/>"></use></svg>
              </button>
              <ul id="SpecialiteInputs">
                <%--<form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAATravaux.specialites" path="editAATravaux.specialites"/>--%>
              </ul>
            </div>
          </div>
          
          <div class="text-center my-10">
            <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer le travaux</button>
          </div>
            
      </fieldset>
    </div>
  </form:form> 

       
</div>

<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
  <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
    <thead class="text-xs text-gray-700 uppercase bg-gray-300 dark:bg-gray-900 dark:text-gray-400">
      <tr>
        <th scope="col" class="px-6 py-3">
          Type de travaux
        </th>
        <th scope="col" class="px-6 py-3">
          Spécialités
        </th>
        <th scope="col" class="px-6 py-3">
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${listeItems}" var="travaux">
        <c:url value="/AA-edit-travaux" var="urlAAEdit"><c:param name="idTravaux" value="${travaux.id}"/></c:url>
        <%--<c:url value="/AA-delete-travaux" var="urlAADelete"><c:param name="idTravaux" value="${item.id}"/></c:url>--%>
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600" id="${travaux.id}">
          <td class="px-6 py-2">
            <c:out value="${travaux.libelle}"/>
          </td>
          <td class="px-6 py-2">
            <ul>
            <c:forEach items="${travaux.specialites}" var="specialite">
                <li class="">
                  • <c:out value="${specialite.libelle}"/>
                </li>
            </c:forEach>
            </ul>
          </td>
          
          <td class="px-1 py-4">
            <a href="${urlAAEdit}"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-gray-800 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#edit"/>"></use></svg></a>
          </td>
<!--          <td class="px-1 py-4">
            <a href="${urlAADelete}"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-red-900 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></a>
          </td>-->
        </tr>     
    </c:forEach>
    </tbody>
  </table>
</div>

<script>

  function showAddForm() {
    $("#addItemForm").toggle('quick');
  }
  
  function showNewSpecialiteInput() {
    $('#SpecialiteInputs').append('<li><input name="editAATravaux.specialites[0].libelle" path="editAATravaux.specialites[0].libelle" class="mt-3 flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500"/></li>');
  }
  
  function saveSpecialites() {
      specialites = [];

      $('#SpecialiteInputs input').each(function() {
        var specialiteLibelle = $(this).val();
        if (specialiteLibelle) {
          specialites.push(specialiteLibelle);
        }
        alert(specialites);
      });
  }
  

</script>