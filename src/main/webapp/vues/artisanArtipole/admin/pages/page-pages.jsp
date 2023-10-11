<%--
  User: ludovic.spina - Date: 21/02/2023 - Time: 11:51
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="flex flex-col items-center">

<!--  <div class="w-full text-right">
    <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" 
            id="addEmplacementBtn" type="button" onclick="showNewEmplacement()">Ajouter une Pages</button>
  </div>-->


<!--  <form:form class="editAdherent" method="post" modelAttribute="addForm" action="AA-add-emplacement">
    <div class="hidden" id="addEmplacementForm" title="Ajouter un emplacement">
      <fieldset>
        <legend class="legend"><spring:message code="label.addContact"/></legend>
        <div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAEmplacement.type">Type emplacement</form:label>
              </div>              
            <form:select class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAEmplacement.type" path="editAAEmplacement.type">
              <form:option value="titre"/>
              <form:option value="image"/>
              <form:option value="contenu"/>
            </form:select>
            <form:errors class="error" path="editAAEmplacement.type"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAEmplacement.libelle">Libellé</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAEmplacement.libelle" path="editAAEmplacement.libelle"/>
            <form:errors class="error" path="editAAEmplacement.libelle"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAEmplacement.content">Content</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAEmplacement.content" path="editAAEmplacement.content"/>
            <form:errors class="error" path="editAAEmplacement.content"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAEmplacement.data">Data</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAEmplacement.data" path="editAAEmplacement.data"/>
            <form:errors class="error" path="editAAEmplacement.data"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAEmplacement.alt">Alt</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAEmplacement.alt" path="editAAEmplacement.alt"/>
            <form:errors class="error" path="editAAEmplacement.alt"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAEmplacement.page">Page</form:label>
              </div>

            <form:select class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAEmplacement.page" path="editAAEmplacement.page.id">
              <form:options items="${pageList}" itemValue="id" itemLabel="libelle"/>
            </form:select>
            <form:errors class="error" path="editAAEmplacement.page.id"/>
          </div>
          <div class="text-center my-10">
            <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer le contact</button>
          </div>
        </div>
      </fieldset>
    </div>
  </form:form>        
</div>-->

<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
  <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
    <thead class="text-xs text-gray-700 uppercase bg-gray-300 dark:bg-gray-900 dark:text-gray-400">
      <tr>
        <th scope="col" class="px-6 py-3">
          Type d'emplacement
        </th>
        <th scope="col" class="px-6 py-3">
          Libellé
        </th>
        <th scope="col" class="px-6 py-3">
          Content
        </th>
        <th scope="col" class="px-6 py-3">
          Data
        </th>
        <th scope="col" class="px-6 py-3">
          alt
        </th>
        <th scope="col" class="px-6 py-3">
          Id page
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${listeEmplacements}" var="emplacement">
        <c:url value="/AA-edit-emplacement" var="urlAAEdit"><c:param name="idEmplacement" value="${emplacement.id}"/></c:url>
        <c:url value="/AA-delete-emplacement" var="urlAADelete"><c:param name="idEmplacement" value="${emplacement.id}"/></c:url>
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600" id="${emplacement.id}">
          <td class="px-6 py-4">
            <c:out value="${emplacement.type}"/>
          </td>          
          <td class="px-6 py-4">
            <c:out value="${emplacement.libelle}"/>
          </td>
          <td class="px-6 py-4">
            <c:out value="${emplacement.content}"/>
          </td>
          <td class="px-6 py-4">
            <c:choose>
              <c:when test="${emplacement.type.equals('image')}">
                <img class="max-h-24 rounded" src="${emplacement.dataImg}" />
              </c:when>
              <c:otherwise>
                <c:out value="${emplacement.data}"/>
              </c:otherwise>
            </c:choose>
          </td>
          <td class="px-6 py-4">
            <c:out value="${emplacement.alt}"/>
          </td>
          <td class="px-6 py-4">
            <c:out value="${emplacement.page.libelle}"/>
          </td>
          <td class="px-2 py-4">
            <a href="${urlAAEdit}"><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg></a>
          </td>
          <td class="px-2 py-4">
            <a href="${urlAADelete}"><svg class="w-6 h-6" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="Outline" viewBox="0 0 24 24" width="512" height="512"><path d="M21,4H17.9A5.009,5.009,0,0,0,13,0H11A5.009,5.009,0,0,0,6.1,4H3A1,1,0,0,0,3,6H4V19a5.006,5.006,0,0,0,5,5h6a5.006,5.006,0,0,0,5-5V6h1a1,1,0,0,0,0-2ZM11,2h2a3.006,3.006,0,0,1,2.829,2H8.171A3.006,3.006,0,0,1,11,2Zm7,17a3,3,0,0,1-3,3H9a3,3,0,0,1-3-3V6H18Z"/><path d="M10,18a1,1,0,0,0,1-1V11a1,1,0,0,0-2,0v6A1,1,0,0,0,10,18Z"/><path d="M14,18a1,1,0,0,0,1-1V11a1,1,0,0,0-2,0v6A1,1,0,0,0,14,18Z"/></svg></a>
          </td>

        </tr>     
<!--      <script>
        document.getElementById("${emplacement.id}").addEventListener("click", function () {
          window.location.href = "${urlAAEdit}";
        })
      </script>-->
    </c:forEach>
    </tbody>
  </table>



</div>

<script>
  $(function () {

    $("#addEmplacementBtn").click(function (e) {
      alert("test");
      $("#addEmplacementForm").toggle('slow');
    });
  });

  function showNewEmplacement() {
    $("#addEmplacementForm").toggle('slow');
  }

</script>