<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="listeUtilisateur">
	<form:form method="post" modelAttribute="creation" action="AjoutUtilisateur">
		<span class="adherentLabel">Nouvel utilisateur</span>
		<form:input path="userName" placeholder="Nom de l'utilisateur" autofocus="true"/>
		<form:input path="password" placeholder="Mot de passe"/>
<%-- 		<form:input name="username" value="${username}" type="text" placeholder="Nom de l'utilisateur" autofocus="true" /> --%>
<%-- 		<form:input name="password" value="${password}" type="text" placeholder="Mot de passe"/> --%>
		<button class="action-button" type="submit"><spring:message code="label.ajout" /></button>
	</form:form>

	<form:form method="post" modelAttribute="utilisateurListe" action="listeUtilisateurs">
		<div class="textAlignCenter">
			<c:forEach items="${utilisateurListe.list}" var="editUser" varStatus="status">
				<form:input type="hidden" name="list[${status.index}].id" path="list[${status.index}].id"/>
				<form:input type="hidden" name="list[${status.index}].password" path="list[${status.index}].password"/>
			
				<div class="detail">
<!-- 				style="display: grid; grid-template-columns: 20em 1fr; border-bottom: solid 1px gray; -->
					<div class="showDetail" style="display: grid; grid-template-columns: 15em 5em; ">
						<span id="user-1${editUser.username}" class="adherentLabel" style="margin: auto; margin-left:0;" >${editUser.username}</span>
						<a  id="user-2${editUser.username}" ><svg><use xlink:href="../resources/images/icones.svg#edit"></use></svg></a>
					</div>
				
					<div class="detail" style="display:none;" id="user-${editUser.username}">
						<div class="colonnesTriple">
							<form:input class="valeur" name="list[${status.index}].username" path="list[${status.index}].username" /> 
							<form:input class="" name="list[${status.index}].newPassword" path="list[${status.index}].newPassword" placeholder="Nouveau mot de passe"/> 
							
							<div class="showDetail">
								<form:label path="list[${status.index}].enabled" >actif :</form:label>
								<form:checkbox path="list[${status.index}].enabled"/>
							</div>
						</div>

						<div class="colonnesTriple alignLeft">
						<c:forEach items="${editUser.userRoles}" var="userRole" varStatus="roleStatus">
							<div>
								<form:input type="hidden" name="list[${status.index}].userRoles[${roleStatus.index}].id" path="list[${status.index}].userRoles[${roleStatus.index}].id"/>
								<form:input type="hidden" name="list[${status.index}].userRoles[${roleStatus.index}].role" path="list[${status.index}].userRoles[${roleStatus.index}].role"/>
								<form:checkbox path="list[${status.index}].userRoles[${roleStatus.index}].actif" value="role"/>${userRole.libelle}
							</div>
						</c:forEach>
						</div>
	   				</div>
				</div>
				<div><b><i><form:errors class="error" path="list[${status.index}].username" escape="false"/></i></b></div>
				<div><b><i><form:errors class="error" path="list[${status.index}].password" escape="false"/></i></b></div>
			</c:forEach>
		</div>
		<div class="saveButton">
			<button class="action-button" type="submit">Enregistrer</button>
	    </div>
	</form:form>
	
	<span class="errors" > ${erreur} </span>
	
</div>

<script>
$(function() {
	$('[id^=user-]').click(function (e) {
	    $(this).closest('div').next('div.detail').toggle();
	})
});
</script>
