<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div  class="editAdherentEntete" >
	<div class="entete">
		<div class="photo">
			<c:choose >
				<c:when test = "${adhToEdit.adherent.photo == ''}"> 
					<img src="<c:url value="/resources/images/noAdh.png" />" />
				</c:when>
				<c:otherwise> 						
					<img src="${adhToEdit.adherent.photo}">
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<span class="scabotheque-h3">${adhToEdit.adherent.denomination}</span>
			<div>
				<span class="adherentLabel"><spring:message code="label.codeAdh"/></span>
				<span class="data" > ${adhToEdit.adherent.code} </span>
			</div>
		</div>
	</div>
</div>

<form:form class="editAdherent" method="post" modelAttribute="adhToEdit" action="editIdentiteAdh">
	<form:input type="hidden" path="adherent.id"/>

<!-- Permet de ne pas perdre les données autre que celles modifié -->
<%-- 	<form:input type="hidden" name="adherent.code" path="adherent.code"/> --%>
<%-- 	<form:input type="hidden" name="adherent.libelle" path="adherent.libelle"/> --%>
<%-- 	<form:input type="hidden" name="adherent.denomination" path="adherent.denomination"/> --%>
<%-- 	<form:input type="hidden" name="adherent.adresse" path="adherent.adresse"/> --%>
<%-- 	<form:input type="hidden" name="adherent.adresseComplement" path="adherent.adresseComplement"/> --%>
<%-- 	<form:input type="hidden" path="adherent.commune.id"/> --%>
<%-- 	<form:input type="hidden" path="adherent.pole.id"/> --%>
<%-- 	<form:input type="hidden" path="adherent.isArtipole"/> --%>
	<form:input type="hidden" path="adherent.isCharteArtipole"/>
	<form:input type="hidden" path="adherent.isFlocageArtipole"/>
	<form:input type="hidden" path="adherent.isWebArtipole"/>
	<form:input type="hidden" path="adherent.isFacebookArtipole"/>
	<form:input type="hidden" path="adherent.agence.id"/>
	<form:input type="hidden" path="adherent.secteur.id"/>
	<form:input type="hidden" path="adherent.tournee.id"/>
	<form:input type="hidden" path="adherent.isOutilDechargement"/>
	<form:input type="hidden" path="adherent.dateEntree"/>
	<form:input type="hidden" path="adherent.role.id"/>
	<form:input type="hidden" path="adherent.formeJuridique.id"/>
	<form:input type="hidden" path="adherent.siren"/>
	<form:input type="hidden" path="adherent.siret"/>
	<form:input type="hidden" path="adherent.ape.id"/>
	<form:input type="hidden" path="adherent.numRepMetier"/>
	<form:input type="hidden" path="adherent.rcsRm"/>
	<form:input type="hidden" path="adherent.rcsCommune.id"/>
	<form:input type="hidden" path="adherent.rmCommune.id"/>
	<form:input type="hidden" path="adherent.dateClotureExe"/>
	<form:input type="hidden" path="adherent.contactComptable"/>
	<form:input type="hidden" path="adherent.isFormationCommerce"/>
	<form:input type="hidden" path="adherent.etat.id"/>

	<fieldset>
	   	<legend class="legend"><spring:message code="label.identite"/></legend>
	   	
	   	<div class="showDetailAdherent">
			<form:label path="adherent.code" ><spring:message code="label.codeAdh"/></form:label>
			<form:label path="adherent.code" >${adhToEdit.adherent.code}</form:label>
			<form:input type="hidden" name="adherent.code" path="adherent.code"/>
			<b><i><form:errors class="valeur" path="adherent.code" /></i></b>
		</div>

	   	<div class="showDetailAdherent">
			<form:label path="adherent.codeERP" ><spring:message code="label.codeERP"/></form:label>
			<form:input class="valeur" name="adherent.codeERP" path="adherent.codeERP"/>
			<b><i><form:errors class="valeur" path="adherent.codeERP" /></i></b>
		</div>
		
		<div class="showDetailAdherent">
			<form:label path="adherent.codeERPParent" ><spring:message code="label.codeERPParent"/></form:label>
			<form:input class="valeur" name="adherent.codeERPParent" path="adherent.codeERPParent"/>
			<b><i><form:errors class="valeur" path="adherent.codeERPParent" /></i></b>
		</div>
		
		<div class="showDetailAdherent">
			<form:label path="adherent.libelle" ><spring:message code="label.libelle"/></form:label>
			<form:input class="valeur" name="adherent.libelle" path="adherent.libelle"/>
			<b><i><form:errors class="valeur" path="adherent.libelle" /></i></b>
		</div>
		
		<div class="showDetailAdherent">
			<form:label path="adherent.denomination" ><spring:message code="label.denomination"/> </form:label>
			<form:input class="valeur" name="adherent.denomination" path="adherent.denomination"/>
			<b><i><form:errors class="valeur" path="adherent.denomination" /></i></b>
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.adresse" ><spring:message code="label.adresse"/></form:label>
			<form:input class="valeur" name="adherent.adresse" path="adherent.adresse"/>
			<b><i><form:errors class="valeur" path="adherent.adresse" /></i></b>
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.adresseComplement" ><spring:message code="label.adresseComplement"/></form:label>
			<form:input class="valeur" name="adherent.adresseComplement" path="adherent.adresseComplement"/>
			<b><i><form:errors class="valeur" path="adherent.adresseComplement" /></i></b>
		</div>
		
		<div class="showDetailAdherentCommune">
			<form:label path="adherent.commune" ><spring:message code="label.commune"/></form:label>
			<form:label id="communeAdhLibelle" path="adherent.commune" class="valeur" >${adhToEdit.adherent.commune.codePostal} - ${adhToEdit.adherent.commune.libelle}</form:label>
			<form:input id="communeAdh" type="hidden" path="adherent.commune.id"/>
			<form:input type="hidden" path="adherent.commune.codePostal"/>
			<form:input type="hidden" path="adherent.commune.libelle"/>
			<span><a href="#" id="editCommune"><svg><use xlink:href="<c:url value="/resources/images/icones.svg#edit"/>"></use></svg></a>
			<b><i><form:errors class="error" path="adherent.commune" /></i></b></span>
		</div>
		<div class="showDetailAdherent">
			<form:label path="adherent.pole" ><spring:message code="label.pole"/></form:label>
			<form:select class="valeur" name="adherent.pole" path="adherent.pole.id">
				<form:options items="${poleList}" itemValue="id" itemLabel="libelle" />
			</form:select>
			<b><i><form:errors path="adherent.pole" /></i></b>
		</div>
		<div  class="showDetailAdherent">
			<form:label path="adherent.isArtipole" ><spring:message code="label.adhArtipole"/></form:label>
			<form:checkbox path="adherent.isArtipole"/>
		</div>
	</fieldset>

	<div class="textAlignRight">
		<button class="action-button" id="save" type="submit">Enregistrer</button>
		<c:url value="/adherentDetail" var="url"><c:param name="idAdh" value="${adhToEdit.adherent.id}"/></c:url>
		<button class="action-button" id="cancel" type="reset" onClick="window.location='${url}'">Annuler</button>
	</div>

