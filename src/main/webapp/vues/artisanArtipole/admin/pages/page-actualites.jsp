<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class="flex flex-col items-center">

  <div class="w-full">
    <button class="btn btn-green btn-small" id="addBtn" type="button" onclick="showAddForm()">Ajouter une actualité</button>
  </div>

  <form:form class="editAdherent w-full" method="post" modelAttribute="addForm" action="AA-add-actualite">
    <form:input type="hidden" path="editAAActualite.date_ajout"/>
    <div class="hidden" id="addItemForm" title="Ajouter une actualité">
      <fieldset>
        <div>
          
          <div class="flex items-center gap-2 mt-3">
              <div class="w-1/6 text-right">
                  <form:label path="editAAActualite.titre">Titre</form:label>
              </div>
              <div class="w-4/6">
                  <form:input class="w-96 input-text" type="text" name="editAAActualite.titre" path="editAAActualite.titre"/>
                  <form:errors class="error-message" path="editAAActualite.titre"/>
              </div>
          </div>

          <div class="flex items-center gap-2 mt-3">
              <div class="w-1/6 text-right">
                  <form:label path="editAAActualite.contenu">Contenu</form:label>
              </div>
              <div class="w-4/6">
                  <form:textarea class="w-full h-32 input-textarea" name="editAAActualite.contenu" path="editAAActualite.contenu"/>
                  <form:errors class="error-message" path="editAAActualite.contenu"/>
              </div>
          </div>

          <div class="flex items-center gap-2 mt-3">
              <div class="w-1/6 text-right">
                  <form:label path="editAAActualite.detail_contenu">Détail contenu</form:label>
              </div>
              <div class="w-4/6">
                  <form:textarea class="w-full h-32 input-textarea" name="editAAActualite.detail_contenu" path="editAAActualite.detail_contenu"/>
                  <form:errors class="error-message" path="editAAActualite.detail_contenu"/>
              </div>
          </div>

          <div class="flex items-center gap-2 mt-3">
              <div class="w-1/6 text-right">
                  <form:label path="editAAActualite.type">Type</form:label>
              </div>
              <div class="w-4/6">
                  <form:input class="w-72 input-text" type="text" name="editAAActualite.type" path="editAAActualite.type"/>
                  <form:errors class="error-message" path="editAAActualite.type"/>
              </div>
          </div>

          <div class="flex items-center gap-2 mt-3">
              <div class="w-1/6 text-right">
                  <form:label path="editAAActualite.sous_type">Sous-type</form:label>
              </div>
              <div class="w-4/6">
                  <form:input class="w-72 input-text" type="text" name="editAAActualite.sous_type" path="editAAActualite.sous_type"/>
                  <form:errors class="error-message" path="editAAActualite.sous_type"/>
              </div>
          </div>

          <div class="flex items-center gap-2 mt-3">
              <div class="w-1/6 text-right">
                  <form:label path="editAAActualite.lien_url">Lien url</form:label>
              </div>
              <div class="w-4/6">
                  <form:input class="w-96 input-text" type="text" name="editAAActualite.lien_url" path="editAAActualite.lien_url"/>
                  <form:errors class="error-message" path="editAAActualite.lien_url"/>
              </div>
          </div>

          <div class="flex items-center gap-2 mt-3">
              <div class="w-1/6 text-right">
                  <form:label path="editAAActualite.position">Position</form:label>
              </div>
              <div class="w-4/6">
                  <form:select class="w-18 input-select" name="editAAActualite.position" path="editAAActualite.position">
                      <c:forEach begin="1" end="9" var="position">
                          <form:option value="${position}">${position}</form:option>
                      </c:forEach>
                  </form:select>
                  <form:errors class="error-message" path="editAAActualite.position"/>
              </div>
          </div>

          <div class="flex items-center gap-2 mt-3">
              <div class="w-1/6 text-right">
                  <form:label path="editAAActualite.adherent.id">Adhérent</form:label>
              </div>
              <c:choose>
                <c:when test = "${empty param.idAdh}">
                  <div class="w-4/6">
                    <form:select class="w-96 select2" name="editAAActualite.adherent" path="editAAActualite.adherent.id">
                      <form:option value="null" label="Aucun (actualité générale)"></form:option>
                      <form:options items="${adherentsList}" itemValue="id" itemLabel="libelle"/>
                    </form:select>
                    <form:errors class="error-message" path="editAAActualite.adherent.id"/>
                  </div>
                </c:when>
                <c:otherwise>
                  <form:input type="hidden" path="editAAActualite.adherent.id"/>
                  <div class="w-96 text-white">&nbsp;<c:out value="${adherent.denomination}"/></div>
                </c:otherwise>
              </c:choose>
                    
          </div>

        </div>
        <div class="flex justify-center gap-2 my-10">
          <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer l'actualité</button>
          <button type="button" onclick="window.location.reload(false)" class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300">Annuler</button>
        </div>
      </fieldset>
    </div>
  </form:form>        
