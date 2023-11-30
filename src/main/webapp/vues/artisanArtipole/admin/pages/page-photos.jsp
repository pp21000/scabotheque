<%--
  User: ludovic.spina - Date: 21/02/2023 - Time: 11:51
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="flex flex-col items-center">

  <div class="w-full">
    <button class="btn btn-green btn-small" id="addItemBtn" type="button" onclick="showAddForm()">Ajouter une photo</button>
  </div>


  <form:form class="editAdherent" method="post" modelAttribute="addForm" action="AA-add-photo?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
    <div class="hidden" id="addItemForm" title="Ajouter une photo">
      <fieldset>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAPhoto.libelle">Libellé</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAPhoto.libelle" path="editAAPhoto.libelle"/>
            <form:errors class="error-message" path="editAAPhoto.libelle"/>
          </div>

          <div class="flex ml-11 items-center mt-2 text-right">    
            <div class="flex flex-col">
              <form:input type="file" path="editAAPhoto.file" accept="image/x-png,image/gif,image/jpeg"/>
            </div>
          </div>

          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAPhoto.alt">Alt</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAPhoto.alt" path="editAAPhoto.alt"/>
            <form:errors class="error-message" path="editAAPhoto.alt"/>
          </div>
          <div class="text-center my-10">
            <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer la photo</button>
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
          Libellé
        </th>
        <th scope="col" class="px-6 py-3">
          Photo
        </th>
        <th scope="col" class="px-6 py-3">
          alt
        </th>
        <th scope="col" class="px-6 py-3" width="1px">
        </th>
        <th scope="col" class="px-6 py-3" width="1px">
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${listeItems}" var="item">
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600" id="${item.id}">
          <td class="px-6 py-4">
            <c:out value="${item.libelle}"/>
          </td>
          <td class="px-6 py-4">
            <img class="max-h-24 rounded" src="${item.dataImg}" />            
          </td>
          <td class="px-6 py-4">
            <c:out value="${item.alt}"/>
          </td>
          <td class="px-2 py-4">
            <c:url value="/AA-edit-photo" var="urlAAEdit"><c:param name="idPhoto" value="${item.id}"/></c:url>
            <a href="${urlAAEdit}"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-gray-800 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#edit"/>"></use></svg></a>
          </td>
          <td class="px-2 py-4">
            <c:url value="/AA-delete-photo" var="urlAADelete"><c:param name="idPhoto" value="${item.id}"/></c:url>
            <a href="${urlAADelete}"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-red-900 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></a>
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

</script>