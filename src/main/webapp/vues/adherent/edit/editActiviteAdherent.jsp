<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="flex w-full">
  <c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="commerce"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
  <div class="w-1/12">
    <button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" id="cancel" type="reset" onClick="window.location = '${urlPrev}'">
      <spring:message code="label.retour"/>
    </button>
  </div>
  <div class="w-5/6 flex justify-center items-center gap-2">
    <div class="flex items-center p-1.5 bg-gray-200 dark:bg-gray-600 rounded-2xl gap-2 min-w-[35rem]">
      <div class="w-1/2 flex justify-center gap-2">
        <span class="text-2xl"><spring:message code="label.activite"/></span>
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

<form:form class="editAdherent" method="post" modelAttribute="editForm" action="editActiviteAdh">
  <fieldset class="mt-10">
    <form:input type="hidden" placeholder="messageErreur" path="messageErreur"/>
    <form:errors class="error-message" path="messageErreur" />
    <div class="flex flex-col items-center justiy-center gap-2 mt-2">
      <c:forEach items="${editForm.activitesAdh}" var="activite" varStatus="status">
        <form:input type="hidden" path="activitesAdh[${status.index}].id"/>
        <form:input type="hidden" path="activitesAdh[${status.index}].adherentId"/>
        <form:input type="hidden" path="activitesAdh[${status.index}].activiteId"/>
        <form:input type="hidden" path="activitesAdh[${status.index}].activiteLibelle"/>
        <div class="grid grid-cols-2 w-3/4 flex items-center gap-28">
          <div class="flex items-center justify-end gap-2">
            <span class="text-right">${activite.activiteLibelle}</span>
            <form:input class="input-text text-center w-10" style="padding-left:1px; padding-right:1px" type="text" path="activitesAdh[${status.index}].pourcentage"/>
            <span class="text-2xl">%</span>
            <form:errors class="error-message" path="activitesAdh[${status.index}].pourcentage"/>
          </div>
          <div class="flex items-center">
            <span class="text-right mr-2">Commentaire</span>
            <form:input class="input-text w-full" style="flex:1;" type="text" path="activitesAdh[${status.index}].commentaire"/>
          </div>
        </div>
      </c:forEach>
    </div>
  </fieldset>

  <fieldset class="flex justify-center mt-4">
    <legend class="text-center mt-4"><spring:message code="label.commentaire"/></legend>
    <form:textarea class="w-96 h-32 block input-textarea" id="summernote" name="editordata" path="commentaire"/>
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
  $(function() {
    $(document).ready(function() {
      $('#summernote').summernote({
          placeholder: '<spring:message code="label.commentaire"/>',
          tabsize: 3,
          height: 100
      });
    });
  });
</script>
 