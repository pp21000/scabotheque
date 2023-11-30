<%-- 
    Created on : 23 nov. 2023, 16:24:46
    Author     : paul.petit
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<c:url value="/AA-page-certifications" var="url"/>
<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${url}'">
  <spring:message code="label.retour"/>
</button>

<div>

  <form:form method="post" modelAttribute="editForm" action="AA-edit-certification?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">    
    <form:input type="hidden" path="editAACertification.id"/>
    <form:input type="hidden" path="editAACertification.data"/>
    <fieldset class="mx-auto justify-center">
      <div class="md:flex md:items-center mb-6 w-full">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="libelle">
            Libellé
          </label>
        </div >
        <div class="w-3/5">
          <form:input class="w-full input-text" type="text" name="editAACertification.libelle" path="editAACertification.libelle" id="libelle"/>
          <form:errors class="error-message" path="editAACertification.libelle"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-right mr-2" for="data">
            Image
          </label>
        </div>

        <div class="w-3/5" >  
          <div class="flex">
            <img class="max-h-24 mr-5 rounded" src="${certification.dataImg}"/>     
            <div class="my-auto flex justify-center">
              <div class="flex flex-col">
                <form:input type="file" path="editAACertification.file" accept="image/x-png,image/gif,image/jpeg"/>
              </div>
            </div>
          </div>
          <form:errors class="error-message" path="editAACertification.data"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-right mr-2" for="alt">
            alt
          </label>
        </div>
        <div class="w-3/5" >
          <form:input class="w-full input-text" type="text" name="editAACertification.alt" path="editAACertification.alt" id="alt"/>
          <form:errors class="error-message" path="editAACertification.alt"/>
        </div>
      </div>
    </fieldset>

    <div class="mt-4 flex justify-center gap-2">
      <button type="submit" class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300">Enregistrer</button>
      <button type="reset" onClick="window.location = '${url}'" class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300">Annuler</button>
    </div>
  </form:form>
</div>

