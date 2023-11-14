<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
<button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location = '${url}'">
  < Retour
</button>

<div class="flex justify-center">
  <div class="rounded bg-neutral-50 p-4 border border-neutral-200 flex flex-col items-center">
    <div>
      <c:choose>
        <c:when test="${adherent.photoImg == ''}">
          <img class="rounded-full h-32" src="<c:url value="/resources/images/noAdh.png" />"/>
        </c:when>
        <c:otherwise>
          <img class="rounded-full h-32" src="${adherent.photoImg}">
        </c:otherwise>
      </c:choose>
    </div>
    <div class="flex flex-col">
      <div class="text-center text-lg font-semibold">
        ${adherent.denomination}
      </div>
      <div class="text-center text-sm">
        <spring:message code="label.codeAdh"/> :
        ${adherent.code}
      </div>
    </div>
  </div>
</div>

<form:form method="post" modelAttribute="editForm" action="editMetiersAdherent/${adherent.id}">

  <fieldset class="flex justify-center mt-10">
    <div>
      <%--<legend class="text-center mt-4 mb-2 underline"><spring:message code="label.artipole"/></legend>--%>


      <c:forEach items="${editForm.metiersAdh}" var="metierAdh" varStatus="status">
        <form:input type="hidden" path="metiersAdh[${status.index}].id"/>
        <form:input type="hidden" path="metiersAdh[${status.index}].adherentId"/>
        <form:input type="hidden" path="metiersAdh[${status.index}].metierId"/>
        <div class="flex items-center mt-2">
          
          <form:checkbox class="w-4 h-4 text-neutral-600 bg-gray-100 rounded border-gray-300 focus:ring-neutral-500 focus:ring-2" path="metiersAdh[${status.index}].check"/>
          
          <div class="w-56 mx-2">
            <c:forEach items="${metiers}" var="metier">
              <c:if test="${metier.id == metierAdh.metierId}">
                <form:label class="flex items-center text-left" path="metiersAdh[${status.index}].check">${metier.libelle}</form:label>
              </c:if>
            </c:forEach>
          </div>

        </div>
      </c:forEach>
    </div>
  </fieldset>

  <div class="flex justify-center gap-2 mt-10">
    <button class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 focus:outline-none"
            id="save" type="submit">Enregistrer
    </button>
    <c:url value="/adherentProfil" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
      <button class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5"
              id="cancel" type="reset" onClick="window.location = '${url}'">Annuler </button>
  </div>

</form:form>

<script>
  $(function () {
    $(document).ready(function () {
      $('#summernote').summernote({
        placeholder: '<spring:message code="label.commentaire"/>',
        tabsize: 3,
        height: 100
      });
    });
  });
</script>
