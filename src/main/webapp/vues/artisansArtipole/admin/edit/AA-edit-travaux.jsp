<%-- 
    Document   : AA-edit-travaux
    Created on : 8 déc. 2023, 08:52:54
    Author     : paul.petit
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<c:url value="/AA-page-travaux" var="url"/>
<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${url}'">
  <spring:message code="label.retour"/>
</button>

<div>

  <form:form method="post" modelAttribute="editForm" action="AA-edit-travaux">    
    <form:input type="hidden" path="editAATravaux.id"/>
    <fieldset class="w-1/2 mx-auto">
      
      
      <div class="flex items-center gap-2 mb-6">
        <div class="w-1/4">
          <label class="block text-right" for="libelle">
            Type de travaux
          </label>
        </div >
        <div class="w-3/4">
          <form:input class="w-96 input-text" type="text" name="editAATravaux.libelle" path="editAATravaux.libelle"/>
          <form:errors class="error-message" path="editAATravaux.libelle"/>
        </div>
      </div>

      
      <div class="text-center mt-5">
        <button type="button" onclick="createNewSpecialiteInput()" class="btn btn-small btn-blue">Ajouter une spécialité associée</button>
        
        <ul id="SpecialiteInputs">
          
          <c:forEach items="${editForm.specialites}" var="specialite" varStatus="loop">
            
            <li class="flex items-center mt-2 justify-center">  
              <form:input type="hidden" path="specialites[${loop.index}].id"/>
              <label class="mr-2" for="specialites[${loop.index}].libelle">Spécialité</label>
              <form:input type="text" name="specialites[${loop.index}].libelle" path="specialites[${loop.index}].libelle" class="w-96 input-text"/>
              <button type="button" onclick="deleteSpecialite(this)"><svg class="ml-1 mr-11 w-10 h-10 p-2 fill-gray-400 hover:bg-red-900 hover:fill-white rounded-lg"><use xlink:href="/scabotheque/resources/images/icones.svg#trash"></use></svg></button>
            </li>
          
          </c:forEach>
        </ul>
      </div>      
      

    </fieldset>

    <div class="mt-4 flex justify-center gap-2">
      <button type="submit" class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300">Enregistrer</button>
      <button type="reset" onClick="window.location = '${url}'" class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300">Annuler</button>
    </div>
  </form:form>
</div>


<script>
  function createNewSpecialiteInput() {
    numberOfInputs = $('#SpecialiteInputs li').length;
    var newInput = $('<li class="hidden flex items-center mt-2 justify-center">' +
                     '   <label class="mr-2" for="editAATravaux.libelle">Spécialité</label>' +
                     '   <input name="specialites[' + numberOfInputs + '].libelle" path="specialites[' + numberOfInputs + '].libelle" class="w-96 input-text"/>' +
                     '   <button type="button" onclick="deleteSpecialite(this)"><svg class="ml-1 mr-11 w-10 h-10 p-2 fill-gray-400 hover:bg-red-900 hover:fill-white rounded-lg"><use xlink:href="/scabotheque/resources/images/icones.svg#trash"></use></svg></button>' +
                     '</li>');
    $('#SpecialiteInputs').append(newInput);
    newInput.slideDown({ start: function () { $(this).css({ display: "flex" }); }, duration: 200 });
  }

  function deleteSpecialite(elmt) {
    $(elmt).parent().slideUp(200, function () {
        $(this).remove();
    });
  }
</script> 
    
    
    
    
    



