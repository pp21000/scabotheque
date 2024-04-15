<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="listeUtilisateur">
	<form:form method="post" modelAttribute="roleListe" action="saveRoles">
            <div class="textAlignCenter">
            <div class="showDetail colonne-roleEOLAS">
                <span > Libellé </span>    
                <span> Nom dans le flux</span>    
                <span> Commentaire </span>    
            </div>
            <c:forEach items="${roleListe.list}" var="EditRolesEOLAS" varStatus="status">
                    <form:input type="hidden" name="list[${status.index}].id" path="list[${status.index}].id"/>
                    <div class="showDetail colonne-roleEOLAS">
                            <form:input class="valeur" name="list[${status.index}].libelle" path="list[${status.index}].libelle"/> 
                            <form:input class="valeur" name="list[${status.index}].nomFlux" path="list[${status.index}].nomFlux"/> 
                            <form:input class="valeur" name="list[${status.index}].commentaire" path="list[${status.index}].commentaire"/> 
                    </div>
            </c:forEach>
            
            </div>
        </form:form>
	<span class="error-message" > ${erreur} </span>
	
</div>

<script>
$(function() {
	$('[id^=user-]').click(function (e) {
	    $(this).closest('div').next('div.detail').toggle();
	})
});
</script>
