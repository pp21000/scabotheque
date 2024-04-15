<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div>
  <form:form class="addAdherentSuivi" method="post" modelAttribute="suiviToAdd" action="edit/addAdherentSuivi">
    <form:input type="hidden" path="suiviVisiteAdh.adherentId"/>
    <div class="post">
      <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" id="openFormButton" type="button">
        Ajouter un suivi
      </button>
    </div>
    <div id="openForm" class="post" style="display:none" title="Ajouter un contact">
      <fieldset>
        <%--<legend><spring:message code="label.addSuivi"/></legend>--%>
        <div class="user-block">
          <%--<form:label path="suiviVisiteAdh.dateCommentaire"><spring:message code="label.dateSuivi"/></form:label>--%>
          <div class="col-2 flex gap-4 mt-2" id="reservationdate" data-target-input="nearest">
            <form:input class="input-text" type="date" path="suiviVisiteAdh.dateCommentaire" placeholder="Date de livraison"/>
            <form:textarea class="w-2/3 block input-textarea" id="summernote" name="editordata" path="suiviVisiteAdh.commentaire"/>
            <button class="btn btn-green focus:ring-4 focus:outline-none focus:ring-neutral-300" type="submit">
              Enregistrer le suivi
            </button>
          </div>
          <form:errors class="error-message" path="suiviVisiteAdh.dateCommentaire"/>
        </div>
      </fieldset>
    </div>
  </form:form>

  <div class="grid grid-cols-1 gap-4">
    <c:forEach items="${infoSuiviVisite}" var="visite">
      <div class="post bg-white border bg-neutral-50 border-neutral-200 rounded-lg p-2">
        <div class="user-block">
          <span class="username">
            <span class="text-sm">
              <spring:message code="label.dateSuivi"/>:
              <fmt:formatDate pattern="dd/MM/yyyy" value="${visite.dateCommentaire}"/>
            </span>
            <c:url value="/edit/editCRMAdh" var="url">
              <c:param name="idAdh" value="${adherent.id}"/>
              <c:param name="idSuivi" value="${visite.id}"/>
            </c:url>
            <a href="${url}" class="float-right btn-default"><i class="fa fa-pencil"></i></a>
          </span>
        </div>
        <p>${visite.commentaireString}</p>
      </div>
    </c:forEach>
  </div>
</div>

