<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:url value="/adherentProfil" var="urlPrev"><c:param name="tab" value="commerce"/><c:param name="idAdh" value="${adherent.id}"/></c:url>
<button class="btn btn-prev focus:ring-4 focus:outline-none focus:ring-neutral-300" type="reset" onClick="window.location='${urlPrev}'">
  <spring:message code="label.retour"/>
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

<form:form class="editAdherent" method="post" modelAttribute="editForm" action="editActiviteAdh">
  <fieldset class="mt-10">
    <%--<legend class="legend underline text-center mt-4"><spring:message code="label.activite"/></legend>--%>
    <form:input type="hidden" placeholder="messageErreur" path="messageErreur"/>
    <form:errors class="error-message" path="messageErreur" />
    <div class="flex flex-col items-center justiy-center gap-2 mt-2">
      <c:forEach items="${editForm.activitesAdh}" var="activite" varStatus="status">
        <form:input type="hidden" path="activitesAdh[${status.index}].id"/>
        <form:input type="hidden" path="activitesAdh[${status.index}].adherentId"/>
        <form:input type="hidden" path="activitesAdh[${status.index}].activiteId"/>
        <form:input type="hidden" path="activitesAdh[${status.index}].activiteLibelle"/>
        <div class="grid grid-cols-2 w-3/4 flex items-center gap-28">
          <div class="flex items-center justify-end">
            <span class="text-right">${activite.activiteLibelle}</span>
            <form:input class="input-text text-center w-10 mx-2" style="padding-left:1px; padding-right:1px" type="text" path="activitesAdh[${status.index}].pourcentage"/>
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
 