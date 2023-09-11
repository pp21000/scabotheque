<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div  class="editAdherentEntete" >
    <div class="entete">				
        <div class="photo">
            <c:choose >
                <c:when test = "${adherent.photoImg == ''}"> 
                    <img src="<c:url value="/resources/images/noAdh.png" />" />
                </c:when>
                <c:otherwise> 						
                    <img src="${adherent.photoImg}">
                </c:otherwise>
            </c:choose>
        </div>
        <div>
            <span class="scabotheque-h3">${adherent.denomination}</span>
            <div>
                <span class="detailLabel"><spring:message code="label.codeAdh"/></span>
                <span class="data" > ${adherent.code} </span>
            </div>
        </div>
    </div>
	
    <div class="textAlignRight">
        <button class="action-button" id="addContact" type="button">Ajouter un contact</button>
    </div>
	
</div>
	
<form:form class="addAdherentContact" method="post" modelAttribute="contactToAdd" action="addAdherentContact" >
	<form:input type="hidden" path="contact.adherentId"/>
		
	<div  id="addContactForm" <c:if test="${contactToAdd.contact.nom == null || contactToAdd.contact.nom.isEmpty() }"> style="display:none" </c:if> title="Ajouter un contact" >
            <fieldset>
                <legend class="legend"><spring:message code="label.addContact"/></legend>
                <div>
                    <div class="showDetailEditContactCivilite">
                        <form:label path="contact.civilite" ><spring:message code="label.civilite"/></form:label>
                        <form:select class="valeur" name="contact.civilite" path="contact.civilite">
                        <form:options items="${civilite}" />
                        </form:select>
                        <form:errors class="error" path="contact.civilite" />
                    </div>
                    <div class="showDetailEditContact">
                        <form:label path="contact.nom" ><spring:message code="label.nom"/></form:label>
                        <form:input class="valeur" name="contact.nom" path="contact.nom"/>
                        <form:errors class="error" path="contact.nom" />
                    </div>
                    <div class="showDetailEditContact">
                        <form:label path="contact.prenom" ><spring:message code="label.prenom"/></form:label>
                        <form:input class="valeur" name="contact.prenom" path="contact.prenom"/>
                        <form:errors class="error" path="contact.prenom" />
                    </div>
                    <div class="showDetailEditContact">
                        <form:label path="contact.fonction.id" ><spring:message code="label.fonction"/></form:label>
                        <form:select class="valeur" path="contact.fonction.id">
                        <form:options items="${contactFonctions}" itemValue="id" itemLabel="libelle" />
                        </form:select>
                    </div>
                    <div class="showDetailEditContact">
                        <form:label path="contact.mail" ><spring:message code="label.mail"/></form:label>
                        <form:input class="valeur" name="contact.mail" path="contact.mail"/>
                        <form:errors class="error" path="contact.mail" />
                    </div>
                    <div class="showDetailEditContact">
                        <form:label path="contact.fixe" ><spring:message code="label.fixe"/></form:label>
                        <form:input class="valeur" name="contact.fixe" path="contact.fixe"/>
                        <form:errors class="error" path="contact.fixe" />
                    </div>
                    <div class="showDetailEditContact">
                        <form:label path="contact.mobile" ><spring:message code="label.mobile"/></form:label>
                        <form:input class="valeur" name="contact.mobile" path="contact.mobile"/>
                        <form:errors class="error" path="contact.mobile" />
                    </div>
                    <div  class="showDetailEditContact"> 
                        <form:label path="contact.dateNaissance" ><spring:message code="label.dateNaissance"/></form:label>
                        <form:input class="valeur" type="date" name="contact.dateNaissance" path="contact.dateNaissance"/>
                        <form:errors class="error" path="contact.dateNaissance" />
                    </div> 									 
                    <div class="editDataList"> inclure dans le mailing :
                        <span class="displayInline">
                            <form:checkbox path="${contact.isMailingDirigeant}" value="dirigeant" style="width: 50px;" name="dirigeant"/> 
                            <label for="dirigeant">Dirigeant</label>
                        </span>

                        <span class="displayInline">
                            <form:checkbox path="${contact.isMailingCommerce}" value="commerce" style="width: 50px;" name="commerce"/> 
                            <label for="commerce">Commercial</label>
                        </span>

                        <span class="displayInline">
                            <form:checkbox path="${contact.isMailingAdministratif}" value="administratif" style="width: 50px;" name="admin"/>  
                            <label for="admin">Administratif</label>
                        </span>

                        <span class="displayInline">
                            <form:checkbox path="${contact.isMailingCompta}" value="compta" style="width: 50px;" name="compta"/> 
                            <label for="compta">Comptabilité</label>
                        </span>
                    </div>
                </div>
               <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <div class="showDetailEditContactCivilite">
                        <span class="scabotheque-h3">Accès spécifique à EOLAS <form:checkbox style="width: 50px;" path="${contact.isAccessEOLAS}" value="accesEOLAS"/></span>
                        <span>Les accès de l'entreprise sont définis avec les informations Rubis </span>
                    </div>
                    <div class="editData">		
                        <spring:message code="label.role" var="message"/>
                        <form:select class="valeur" path="contact.roleSalarieEOLASId">
                            <form:options items="${roleSalarieEOLAS}" itemValue="id" itemLabel="libelle" />
                        </form:select>
                    </div>
                    <div class="editData">		
                        <spring:message code="label.login" var="message"/>
                        <form:input class="valeur" path="${contact.loginEOLAS}" placeholder="${message}"/>
                    </div>
                    <div class="editData">		
                        <spring:message code="label.pass" var="message"/>
                        <form:input class="valeur" path="${contact.passEOLAS}" placeholder="${message}"/>
                    </div>
                </sec:authorize>
                <div class="textAlignRight">
                    <button class="action-button" type="submit">Enregistrer le contact</button>
                </div>
                
            </fieldset>
	</div>
