<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div class="flex w-full">
  <c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="artipole"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
  <div class="w-1/12">
    <button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      <spring:message code="label.retour"/>
    </button>
  </div>
  <div class="w-5/6 flex justify-center items-center gap-2">
    <div class="flex items-center p-1.5 bg-gray-200 dark:bg-gray-600 rounded-2xl gap-2 min-w-[35rem]">
      <div class="w-1/2 flex justify-center gap-2">
        <span class="text-2xl"><spring:message code="label.tags"/></span>
      </div>
      <div class="w-1/2 flex items-center gap-1">
        <c:choose>
          <c:when test="${empty adherent.photoImg}">
            <img class="rounded h-10" src="<c:url value="/resources/images/noAdhPhoto.png"/>"/>
          </c:when>
          <c:otherwise>
            <img class="rounded h-10" src="${adherent.photoImg}">
          </c:otherwise>
        </c:choose>        
        <div class="w-full flex flex-col gap-0.5 truncate">
          <span class="font-semibold leading-none truncate">${adherent.denomination}</span>
          <div class="flex">
            <span class="bg-green-600 text-white text-xs font-medium px-2 py-0.5 mb-0.5 rounded">${adherent.code}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<form:form method="post" modelAttribute="editForm" action="editSpecialitesAdherent/${adherent.id}">

  <fieldset class="items-center mt-10">
    
    <div class="flex items-center justify-center text-md text-gray-200 dark:text-gray-500 gap-1 mb-3">
      <span class="text-center w-14 rounded-lg bg-gray-400 dark:bg-gray-900 px-2 py-1.5">Rang</span>
      <div class="flex items-center gap-5 rounded-lg bg-gray-400 dark:bg-gray-900 px-5 py-1.5">
        <span class="w-96 text-center">Métier</span>
        <span class="w-96 text-center">Spécialité</span>
      </div>
    </div>
        
    <c:forEach var="rank" begin="0" end="14">
      <form:input type="hidden" path="specialitesAdh[${rank}].id"/>
      <form:input type="hidden" path="specialitesAdh[${rank}].adherentId"/>
      <div class="flex items-center justify-center gap-1 mt-1">

        <div class="flex items-center justify-center rounded-lg bg-gray-200 dark:bg-gray-800 text-3xl w-14 h-14 px-2 py-1">${rank+1}</div>

        <div class="flex items-center gap-5 rounded-lg bg-gray-200 dark:bg-gray-800 px-5 py-3">
          <form:select onchange="updateSpecialitesSelectOptions(this)" name="specialitesAdh[${rank}]" path="specialitesAdh[${rank}].travauxId" class="travauxSelect py-1 px-1 w-96 dark:text-white text-sm bg-transparent border-0 border-b-2 border-gray-500 focus:ring-0 focus:border-blue-600">
            <form:option value="" class="dark:bg-gray-600"></form:option>                                                                                                      
            <form:options items="${travaux}" itemValue="id" itemLabel="libelle" class="dark:bg-gray-600"/>
          </form:select>

          <form:select onchange="updateSpecialitesSelectOptions(this)" name="specialitesAdh[${rank}]" path="specialitesAdh[${rank}].specialiteId" class="specialitesSelect py-1 px-1 w-96 dark:text-white text-sm bg-transparent border-0 border-b-2 border-gray-500 focus:ring-0 focus:border-blue-600">
            <form:option value="" data-value="0" style="display: none;" class="dark:bg-gray-600"></form:option>
            <c:forEach items="${specialites}" var="specialite">
              <form:option value="${specialite.id}" label="${specialite.libelle}" data-value="${specialite.travaux.id}" style="display: none;" class="dark:bg-gray-600"/>
            </c:forEach>
          </form:select>
        </div>

      </div>
    </c:forEach>
      
  </fieldset>

  <div class="flex justify-center gap-2 mt-10">
    <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" id="save" type="submit">
      Enregistrer
    </button>
    <button class="btn btn-red focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location='${urlPrev}'">
      Annuler 
    </button>
  </div>
    
</form:form>


      
<script>  
  
  function updateSpecialitesSelectOptions(element) {
      if ($(element).val() === "") {
        $(element).parent().find(".specialitesSelect").val("");
      }
      var allSpecialitesSelect = $(".specialitesSelect");
      var selectedSpecialites = allSpecialitesSelect.map(function() { return $(this).val(); }).get();
      allSpecialitesSelect.each(function() {
          var selectedTravauxId = $(this).parent().find(".travauxSelect").val();
          $(this).find('option').each(function() {
              $(this).toggle(String($(this).data('value')) === selectedTravauxId && !selectedSpecialites.includes($(this).val()));
          }); 
      });
  };
  
</script>
