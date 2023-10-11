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
            id="addEmplacementBtn" type="button" onclick="showNewEmplacement()">Ajouter un Emplacement</button>
  </div>


  <form:form class="editAdherent" method="post" modelAttribute="addForm" action="AA-add-emplacement">
    <div class="hidden" id="addEmplacementForm" title="Ajouter un emplacement">
      <fieldset>
        <!--<legend class="legend"><spring:message code="label.addContact"/></legend>-->
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
            <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer l'emplacement</button>
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
        <th scope="col" class="px-6 py-3">
        </th>
        <th scope="col" class="px-6 py-3">
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
            <a href="${urlAAEdit}"><svg class="w-6 h-6 dark:fill-gray-100"><use xlink:href="<c:url value="/resources/images/icones.svg#edit"/>"></use></svg></a>
          </td>
          <td class="px-2 py-4">
            <a href="${urlAADelete}"><svg class="w-6 h-6 dark:fill-gray-100"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></a>
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