</form:form>

<form:form class="editAdherentContact" method="post" modelAttribute="contactToEdit" action="editAdherentContact?${_csrf.parameterName}=${_csrf.token}"
	enctype="multipart/form-data"  >
    <fieldset>
        <legend class="legend"><spring:message code="label.contacts"/></legend>
        <c:forEach items="${contactToEdit.adherentContacts}" var="adherentContact" varStatus="status">
            <form:input type="hidden" path="adherentContacts[${status.index}].Id"/>
            <form:input type="hidden" path="adherentContacts[${status.index}].adherentId"/>
            <form:input type="hidden" path="adherentContacts[${status.index}].photoImg"/>
            <%--<form:input type="hidden" path="adherentContacts[${status.index}].roleEOLAS"/>--%>


            <div class="colonnesEditContact">

                <div class="photoContact">
                    <c:choose >
                        <c:when test = "${adherentContact.photoImg == ''}"> 
                            <img src="<c:url value="/resources/images/noAdh.png" />" />
                        </c:when>
                        <c:otherwise> 						
                            <img style="max-width:15em; max-height:15em;" src="${adherentContact.photoImg}">
                        </c:otherwise>
                    </c:choose>
                    <form:input type="file" path="adherentContacts[${status.index}].file" accept="image/x-png,image/gif,image/jpeg" /> <br /> 
                </div>

                <div >
                    <div style="display:flex; padding: 0 1.1em;">		
                        <form:select style="width:5em;" class="valeur" path="adherentContacts[${status.index}].civilite">
                            <form:options items="${civilite}" />
                        </form:select>
                        <spring:message code="label.nom" var="message"/>
                        <form:input style="flex:1;" class="valeur" path="adherentContacts[${status.index}].nom" placeholder="${message}"/>
                    </div>
                    <div class="editData">		
                        <spring:message code="label.prenom" var="message"/>
                        <form:input class="valeur" path="adherentContacts[${status.index}].prenom" placeholder="${message}"/>
                    </div>
                    <div class="editData">		
                        <form:select class="valeur" path="adherentContacts[${status.index}].fonction.id">
                        <form:options items="${contactFonctions}" itemValue="id" itemLabel="libelle" />
                        </form:select>
                    </div>
                    <div class="editData">
                        <spring:message code="label.mail" var="message"/>
                        <form:input class="valeur" path="adherentContacts[${status.index}].mail" placeholder="${message}"/>
                    </div>
                    <div class="editData">		
                        <spring:message code="label.fixe" var="message"/>
                        <form:input class="valeur" path="adherentContacts[${status.index}].fixe" placeholder="${message}"/>
                    </div>
                    <div class="editData">		
                        <spring:message code="label.mobile" var="message"/>
                        <form:input class="valeur" path="adherentContacts[${status.index}].mobile" placeholder="${message}"/>
                    </div> 
                    <div class="editData">		
                        <spring:message code="label.dateNaissance" var="message"/>
                        <form:input class="valeur" type="date" path="adherentContacts[${status.index}].dateNaissance" placeholder="${message}"/>
                    </div> 
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <div>
                            <span class="scabotheque-h3">Accès spécifique à EOLAS <form:checkbox style="width: 50px;" path="adherentContacts[${status.index}].isAccessEOLAS" value="accessEOLAS"/></span>
                            <span>Les accès de l'entreprise sont définis avec les informations Rubis </span>
                        </div>
                        <div class="editData">		
                            <spring:message code="label.login" var="message"/>
                            <form:input class="valeur" path="adherentContacts[${status.index}].loginEOLAS" placeholder="${message}"/>
                        </div>
                        <div class="editData">		
                            <spring:message code="label.pass" var="message"/>
                            <form:input class="valeur" path="adherentContacts[${status.index}].passEOLAS" placeholder="${message}"/>
                        </div>
                        <div class="editData">	
                            <form:select class="valeur" path="adherentContacts[${status.index}].roleSalarieEOLASId">
                            <form:options items="${roleSalarieEOLAS}" itemValue="id" itemLabel="commentaire" /></form:select>
                        </div>
                    </sec:authorize>       
                </div>
                <div class="editDataList">						
                    <span class="scabotheque-h3">Inclure dans le mailing : </span>
                    <span class="displayInline">
                        <form:checkbox path="adherentContacts[${status.index}].isMailingDirigeant" value="dirigeant" style="width: 50px;" name="dirigeant"/> 
                        <label for="dirigeant">dirigeant</label>
                    </span>

                    <span class="displayInline">
                        <form:checkbox path="adherentContacts[${status.index}].isMailingCommercial" value="commerce" style="width: 50px;" name="commerce"/> 
                        <label for="commerce">Commercial</label>
                    </span>

                    <span class="displayInline">
                        <form:checkbox path="adherentContacts[${status.index}].isMailingAdministratif" value="administratif" style="width: 50px;" name="administratif"/>  
                        <label for="administratif">Administratif</label>
                    </span>

                    <span class="displayInline">
                        <form:checkbox path="adherentContacts[${status.index}].isMailingComptabilite" value="compta" style="width: 50px;" name="compta"/> 
                        <label for="compta">Comptabilité</label>
                    </span>
                
                    <div><b><i><form:errors class="error" path="adherentContacts[${status.index}].nom" escape="false"/></i></b></div>
                    <div><b><i><form:errors class="error" path="adherentContacts[${status.index}].prenom" /></i></b></div>
                    <div><b><i><form:errors class="error" path="adherentContacts[${status.index}].mail" /></i></b></div>
                    <div><b><i><form:errors class="error" path="adherentContacts[${status.index}].fixe" /></i></b></div>
                </div>
                <div>
                    <c:url value="/edit/supprimeContact" var="url">
                            <c:param name="adhId" value="${adherentContact.adherentId}"/>
                            <c:param name="ctId" value="${adherentContact.id}"/>
                    </c:url>
                    <a href="${url}" title="<spring:message code="label.supprimeContact" />" ><svg class="delete"><use xlink:href="../resources/images/icones.svg#delete"></use></svg></a>
                </div>
            </div>
        </c:forEach>
    </fieldset>

    <fieldset class="fieldsetCommentaire">
        <legend class="legend"><spring:message code="label.commentaire"/></legend>
        <form:textarea id="summernote" name="editordata" path="commentaire" />
    </fieldset>

    <div class="textAlignRight">
        <button class="action-button" type="submit">Enregistrer</button>
        <c:url value="/adherentDetail" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <button class="action-button" type="reset" onClick="window.location='${url}'">Annuler</button>
    </div>
</form:form>

<script>
$(function() {
	$(document).ready(function() {
		  $('#summernote').summernote({
		 		placeholder: '<spring:message code="label.commentaire"/>',
		 		tabsize: 2,
		 		height: 150
			  
		  });
		  
		});
	
// 	$('#copieAll').click(function(e){ 
// 		console.log ("c'est bien, t'as cliqué ... ");
// 		$("input[id*='\\.nom']").val($("#adherentContacts0\\.nom").val());
// 		$("input[id*='\\.prenom']").val($("#adherentContacts0\\.prenom").val());
// 		$("input[id*='\\.mail']").val($("#adherentContacts0\\.mail").val());
// 		$("input[id*='\\.fixe']").val($("#adherentContacts0\\.fixe").val());
// 		$("input[id*='\\.mobile']").val($("#adherentContacts0\\.mobile").val());
// 	});
		
	$('#addContact').click(function(e){ 
		 $( "#addContactForm" ).toggle( 'slow' );
	});
  });
</script>
 
