<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<c:url value="/AA-edit-metiers" var="urlEditMetier"/>
<c:url value="/AA-edit-categories" var="urlEditCategorie"/>


<!-- Liste des métiers -->
<div id="accordion-collapse" data-accordion="collapse" class="text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-t-xl dark:bg-gray-700 dark:border-gray-600 dark:text-white ">
  <h2 id="accordion-collapse-heading-metiers" class="flex text-gray-500 border border-b-0 border-gray-200 rounded-t-xl focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-800 dark:border-gray-700 bg-white dark:text-gray-400 dark:bg-gray-800 hover:bg-gray-100 dark:hover:bg-gray-800">
    <button type="button" class="flex flex-1 items-center rounded-t-xl justify-between p-5 font-medium text-left " data-accordion-target="#accordion-collapse-body-metier" aria-expanded="false" aria-controls="accordion-collapse-body-metier">
      <span class="flex-1">Liste des métiers</span>
      <svg class="w-6 h-6 dark:fill-gray-100" ><use xlink:href="<c:url value="/resources/images/icones.svg#expand_more"/>"></use></svg>
    </button>

    <span class="mx-2 rounded-lg text-center my-auto hover:bg-gray-300 dark:hover:bg-gray-600">
      <a href="${urlEditMetier}" class="block w-full px-4 py-2 cursor-pointer ">
        <spring:message code="label.editer"/>
      </a>          
    </span>
  </h2> 
  <div id="accordion-collapse-body-metier" class="hidden" aria-labelledby="accordion-collapse-heading-metier">
    <c:forEach items="${listeMetiers}" var="item">  
      <c:url value="/AA-delete-metier" var="urlDeleteMetier"><c:param name="idMetier" value="${item.id}"/></c:url>
        <span class="flex px-4 py-2 border-b border-gray-200 hover:bg-gray-100 hover:text-blue-700 dark:border-gray-600 dark:hover:bg-gray-600 dark:hover:text-white ">
          <span class="w-1/12">
          <c:out value="${item.libelle}"/>
        </span>
        <span class="flex-1 px-4">
          <c:out value="${item.description}"/>
        </span>
        <span class="px-4 py-4">
          <button type="button" onclick="confirmDelete('${urlDeleteMetier}', '${item.libelle}')"><svg class="w-6 h-6 dark:fill-gray-100"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></button>
        <!--<a href="${urlDeleteMetier}"><svg class="w-6 h-6 dark:fill-gray-100"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></a>-->
        </span>

      </span>
    </c:forEach>
  </div>
  <!-- Liste des métiers -->

  <!-- Liste des catégories -->
  <h2 id="accordion-collapse-heading-categories" class="flex text-gray-500 border border-b-0 border-gray-200 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-800 dark:border-gray-700 bg-white dark:text-gray-400 dark:bg-gray-800 hover:bg-gray-100 dark:hover:bg-gray-800">
    <button type="button" class="flex flex-1 items-center rounded-lg justify-between p-5 font-medium text-left " data-accordion-target="#accordion-collapse-body-categories" aria-expanded="false" aria-controls="accordion-collapse-body-categories">
      <span class="flex-1">Liste des catégories</span>
      <svg class="w-6 h-6 dark:fill-gray-100" ><use xlink:href="<c:url value="/resources/images/icones.svg#expand_more"/>"></use></svg>
    </button>

    <span class="mx-2 rounded-lg text-center my-auto hover:bg-gray-300 dark:hover:bg-gray-600">
      <a href="${urlEditCategorie}" class="block w-full px-4 py-2 cursor-pointer ">
        <spring:message code="label.editer"/>
      </a>          
    </span>
  </h2>
  <div id="accordion-collapse-body-categories" class="hidden" aria-labelledby="accordion-collapse-heading-categories">
    <c:forEach items="${listeCategories}" var="item">  
      <c:url value="/AA-delete-categorie" var="urlDeleteCategorie"><c:param name="idCategorie" value="${item.id}"/></c:url>
        <span class="flex  px-4 py-2 border-b border-gray-200 hover:bg-gray-100 hover:text-blue-700 dark:border-gray-600 dark:hover:bg-gray-600 dark:hover:text-white ">
          <span class="flex-1 px-4">
          <c:out value="${item.libelle}"/>
        </span>

        <c:url value="/AA-edit-photo" var="urlDelete"><c:param name="idCategorie" value="${item.id}"/></c:url>
          <span class="px-4 py-4">
            <button type="button" onclick="confirmDelete('${urlDeleteCategorie}', '${item.libelle}')"><svg class="w-6 h-6 dark:fill-gray-100"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></button>
          <!--<a href="confirmDelete(${urlDeleteCategorie})"><svg class="w-6 h-6 dark:fill-gray-100"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></a>-->
        </span>

      </span>
    </c:forEach>
  </div>


</div>
<!-- Liste des catégories -->

<script>
  function confirmDelete(url, nom) {
    let text = "Voulez vous supprimer l'élèment : " + nom;
    if (confirm(text) == true) {
      window.location.href = url;
    }
  }
</script>