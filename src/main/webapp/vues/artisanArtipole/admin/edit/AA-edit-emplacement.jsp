<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<c:url value="/AA-page-emplacement" var="url"/>
<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${url}'">
  <spring:message code="label.retour"/>
</button>

<div>

  <form:form method="post" modelAttribute="editForm" action="AA-edit-emplacement?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">    
    <form:input type="hidden" path="editAAEmplacement.id"/>
    <form:input type="hidden" path="editAAEmplacement.data"/>
    <form:input type="hidden" path="editAAEmplacement.type"/>
    <fieldset class="mx-auto justify-center">
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="type">
            Type
          </label>
        </div>
        <div class="w-3/5">
          <%--<form:input class="w-full input-text" type="text" name="editAAEmplacement.type" path="editAAEmplacement.type" id="type"/>--%>
          <div class="w-full text-white" name="editAAEmplacement.type" path="editAAEmplacement.type">&nbsp;<c:out value="${emplacement.type}"/></div>
          <form:errors class="error-message" path="editAAEmplacement.type"/>
        </div>
      </div>
      <div class="md:flex md:items-center mb-6 w-full">
        <div class="w-1/5">
          <label class="block text-right mr-2" for="libelle">
            Libellé
          </label>
        </div >
        <div class="w-3/5">
          <form:input class="w-72 input-text" type="text" name="editAAEmplacement.libelle" path="editAAEmplacement.libelle" id="libelle"/>
          <form:errors class="error-message" path="editAAEmplacement.libelle"/>
        </div>
      </div>
        
      <div class="md:flex md:items-center mb-6">
        
        <div class="w-1/5" >
          <label class="block text-right mr-2" for="content">
            Content
          </label>
        </div>
        <div class="w-3/5" >    
          <form:input class="w-full input-text" type="text" name="editAAEmplacement.content" path="editAAEmplacement.content" id="content"/>
          <form:errors class="error-message" path="editAAEmplacement.content"/>
        </div>
      </div>
       
      <c:if test="${emplacement.type.equals('Image')}">
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-right mr-2" for="content">
            Image
          </label>
        </div>
        
        <div class="w-3/5" >    
          <div class="flex">   
            <img class="max-h-24 rounded mr-5" src="${emplacement.dataImg}"/>
            <div class="my-auto flex justify-center">
              <div class="flex flex-col">
                <form:input type="file" path="editAAEmplacement.file" accept="image/x-png,image/gif,image/jpeg"/>
              </div>
            </div>
          </div>
          <form:errors class="error-message" path="editAAEmplacement.data"/>
        </div>
      </div>
      </c:if>
        
      <div class="md:flex md:items-center mb-6">
        <div class="w-1/5" >
          <label class="block text-right mr-2" for="alt">
            alt
          </label>
        </div>
        <div class="w-3/5" >
          <form:input class="w-full input-text" type="text" name="editAAEmplacement.alt" path="editAAEmplacement.alt" id="alt"/>
          <form:errors class="error-message" path="editAAEmplacement.alt"/>
        </div>
      </div>
        
      <div class="md:flex md:items-center mb-6">
        
        <div class="w-1/5" >
          <label class="block text-right mr-2" for="editAAEmplacement.page.id">
            Page
          </label>
        </div>
        
        <div class="w-3/5">
          <form:select name="editAAEmplacement.page" path="editAAEmplacement.page.id" class="flex-grow p-2 w-72 text-gray-900 bg-gray-50 border rounded border-gray-300 focus:ring-neutral-500 focus:border-neutral-500">
            <form:options items="${pageList}" itemValue="id" itemLabel="libelle"/>
          </form:select>
          <form:errors class="error-message" path="editAAEmplacement.page.id"/>
        </div>
        
      </div>
        
    </fieldset>

    <div class="mt-4 flex justify-center gap-2">
      <button type="submit" class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300">Enregistrer</button>
      <button type="reset" onClick="window.location = '${url}'" class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300">Annuler</button>
    </div>
  </form:form>
</div>

