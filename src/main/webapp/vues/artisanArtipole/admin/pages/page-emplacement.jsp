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
    <button class="btn btn-green btn-small" id="addEmplacementBtn" type="button" onclick="showAddForm()">Ajouter un emplacement</button>
  </div>


  <form:form class="editAdherent" method="post" modelAttribute="addForm" action="AA-add-emplacement?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
    <div class="hidden" id="addItemForm" title="Ajouter un emplacement">
      <fieldset>
        <!--<legend class="legend"><spring:message code="label.addContact"/></legend>-->
        <div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mr-2">
              <form:label path="editAAEmplacement.type">Type emplacement</form:label>
            </div>              
            <form:select onChange="handleUploadFileDivVisibility()" id="typeEmplacementSelect" class="flex-grow w-72 input-select" name="editAAEmplacement.type" path="editAAEmplacement.type">
              <form:option value="titre"/>
              <form:option value="image"/>
              <form:option value="contenu"/>
            </form:select>
            <form:errors class="error-message" path="editAAEmplacement.type"/>
          </div>
             
          <div id="uploadFileDiv" class="hidden flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAEmplacement.libelle">Image</form:label>
            </div>
            <form:input type="file" path="editAAEmplacement.file" accept="image/x-png,image/gif,image/jpeg"/>
          </div>
              
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mr-2">
              <form:label path="editAAEmplacement.libelle">Libellé</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAEmplacement.libelle" path="editAAEmplacement.libelle"/>
            <form:errors class="error-message" path="editAAEmplacement.libelle"/>
          </div>
          
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mr-2">
              <form:label path="editAAEmplacement.content">Content</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAEmplacement.content" path="editAAEmplacement.content"/>
            <form:errors class="error-message" path="editAAEmplacement.content"/>
          </div>
          
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mr-2">
              <form:label path="editAAEmplacement.alt">Alt</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAEmplacement.alt" path="editAAEmplacement.alt"/>
            <form:errors class="error-message" path="editAAEmplacement.alt"/>
          </div>
          
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mr-2">
              <form:label path="editAAEmplacement.page">Page</form:label>
            </div>
            <form:select class="flex-grow w-72 input-select" name="editAAEmplacement.page" path="editAAEmplacement.page.id">
              <form:options items="${pageList}" itemValue="id" itemLabel="libelle"/>
            </form:select>
            <form:errors class="error-message" path="editAAEmplacement.page.id"/>
          </div>
          
          <div class="text-center my-10">
            <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer l'emplacement</button>
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
          Image
        </th>
        <th scope="col" class="px-6 py-3">
          alt
        </th>
        <th scope="col" class="px-6 py-3">
          Page
        </th>
        <th scope="col" class="px-6 py-3">
        </th>
        <th scope="col" class="px-6 py-3">
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${listeEmplacements}" var="emplacement">
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
            <c:url value="/AA-edit-emplacement" var="urlAAEdit"><c:param name="idEmplacement" value="${emplacement.id}"/></c:url>
            <a href="${urlAAEdit}"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-gray-800 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#edit"/>"></use></svg></a>
          </td>
          <td class="px-2 py-4">
            <c:url value="/AA-delete-emplacement" var="urlAADelete"><c:param name="idEmplacement" value="${emplacement.id}"/></c:url>
            <a href="${urlAADelete}"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-red-900 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></a>
          </td>
        </tr>     
    </c:forEach>
    </tbody>
  </table>

</div>

<script>
  
  function handleUploadFileDivVisibility() {
    if ($('#typeEmplacementSelect').val() === 'image') {
         $('#uploadFileDiv').slideDown({
            start: function () {$(this).css({display: "flex"});},
            duration: 400});
     } else {
         $('#uploadFileDiv').slideUp(300);
         $('#editAAEmplacement\\.file').val(""); 
     }
  }

  function showAddForm() {
    $("#addItemForm").toggle('quick');
  }
  
</script>