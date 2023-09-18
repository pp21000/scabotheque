<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="listeIdLibelle">
	<form:form method="post" modelAttribute="creation" action="ajout${pageLink}" id="type" >
		<spring:message code="label.libelle" />
        <form:input path="libelle"/>
		<button class="action-button" type="submit"><spring:message code="label.ajout" /></button>
<!--         <input type="submit"> -->
        <form:errors class="errors" path="libelle"/>
    </form:form>

    <form:form method="post" modelAttribute="editList" action="edit${pageLink}">
        <div class="textAlignCenter">
            <c:forEach items="${editList.list}" var="idLibelle" varStatus="status">
                <div>
                    <form:input type="hidden" name="list[${status.index}].id" path="list[${status.index}].id"/>
                </div>
                <div class="showDetail">
                    <form:input class="valeur" name="list[${status.index}].libelle" path="list[${status.index}].libelle"/> 
                    <form:input class="position" name="list[${status.index}].position" path="list[${status.index}].position"/> 
                    <c:url value="/supprime${pageLink}" var="url"><c:param name="id" value="${idLibelle.id}"/></c:url>
                    <a href="${url}"><svg class="delete"><use xlink:href="resources/images/icones.svg#delete"></use></svg></a>
                    <form:errors class="errors" path="list[${status.index}].libelle" />
                </div>

            </c:forEach>
        </div>
        <div class="saveButton">
            <button class="action-button" type="submit">Enregistrer</button>
        </div>
    </form:form>

    <span class="errors" > ${erreur} </span>
	
</div>
