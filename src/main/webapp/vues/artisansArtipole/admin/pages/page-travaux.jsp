<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="flex flex-col items-center">

  <div class="w-full">
    <button class="btn btn-green btn-small" id="addItemBtn" type="button" onclick="showAddForm()">Ajouter un type de travaux</button>
  </div>

  <form:form class="editAdherent" method="post" modelAttribute="addForm" action="AA-add-travaux">
    <div class="hidden" id="addItemForm">
      <fieldset>
      
          <div class="flex items-center mt-2">
            <form:label class="flex-grow mr-2" path="editAATravaux.libelle">Type de travaux</form:label>
            <form:input id="travauxLibelle" class="mr-11 w-96 input-text" path="editAATravaux.libelle" name="editAATravaux.libelle"/>
            <form:errors class="error-message" path="editAATravaux.libelle"/>
          </div>
      
          <div class="text-center mt-5">
            <button type="button" onclick="createNewSpecialiteInput()" class="btn btn-small btn-blue ml-20">Ajouter une spécialité associée</button>

            <ul id="SpecialiteInputs">
            </ul>
          </div>
          
          
          <div class="flex justify-center gap-2 my-10">
            <button type="submit" class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300">Enregistrer le travaux</button>
            <button type="button" onclick="window.location.reload(false)" class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300">Annuler</button>
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
        <th scope="col" class="px-6 py-3" width="1px">
        </th>
        <th scope="col" class="px-6 py-3" width="1px">
        </th>
      </tr>
    </thead>
    
    <tbody>
      <c:forEach items="${itemsList}" var="item">
        <c:url value="/AA-edit-travaux" var="urlAAEdit"><c:param name="idTravaux" value="${item.id}"/></c:url>
        <c:url value="/AA-delete-travaux" var="urlAADelete"><c:param name="idTravaux" value="${item.id}"/></c:url>
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600" id="${item.id}">
          <td class="px-6 py-2">
            <c:out value="${item.libelle}"/>
          </td>
          <td class="px-6 py-2">
            <ul>
            <c:forEach items="${item.specialites}" var="specialite">
              <li>
                • <c:out value="${specialite.libelle}"/>
              </li>
            </c:forEach>
            </ul>
          </td>
          
          <td class="px-2 py-2">
            <a href="${urlAAEdit}"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-gray-800 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#edit"/>"></use></svg></a>
          </td>
          <td class="px-2 py-2">
            <button onclick="deleteTravaux('${urlAADelete}')"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-red-900 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></button>
          </td>
        </tr>     
    </c:forEach>
    </tbody>
  </table>
</div>

<script>

  function showAddForm() {
    $("#addItemForm").toggle('quick');
  }

  function createNewSpecialiteInput() {
    numberOfInputs = $('#SpecialiteInputs li').length;
    var newInput = $('<li class="hidden flex items-center mt-2 text-right">' +
                     '   <label class="flex-grow mr-2" for="editAATravaux.libelle">Spécialité</label>' +
                     '   <input name="specialites[' + numberOfInputs + '].libelle" path="specialites[' + numberOfInputs + '].libelle" class="w-96 input-text"/>' +
                     '   <button type="button" onclick="deleteSpecialite(this)"><svg class="ml-1 w-10 h-10 p-2 fill-gray-400 hover:bg-red-900 hover:fill-white rounded-lg"><use xlink:href="/scabotheque/resources/images/icones.svg#trash"></use></svg></button>' +
                     '</li>');
    $('#SpecialiteInputs').append(newInput);
    newInput.slideDown({ start: function () { $(this).css({ display: "flex" }); }, duration: 200 });
  }

  function deleteSpecialite(elmt) {
    $(elmt).parent().slideUp(200, function () {
        $(this).remove();
    });
  }
  
  function deleteTravaux(url) {
    if (confirm("Êtes-vous certain.e de vouloir supprimer ce type de travaux ainsi que toutes les spécialités qui lui sont associées ?")) {
      document.location.href = url;
    }
  }

</script>