</div>


<div class="flex gap-10 p-1.5">
  <div class="flex items-center gap-1.5">
    <input checked type="radio" name="filterRows" value="all" class="input-radio" onchange="filterRows(this)">
    Toutes
  </div>  
  <div class="flex items-center gap-1.5">
    <input type="radio" name="filterRows" value="actusGenerales" class="input-radio" onchange="filterRows(this)">
    Actus générales
  </div>  
  <div class="flex items-center gap-1.5">
    <input type="radio" name="filterRows" value="actusAdherent"  class="input-radio" onchange="filterRows(this)">
    Actus adhérent
  </div>
</div>

<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
  <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
    <thead class="text-xs text-gray-700 uppercase bg-gray-300 dark:bg-gray-900 dark:text-gray-400">
      <tr>
        <th class="px-3 py-3">
          Titre
        </th>
        <th class="px-3 py-3">
          Contenu
        </th>
        <th class="px-3 py-3">
          Détail contenu
        </th>
        <th class="px-3 py-3">
          Type
        </th>
        <th class="px-3 py-3">
          Sous-type
        </th>
        <th class="px-3 py-3">
          Lien URL
        </th>
        <th class="px-3 py-3 text-center">
          Position
        </th>
        <th class="px-3 py-3 text-center">
          Date d'ajout
        </th>
        <th class="px-3 py-3 text-center">
          Adhérent
        </th>
        <th class="px-0 py-3"></th>
        <th class="px-0 py-3"></th>
      </tr>
    </thead>
    
    <tbody>
      <c:forEach items="${itemsList}" var="item">
        <c:url value="/AA-edit-actualite" var="urlAAEdit"><c:param name="idActualite" value="${item.id}"/></c:url>
        <c:url value="/AA-delete-actualite" var="urlAADelete"><c:param name="idActualite" value="${item.id}"/></c:url>
        <tr class="<c:choose>
                      <c:when test='${not empty item.adherent.id}'>
                        actu-adherent
                      </c:when>
                      <c:otherwise>
                        actu-generale
                      </c:otherwise>
                    </c:choose>
                        adherent bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-200 dark:hover:bg-gray-600">
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
            <td class="px-3 py-4 text-center whitespace-nowrap">
              <fmt:formatDate value="${item.date_ajout}" pattern="dd/MM/yy"/>
            </td>
            <td class="px-3 py-4 text-center">
              <c:out value="${item.adherent.denomination}"/>
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
  function filterRows(radioButton) {
      var actusGeneralesRows = $('.actu-generale');
      var actusAdherentRows = $('.actu-adherent');
      switch ($(radioButton).val()) {
        case 'actusAdherent':
            actusAdherentRows.show();
            actusGeneralesRows.hide();
            break;
        case 'actusGenerales':
            actusGeneralesRows.show();
            actusAdherentRows.hide();
            break;
        case 'all':
            actusGeneralesRows.show();
            actusAdherentRows.show();
            break;
      }
  }

  function showAddForm() {
    $("#addItemForm").toggle('quick');
  }
</script>