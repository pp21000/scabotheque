<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="flex flex-col items-center">

  <div class="w-full">
    <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" 
            id="addBtn" type="button" onclick="showAddForm()">Ajouter une actualité</button>
  </div>


  <form:form class="editAdherent" method="post" modelAttribute="addForm" action="AA-add-actualite">
    <div class="hidden" id="addItemForm" title="Ajouter une actualité">
      <fieldset>
        <div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.titre">Titre de l'actu</form:label>
              </div>              
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAActualite.titre" path="editAAActualite.titre"/>
            <form:errors class="error-message" path="editAAActualite.titre"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.contenu">Contenu</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAActualite.contenu" path="editAAActualite.contenu"/>
            <form:errors class="error-message" path="editAAActualite.contenu"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.type">Type</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAActualite.type" path="editAAActualite.type"/>
            <form:errors class="error-message" path="editAAActualite.type"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.sous_type">Sous type</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAActualite.sous_type" path="editAAActualite.sous_type"/>
            <form:errors class="error-message" path="editAAActualite.sous_type"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.position">Position</form:label>
              </div>
            <form:input class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAActualite.position" path="editAAActualite.position"/>
            <form:errors class="error-message" path="editAAActualite.position"/>
          </div>
          <div class="flex items-center mt-2 text-right">
            <div class="flex-grow w-44 mx-2">
              <form:label path="editAAActualite.date_ajout">Date d'ajout</form:label>
              </div>
            <form:input type="date" class="flex-grow py-2 px-4 w-72 text-sm text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500" name="editAAActualite.date_ajout" path="editAAActualite.date_ajout"/>
            <form:errors class="error-message" path="editAAActualite.date_ajout"/>
          </div>
        </div>
          <div class="text-center my-10">
            <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer l'actualité</button>
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
          Titre
        </th>
        <th scope="col" class="px-6 py-3">
          Contenu
        </th>
        <th scope="col" class="px-6 py-3">
          Type
        </th>
        <th scope="col" class="px-6 py-3">
          Sous type
        </th>
        <th scope="col" class="px-6 py-3">
          Position
        </th>
        <th scope="col" class="px-6 py-3">
          Date d'ajout
        </th>
        <th scope="col" class="px-6 py-3">
        </th>
        <th scope="col" class="px-6 py-3">
        </th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${listeItems}" var="item">
        <c:url value="/AA-edit-actualite" var="urlAAEdit"><c:param name="idActualite" value="${item.id}"/></c:url>
        <c:url value="/AA-delete-actualite" var="urlAADelete"><c:param name="idActualite" value="${item.id}"/></c:url>
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600" id="${item.id}">
          <td class="px-6 py-4">
            <c:out value="${item.titre}"/>
          </td>          
          <td class="px-6 py-4">
            <c:out value="${item.contenu}"/>
          </td>
          <td class="px-6 py-4">
            <c:out value="${item.type}"/>
          </td>
          <td class="px-6 py-4">
            <c:out value="${item.sous_type}"/>
          </td>
          <td class="px-6 py-4 text-center">
            <c:out value="${item.position}"/>
          </td>
          <td class="px-6 py-4">
            <c:out value="${item.date_ajout}"/>
          </td>
          <td class="px-2 py-4">
            
           <a href="${urlAAEdit}" class="hover:font-medium"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-gray-800 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#edit"/>"></use></svg></a>
            
          <td class="px-2 py-4">
            <a href="${urlAADelete}"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-red-900 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></a>
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

  function showAddForm() {
    $("#addItemForm").toggle('quick');
  }

</script>