</form:form>

<!--  Test chargement de photo  -->
<form:form method="POST"  enctype="multipart/form-data" action="uploadFile?${_csrf.parameterName}=${_csrf.token}">
	<div class="photo">
		<c:choose >
			<c:when test = "${adhToEdit.adherent.photo == ''}"> 
				<img src="<c:url value="/resources/images/noAdh.png" />" />
			</c:when>
			<c:otherwise> 						
				<img src="${adhToEdit.adherent.photo}">
			</c:otherwise>
		</c:choose>
	</div>
	<input type="hidden" value="${adhToEdit.adherent.id}" name="adhId"> 
	Image à utiliser : <input type="file" name="file"  accept="image/x-png,image/gif,image/jpeg" /> <br /> 
	<button class="action-button" id="photo" type="submit">Envoyer l'image</button>
</form:form>	
<!-- fin photo -->


<div id="overlay"></div>
<div id="dialogCommune" title="Selection de la commune" >

	<span>Recherche de la commune:</span>
	<input id="filterCP" type="text" placeholder="Code postale ou Nom"  />
	<br>
	<select id="communeListe" class="communeListe" multiple >
		<option value="" >trop de résultat</option>
	</select>
</div>

<script>
$( function() {
	
	var globalTimeout = null;  

	communeDialog = $('#dialogCommune').dialog({
		show: "fade",
        hide: "fade",
        resizable: false,
        autoOpen: false,
	    modal: true,
	    buttons: {
	    	"Selectionner" : function() {
	        	$("#communeAdh").val($('#communeListe :selected').val());
	        	$("#communeAdhLibelle").text($('#communeListe :selected').text());
				$(this).dialog("close");
				$("#overlay").hide();
				return true;
	        },
	        "Annuler" : function() {
	        	$(this).dialog("close");
	        	$("#overlay").hide();
				return false;
	        }
	      }
	    });
	
	$('#currentCommune').text($('#communeAdhLibelle').text());
	  
	$('#editCommune').click(function(e){ 
		communeId = $("#rcsCommune");
		communeLib = $("#rcsCommuneLibelle");
		$("#overlay").show();
		communeDialog.dialog("open");
	});
	
	$('#filterCP').bind("keyup", function(){
		// Si un delay est en cour, on le supprime
		if (globalTimeout != null) {
			clearTimeout(globalTimeout);
		}
		
		// execution d'un delay
		globalTimeout = setTimeout(function() {
			globalTimeout = null;  
			populateListe();
		}, 1000);  
	});
		
	function populateListe(){
 		var params={filter: $("#filterCP").val()};
 		console.log (params);
		
		$.get("/scabotheque/loadCommuneListe",params, function(response) {
			console.log("retour servlet : " + response.length);
	        $selectList = $("#communeListe");
	        $selectList.find("option").remove();  
	        $.each(JSON.parse(response), function(index, commune) {
		        $("<option>").val(commune.id).text(commune.codePostal + " - " + commune.libelle).appendTo($selectList);
	        });                   
		});
	}
  } );
  </script>
<!-- </head> -->
<!-- <body> -->
 
