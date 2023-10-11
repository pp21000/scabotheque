<%--
  User: ludovic.spina - Date: 21/02/2023 - Time: 11:51
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="flex flex-col items-center">

  <div class="w-full">
    <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" 
            id="addItemBtn" type="button" onclick="showNewEmplacement()"><spring:message code="label.addPhoto"/></button>
  </div>


  <form:form class="editAdherent" method="post" modelAttribute="addForm" action="AA-add-photo?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
    <div class="hidden" id="addItemForm" title="<spring:message code="label.addPhoto"/>">
      <fieldset>
        <!--<legend class="legend"><spring:message code="label.addPhoto"/></legend>-->
        <div>
          <div class="flex w-3/4 items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAPhoto.libelle">Libellé</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAPhoto.libelle" path="editAAPhoto.libelle"/>
            <form:errors class="error" path="editAAPhoto.libelle"/>
          </div>

          <div class="flex">
            <div class="flex w-3/4 items-center mt-2 text-right">
              <div class="flex-grow w-1/4 w-44 mx-2">
                <form:label path="editAAPhoto.data">Data</form:label>
                </div>
              <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAPhoto.data" path="editAAPhoto.data"/>
              <form:errors class="error" path="editAAPhoto.data"/>
            </div>

            <div class="flex w-1/4">
              <img class="max-h-24 mr-5 rounded" src="${editAAPhoto.dataImg}" />     
              <div class="my-auto flex justify-center ml-4">
                <div class="flex flex-col">
                  <form:input type="file" path="editAAPhoto.file" accept="image/x-png,image/gif,image/jpeg"/> <br/>
                </div>
              </div>
            </div>
          </div>

          <div class="flex w-3/4 items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAPhoto.alt">Alt</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAPhoto.alt" path="editAAPhoto.alt"/>
            <form:errors class="error" path="editAAPhoto.alt"/>
          </div>
          <div class="text-center my-10">
            <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer la photo</button>
          </div>
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
          Data
        </th>
        <th scope="col" class="px-6 py-3">
          alt
        </th>
        <th scope="col" class="px-6 py-3">
        </th>
        <th scope="col" class="px-6 py-3">
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${listeItems}" var="item">
        <c:url value="/AA-edit-photo" var="urlAAEdit"><c:param name="idPhoto" value="${item.id}"/></c:url>
        <c:url value="/AA-delete-photo" var="urlAADelete"><c:param name="idPhoto" value="${item.id}"/></c:url>
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
          <td class="px-1 py-4">
            <a href="${urlAAEdit}"><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg></a>
          </td>
          <td class="px-1 py-4">
            <a href="${urlAADelete}" class="hover:bg-red-200"><svg class="w-6 h-6" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24" width="512" height="512"><path d="M21,4H17.9A5.009,5.009,0,0,0,13,0H11A5.009,5.009,0,0,0,6.1,4H3A1,1,0,0,0,3,6H4V19a5.006,5.006,0,0,0,5,5h6a5.006,5.006,0,0,0,5-5V6h1a1,1,0,0,0,0-2ZM11,2h2a3.006,3.006,0,0,1,2.829,2H8.171A3.006,3.006,0,0,1,11,2Zm7,17a3,3,0,0,1-3,3H9a3,3,0,0,1-3-3V6H18Z"/><path d="M10,18a1,1,0,0,0,1-1V11a1,1,0,0,0-2,0v6A1,1,0,0,0,10,18Z"/><path d="M14,18a1,1,0,0,0,1-1V11a1,1,0,0,0-2,0v6A1,1,0,0,0,14,18Z"/></svg></a>
          </td>
        </tr>     
    </c:forEach>
    </tbody>
  </table>



</div>

<script>
  $(function () {

    $("#addItemBtn").click(function (e) {
      $("#addItemForm").toggle('slow');
    });
  });

  function showNewEmplacement() {
    $("#addItemForm").toggle('slow');
  }

</script>