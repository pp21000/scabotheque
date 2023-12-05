<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class="flex flex-col items-center">

  <div class="w-full">
    <button class="btn btn-green btn-small" id="addBtn" type="button" onclick="showAddForm()">Ajouter une actualité</button>
  </div>

  <form:form class="editAdherent" method="post" modelAttribute="addForm" action="AA-add-actualite">
    <form:input type="hidden" path="editAAActualite.date_ajout"/>
    <div class="hidden" id="addItemForm" title="Ajouter une actualité">
      <fieldset>
        <div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.titre">Titre</form:label>
            </div>              
            <form:input class="flex-grow w-72 input-text" name="editAAActualite.titre" path="editAAActualite.titre"/>
            <form:errors class="error-message" path="editAAActualite.titre"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.contenu">Contenu</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAActualite.contenu" path="editAAActualite.contenu"/>
            <form:errors class="error-message" path="editAAActualite.contenu"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.detail_contenu">Détail contenu</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAActualite.detail_contenu" path="editAAActualite.detail_contenu"/>
            <form:errors class="error-message" path="editAAActualite.detail_contenu"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.type">Type</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAActualite.type" path="editAAActualite.type"/>
            <form:errors class="error-message" path="editAAActualite.type"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.sous_type">Sous-type</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAActualite.sous_type" path="editAAActualite.sous_type"/>
            <form:errors class="error-message" path="editAAActualite.sous_type"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.lien_url">Lien url</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAActualite.lien_url" path="editAAActualite.lien_url"/>
            <form:errors class="error-message" path="editAAActualite.lien_url"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.position">Position</form:label>
            </div>
            <form:input class="flex-grow w-72 input-text" name="editAAActualite.position" path="editAAActualite.position"/>
            <form:errors class="error-message" path="editAAActualite.position"/>
          </div>
          <div class="flex items-center mt-2">
            <div class="flex-grow w-44 mx-2 text-right">
              <form:label path="editAAActualite.adherentId">Adhérent</form:label>
            </div>
            <form:select class="flex-grow text-left h-16 w-72 select2" name="editAAActualite.adherentId" path="editAAActualite.adherentId">
              <form:option value="" label="Aucun (actualité générale)"></form:option>                                                                                                      
              <form:options items="${adherentsList}" itemValue="id" itemLabel="libelle"/>
            </form:select>            
            <form:errors class="error-message" path="editAAActualite.adherentId"/>
          </div>
        </div>
        <div class="text-center my-10">
          <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer l'actualité</button>
        </div>
      </fieldset>
    </div>
  </form:form>        
</div>

<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
  <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
    <thead class="text-xs text-gray-700 uppercase bg-gray-300 dark:bg-gray-900 dark:text-gray-400">
      <tr>
        <th scope="col" class="px-3 py-3">
          Titre
        </th>
        <th scope="col" class="px-3 py-3">
          Contenu
        </th>
        <th scope="col" class="px-3 py-3">
          Détail contenu
        </th>
        <th scope="col" class="px-3 py-3">
          Type
        </th>
        <th scope="col" class="px-3 py-3">
          Sous-type
        </th>
        <th scope="col" class="px-3 py-3">
          Lien URL
        </th>
        <th scope="col" class="px-3 py-3">
          Position
        </th>
        <th scope="col" class="px-3 py-3">
          Date d'ajout
        </th>
        <th scope="col" class="px-3 py-3">
          Adhérent
        </th>
        <th scope="col" class="px-0 py-3"></th>
        <th scope="col" class="px-0 py-3"></th>
      </tr>
    </thead>
    
    <tbody>
      <c:forEach items="${listeItems}" var="item">
        <c:url value="/AA-edit-actualite" var="urlAAEdit"><c:param name="idActualite" value="${item.id}"/></c:url>
        <c:url value="/AA-delete-actualite" var="urlAADelete"><c:param name="idActualite" value="${item.id}"/></c:url>
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600" id="${item.id}">
          <td class="px-3 py-4">
            <c:out value="${item.titre}"/>
          </td>          
          <td class="px-3 py-4">
            <c:out value="${item.contenu}"/>
          </td>
          <td class="px-3 py-4">
            <c:out value="${item.detail_contenu}"/>
          </td>
          <td class="px-3 py-4">
            <c:out value="${item.type}"/>
          </td>
          <td class="px-3 py-4">
            <c:out value="${item.sous_type}"/>
          </td>
          <td class="px-3 py-4">
            <c:out value="${item.lien_url}"/>
          </td>
          <td class="px-3 py-4 text-center">
            <c:out value="${item.position}"/>
          </td>
          <td class="px-3 py-4 whitespace-nowrap">
            <fmt:formatDate value="${item.date_ajout}" pattern="dd/MM/yy"/>
          </td>
          <td class="px-3 py-4 text-center">
            <c:out value="${item.adherentId}"/>
          </td>
          <td class="px-0 py-4">
            <a href="${urlAAEdit}" class="hover:font-medium"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-gray-800 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#edit"/>"></use></svg></a>
          </td>           
          <td class="px-1 py-4">
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