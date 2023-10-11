<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<c:url value="/AA-page-emplacement" var="url"/>
<button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
        type="reset" onClick="window.location = '${url}'">< Retour
</button>

<div>

  <form:form method="post" modelAttribute="editForm" action="AA-edit-emplacement?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">    
    <form:input type="hidden" path="editAAEmplacement.id"/>
    <fieldset class="mx-auto justify-center">
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="type">
            Type
          </label>
        </div>
        <div class="w-3/5" >
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200" type="text" name="editAAEmplacement.type" path="editAAEmplacement.type" id="type"/>
          <form:errors path="editAAEmplacement.type"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6 w-full">
        <div class="w-1/5">
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="libelle">
            Libellé
          </label>
        </div >
        <div class="w-3/5">
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200" type="text" name="editAAEmplacement.libelle" path="editAAEmplacement.libelle" id="libelle"/>
          <form:errors path="editAAEmplacement.libelle"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="content">
            Content
          </label>
        </div>
        <div class="w-3/5" >    
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200" type="text" name="editAAEmplacement.content" path="editAAEmplacement.content" id="content"/>
          <form:errors path="editAAEmplacement.content"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="content">
            Data
          </label>
        </div>
        <div class="w-3/5" >    
          <c:choose>
            <c:when test="${emplacement.type.equals('image')}">
              <div class="flex">
                <img class="max-h-24 mr-5 rounded" src="${emplacement.dataImg}" />     
                <div class="my-auto flex justify-center ml-4">
                    <div class="flex flex-col">
                        <form:input type="file" path="editAAEmplacement.file"
                                    accept="image/x-png,image/gif,image/jpeg"/> <br/>
                    </div>
                </div>
                    
                    
              </div>
            </c:when>
            <c:otherwise>
              <form:input class="p-2  bg-white w-full rounded-lg border border-gray-200" type="text" name="editAAEmplacement.data" path="editAAEmplacement.data" id="data"/>
            </c:otherwise>
          </c:choose>
          <form:errors path="editAAEmplacement.data"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="alt">
            alt
          </label>
        </div>
        <div class="w-3/5" >
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200" type="text" name="editAAEmplacement.alt" path="editAAEmplacement.alt" id="alt"/>
          <form:errors path="editAAEmplacement.alt"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="id_page">
            Id page
          </label>
        </div>
        <div class="w-3/5" >
          <form:input class="p-2  bg-white rounded-lg border border-gray-200" type="number" name="editAAEmplacement.id_page" path="editAAEmplacement.id_page" id="id_page"/>
          <form:errors path="editAAEmplacement.id_page"/>
        </div>
      </div>
    </fieldset>

    <div class="mt-4 flex justify-center gap-2">
      <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">Enregistrer</button>
      <%--<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>--%>
      <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${url}'">Annuler</button>
    </div>
  </form:form>
</div>


<script>
  $(function () {
    $(document).ready(function () {
      $('#summernote').summernote({
        placeholder: '<spring:message code="label.commentaire"/>',
        tabsize: 2,
        height: 150
      });
    });
  });
</script>

