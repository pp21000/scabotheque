<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="listeIdLibelle">

	<form:form method="get" action="listeCommunes">
		<span class="detailLabel"><spring:message code="label.isArtipole"/></span>
		${communeListe.departementFilter}
		<input name="filterCP" value="${filtreCP}" type="text" placeholder="Code postale ou Nom" autofocus="true" />
		<button class="action-button" type="submit">Rechercher</button>
	</form:form>

	<form:form method="post" modelAttribute="communeListe" action="saveCommune">
		
<!-- 		<input id="filterCP" type="text" placeholder="Code postale ou Nom"  /> -->
<!-- 		<br> -->
<!-- 		<select id="communeListe" class="communeListe" multiple > -->
<!-- 			<option value="" >trop de résultat</option> -->
<!-- 		</select> -->
		<div>
                    <spring:message code="count" arguments="${communeListe.list.size()}"/>
		</div>
		<div class="textAlignCenter">
			<c:if test = "${communeListe.list.size() < 200}">
				<c:forEach items="${communeListe.list}" var="editCommune" varStatus="status">
					<div>
						<form:input type="hidden" name="list[${status.index}].id" path="list[${status.index}].id"/>
					</div>
				
					<div class="showDetail colonne-commune">
						<form:input class="valeur" name="list[${status.index}].libelle" path="list[${status.index}].libelle"/> 
						<form:input class="valeur" name="list[${status.index}].departement" path="list[${status.index}].departement"/> 
						<form:input class="valeur" name="list[${status.index}].codePostal" path="list[${status.index}].codePostal"/> 
					</div>
				</c:forEach>
			</c:if>
		</div>
		<div class="saveButton">
			<button class="action-button" type="submit">Enregistrer</button>
<!-- 			<input type="submit"> -->
	    </div>
	</form:form>
	
	<span class="error-message" > ${erreur} </span>
	
</div>
