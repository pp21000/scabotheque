<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<c:url value="/AA-edit-metiers" var="urlEditMetier"/>



<div id="accordion-collapse" data-accordion="collapse" class="text-sm font-medium text-gray-900 rounded-xl dark:border-gray-600 dark:text-white">
  <!-- Liste des métiers -->
  <h2 id="accordion-collapse-heading-metiers" class="group flex text-gray-500 border border-b-0 border-gray-200 rounded-t-xl focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-800 dark:border-gray-700 dark:text-gray-400 bg-gray-300 dark:bg-gray-800">
    <button onclick="toggleListeMetiers()" type="button" data-accordion-target="#accordion-collapse-body-metier" aria-expanded="true" aria-controls="accordion-collapse-body-metier" class="flex flex-1 text-xl items-center group-hover:bg-gray-400 dark:group-hover:bg-gray-900 rounded-tl-xl justify-between p-5 font-medium text-left">
      <span class="flex-1">Liste des métiers</span>
      <svg class="w-6 h-6 dark:fill-gray-100" ><use xlink:href="<c:url value="/resources/images/icones.svg#expand_more"/>"></use></svg>
    </button>

    <span class="p-2 flex items-center text-center group-hover:bg-gray-400 dark:group-hover:bg-gray-900 rounded-tr-xl">
      <a href="${urlEditMetier}" class="block w-full px-4 py-2 cursor-pointer hover:bg-gray-300 dark:hover:bg-gray-600 hover:text-white rounded-lg">
        <spring:message code="label.editer"/>
      </a>          
    </span>
  </h2> 
      
  <div id="accordion-collapse-body-metier" class="hidden" aria-labelledby="accordion-collapse-heading-metier">
    <c:forEach items="${itemsList}" var="item">  
      <c:url value="/AA-delete-metier" var="urlDeleteMetier"><c:param name="idMetier" value="${item.id}"/></c:url>
        <span class="flex items-center px-4 py-2 border-b border-gray-300 dark:border-gray-600 bg-gray-200 dark:bg-gray-600">
          <span class="w-1/12">
          <c:out value="${item.libelle}"/>
          </span>
          <span class="flex-1 px-4">
            <c:out value="${item.description}"/>
          </span>
          <span class="px-4 py-4">
            <button type="button" onclick="confirmDelete('${urlDeleteMetier}', '${item.libelle}')"><svg class="w-10 h-10 p-2 fill-gray-400 hover:bg-red-900 hover:fill-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></button>
            <!--<a href="${urlDeleteMetier}"><svg class="w-10 h-10 p-2 dark:stroke-gray-400 hover:bg-red-900 hover:stroke-white rounded-lg"><use xlink:href="<c:url value="/resources/images/icones.svg#trash"/>"></use></svg></a>-->
          </span>
        </span>
    </c:forEach>
  </div>
  <!-- Liste des métiers --> 
  
</div>


<script>
  function confirmDelete(url, nom) {
    if (confirm("Voulez-vous vraiment supprimer ce métier : " + nom + " ?")) {
      window.location.href = url;
    }
  }
  
  function toggleListeMetiers() {
    $("#accordion-collapse-body-metier").slideToggle(400);
  }
  
  
</script>