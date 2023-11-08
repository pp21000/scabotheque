<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<c:url value="/AA-page-photos" var="url"/>
<button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
        type="reset" onClick="window.location = '${url}'">< Retour
</button>

<div>

  <form:form method="post" modelAttribute="editForm" action="AA-edit-photo?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">    
    <form:input type="hidden" path="editAAPhoto.id"/>
    <form:input type="hidden" path="editAAPhoto.data"/>
    <fieldset class="mx-auto justify-center">
      <div class="md:flex md:items-center mb-6 w-full">
        <div class="w-1/5">
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="libelle">
            Libellé
          </label>
        </div >
        <div class="w-3/5">
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200 text-black" type="text" name="editAAPhoto.libelle" path="editAAPhoto.libelle" id="libelle"/>
          <form:errors class="error-message" path="editAAPhoto.libelle"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="data">
            Image
          </label>
        </div>

        <div class="w-3/5" >  
          <div class="flex">
            <img class="max-h-24 mr-5 rounded" src="${photo.dataImg}"/>     
            <div class="my-auto flex justify-center">
              <div class="flex flex-col">
                <form:input type="file" path="editAAPhoto.file" accept="image/x-png,image/gif,image/jpeg"/>
              </div>
            </div>
          </div>
          <form:errors class="error-message" path="editAAPhoto.data"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-gray-400 font-bold md:text-right mb-1 md:mb-0 pr-4" for="alt">
            alt
          </label>
        </div>
        <div class="w-3/5" >
          <form:input class="p-2 bg-white w-full rounded-lg border border-gray-200 text-black" type="text" name="editAAPhoto.alt" path="editAAPhoto.alt" id="alt"/>
          <form:errors class="error-message" path="editAAPhoto.alt"/>
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

