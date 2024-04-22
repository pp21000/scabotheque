<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="flex w-full">
  <c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="artipole"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
  <div class="w-1/12">
    <button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      <spring:message code="label.retour"/>
    </button>
  </div>
  <div class="w-5/6 flex justify-center items-center gap-2">
    <div class="flex items-center p-1.5 bg-gray-200 dark:bg-gray-600 rounded-2xl gap-2 min-w-[35rem]">
      <div class="w-1/2 flex justify-center gap-2">
        <span class="text-2xl"><spring:message code="label.realisations"/></span>
      </div>
      <div class="w-1/2 flex items-center gap-1">
        <c:choose>
          <c:when test="${empty adherent.photoImg or not empty adherent.photoImg}">
            <img class="rounded h-10" src="<c:url value="/resources/images/noAdhPhoto.png"/>"/>
            <img class="rounded h-10" src="${adherent.photoImg}">
            <img class="rounded h-10" src="${itemsList[0].photo.dataImg}">
          </c:when>
          <c:otherwise>
            <img class="rounded h-10" src="${itemsList[0].photo.dataImg}">
          </c:otherwise>
        </c:choose>
        <div class="w-full flex flex-col gap-0.5 truncate">
          <span class="font-semibold leading-none truncate">${itemsList[0].adherent.denomination}</span>
          <div class="flex">
            <span class="bg-green-600 text-white text-xs font-medium px-2 py-0.5 mb-0.5 rounded">${itemsList[0].adherent.code}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="flex flex-col items-center">
  <div class="w-full">
    <button class="btn btn-green btn-small" id="addItemBtn" type="button" onclick="showAddForm()">Ajouter une réalisation</button>
  </div>
  <form:form class="editAdherent w-1/2" method="post" modelAttribute="addForm" action="AA-add-realisation?idAdh=${adherent.id}&${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
    <form:input type="hidden" path="editAARealisation.adherentId"/>
    <div class="hidden" id="addItemForm" title="Ajouter une réalisation">
      <fieldset>
          <div class="flex items-center gap-2 mt-2">
            <div class="w-1/4 text-right">
              <form:label path="editAARealisation.photo.libelle">Libellé</form:label>
            </div>
            <div class="w-3/4">
              <form:input class="w-96 input-text" name="editAARealisation.photo.libelle" path="editAARealisation.photo.libelle"/>
              <form:errors class="error-message" path="editAARealisation.photo.libelle"/>
            </div>
          </div>

<%--          <div class="flex items-center gap-2 mt-2">
            <div class="w-1/4 text-right">
              <form:label path="editAARealisation.photo.file">Photo</form:label>
            </div>
            <div class="w-3/4">
              <form:input class="w-96" type="file" path="editAARealisation.photo.file" accept="image/x-png,image/gif,image/jpeg"/>
            </div>
          </div>--%>

          <div class="flex items-center gap-2 mt-2">
            <div class="w-1/4 text-right">
              <form:label path="editAARealisation.photo.alt">Alt</form:label>
            </div>
            <div class="w-3/4">            
              <form:input class="w-96 input-text" name="editAARealisation.photo.alt" path="editAARealisation.photo.alt"/>
              <form:errors class="error-message" path="editAARealisation.photo.alt"/>
            </div>
          </div>

          <div class="flex items-center gap-2 mt-2">
            <div class="w-1/4 text-right">
              <form:label path="editAARealisation.photo.type">Type</form:label>
            </div>
            <div class="w-3/4">            
              <form:input class="w-96 input-text" name="editAARealisation.photo.type" path="editAARealisation.photo.type"/>
              <form:errors class="error-message" path="editAARealisation.photo.type"/>
            </div>
          </div>

          <div class="flex items-center gap-2 mt-2">
            <div class="w-1/4 text-right">
              <form:label path="editAARealisation.legende">Légende</form:label>
            </div>
            <div class="w-3/4">            
              <form:input class="w-96 input-text" name="editAARealisation.legende" path="editAARealisation.legende"/>
              <form:errors class="error-message" path="editAARealisation.legende"/>
            </div>
          </div>

          <div class="flex items-center gap-2 mt-2">
            <div class="w-1/4 text-right">
              <form:label path="editAARealisation.position">Position</form:label>
            </div>
            <div class="w-3/4">  
              <form:select class="w-18 input-select" name="editAARealisation.position" path="editAARealisation.position">
                <c:forEach begin="1" end="9" var="position">
                  <form:option value="${position}">${position}</form:option>
                </c:forEach>
              </form:select>
              <form:errors class="error-message" path="editAARealisation.position"/>
            </div>
          </div>
          
          <div class="flex justify-center gap-2 my-10">
            <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer la réalisation</button>
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
          Libellé
        </th>
        <th scope="col" class="px-6 py-3 text-center">
          Photo
        </th>
        <th scope="col" class="px-6 py-3">
          alt
        </th>
        <th scope="col" class="px-6 py-3">
          Type
        </th>
        <th scope="col" class="px-6 py-3">
          Légende
        </th>
        <th scope="col" class="px-6 py-3 text-center">
          Position
        </th>
        <th scope="col" class="px-6 py-3" width="1px">
        </th>
        <th scope="col" class="px-6 py-3" width="1px">
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${itemsList}" var="item">
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600" id="${item.id}">
          <td class="px-6 py-4">
            <c:out value="${item.photo.libelle}"/>
          </td>
          <td class="px-6 py-4">
            <img class="max-h-24 mx-auto" src="${item.photo.dataImg}" />          
          </td>
          <td class="px-6 py-4">
            <c:out value="${item.photo.alt}"/>
          </td>
          <td class="px-6 py-4">
            <c:out value="${item.photo.type}"/>
          </td>
          <td class="px-6 py-4">
            <c:out value="${item.legende}"/>
          </td>
          <td class="px-6 py-4 text-center">
            <c:out value="${item.position}"/>
          </td>
          <td class="px-2 py-4">
            <c:url value="/AA-edit-realisation" var="urlAAEdit"><c:param name="idRealisation" value="${item.id}"/></c:url>
            <a href="${urlAAEdit}"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-gray-800 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#edit"/>"></use></svg></a>
          </td>
          <td class="px-2 py-4">
            <c:url value="/AA-delete-realisation" var="urlAADelete"><c:param name="idRealisation" value="${item.id}"/></c:url>
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