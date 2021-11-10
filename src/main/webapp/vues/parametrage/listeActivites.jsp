<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="listeIdLibelle">
	<form:form method="post" modelAttribute="creation" action="ajoutActivites" id="type" >
		<spring:message code="label.libelle" />
        <form:input path="libelle"/>
		<button class="action-button" type="submit"><spring:message code="label.ajout" /></button>
        <form:errors class="errors" path="libelle"/>
    </form:form>

	<form:form method="post" modelAttribute="editList" action="editActivite">
            <div class="textAlignCenter">
                <c:forEach items="${editList.list}" var="activite" varStatus="status">
                    <div>
                        <form:input type="hidden" name="list[${status.index}].id" path="list[${status.index}].id"/>
                    </div>

                    <div class="showDetail">
                        <form:input class="valeur" name="list[${status.index}].libelle" path="list[${status.index}].libelle"/> 
                        <form:input class="valeur" name="list[${status.index}].libelle" path="list[${status.index}].famillesListe"/> 
                        <form:input class="position" name="list[${status.index}].libelle" path="list[${status.index}].position"/> 
                        <c:url value="/supprimeActivite" var="url"><c:param name="id" value="${activite.id}"/></c:url>
                        <a href="${url}"><svg class="delete"><use xlink:href="../resources/images/icones.svg#delete"></use></svg></a>
                        <form:errors class="errors" path="list[${status.index}].libelle" />
                        <form:errors class="errors" path="list[${status.index}].famillesListe" />
                    </div>
                </c:forEach>
            </div>
            <div class="saveButton">
                    <button class="action-button" type="submit">Enregistrer</button>
<!-- 			<input type="submit"> -->
	    </div>
	</form:form>
	
	<span class="errors" > ${erreur} </span>
	
</div>
