<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
				<span class="detailLabel"><spring:message code="label.codeAdh"/></span>
				<span class="data" > ${adhToEdit.adherent.code} </span>
			</div>
		</div>
	</div>
</div>  
  
<form:form class="editAdherent" method="post" modelAttribute="adhToEdit" action="editAdministratifAdh">
    <form:input type="hidden" path="adherent.id"/>

<!-- Permet de ne pas perdre les données autre que celles modifié -->
    <form:input type="hidden" name="adherent.code" path="adherent.code"/>
    <form:input type="hidden" name="adherent.code" path="adherent.codeERP"/>
    <form:input type="hidden" name="adherent.codeParent" path="adherent.codeERPParent"/>
    <form:input type="hidden" name="adherent.libelle" path="adherent.libelle"/>
    <form:input type="hidden" name="adherent.denomination" path="adherent.denomination"/>
    <form:input type="hidden" name="adherent.adresse" path="adherent.adresse"/>
    <form:input type="hidden" name="adherent.adresseComplement" path="adherent.adresseComplement"/>
    <form:input type="hidden" path="adherent.commune.id"/>
    <form:input type="hidden" path="adherent.pole.id"/>
    <form:input type="hidden" path="adherent.isArtipole"/>
    <form:input type="hidden" path="adherent.isCharteArtipole"/>
    <form:input type="hidden" path="adherent.isFlocageArtipole"/>
    <form:input type="hidden" path="adherent.isWebArtipole"/>
    <form:input type="hidden" path="adherent.isFacebookArtipole"/>
    <form:input type="hidden" path="adherent.agence.id"/>
    <form:input type="hidden" path="adherent.secteur.id"/>
    <form:input type="hidden" path="adherent.tournee.id"/>
    <form:input type="hidden" path="adherent.isOutilDechargement"/>
    <form:input type="hidden" path="adherent.longitude"/>
    <form:input type="hidden" path="adherent.latitude"/>
	
    <fieldset>
        <legend class="legend"><spring:message code="label.administratif"/></legend>

        <div class="showDetail">
                <form:label path="adherent.dateEntree"><spring:message code="label.dateEntree"/></form:label>
                <span>
                        <form:input class="valeur" type="date" name="adherent.dateEntree" path="adherent.dateEntree"/>
                        <form:errors class="errors" path="adherent.dateEntree" />
                </span>
        </div>

        <div class="showDetail">
                <form:label path="adherent.role" ><spring:message code="label.role"/></form:label>
                <form:select class="valeur" name="adherent.role" path="adherent.role.id">
                        <form:options items="${roleList}" itemValue="id" itemLabel="libelle" />
                </form:select>
                <b><i><form:errors path="adherent.role" /></i></b>
        </div>

         <div class="showDetail">
            <form:label path="adherent.adherentType" ><spring:message code="label.adherentType"/></form:label>
            <form:select class="valeur" name="adherent.adherentType" path="adherent.adherentType.id">
                    <form:options items="${adhTypesList}" itemValue="id" itemLabel="libelle" />
            </form:select>
        </div>

        <div class="showDetail">
            <form:label path="adherent.compteType" ><spring:message code="label.reglement"/></form:label>
            <form:select class="valeur" name="adherent.compteType" path="adherent.compteType.id">
                    <form:options items="${compteTypeList}" itemValue="id" itemLabel="libelle" />
            </form:select>
        </div>

        <div class="showDetail"> 
                <form:label path="adherent.formeJuridique" ><spring:message code="label.formeJuridique"/></form:label>
                <form:select class="valeur" name="adherent.formeJuridique" path="adherent.formeJuridique.id">
                        <form:options items="${formJuridList}" itemValue="id" itemLabel="libelle" />
                </form:select>
        </div>

        <div class="showDetail">
                <form:label path="adherent.siren" ><spring:message code="label.siren"/></form:label>
                <form:input class="valeur" name="adherent.siren" path="adherent.siren"/>
                <b><i><form:errors path="adherent.siren" /></i></b>
        </div>

        <div class="showDetail">
                <form:label path="adherent.siret" ><spring:message code="label.siret"/></form:label>
                <form:input class="valeur" name="adherent.siret" path="adherent.siret"/>
                <b><i><form:errors path="adherent.siret" /></i></b>
        </div>

        <div class="showDetail">
                <form:label path="adherent.ape" ><spring:message code="label.ape"/></form:label>
                <form:select class="valeur" name="adherent.ape" path="adherent.ape.id">
                        <form:options items="${apeList}" itemValue="id" itemLabel="libelle" />
                </form:select>
        </div>

        <div class="showDetail">
                <form:label path="adherent.numRepMetier" ><spring:message code="label.numRepMetier"/></form:label>
                <form:input class="valeur" name="adherent.numRepMetier" path="adherent.numRepMetier"/>
                <b><i><form:errors path="adherent.numRepMetier" /></i></b>
        </div>

<!-- 		<div class="showDetail"> -->
<%-- 			<form:label path="adherent.rcsRm" ><spring:message code="label.rcsRm"/></form:label> --%>
<%-- 			<form:input class="valeur" name="adherent.rcsRm" path="adherent.rcsRm"/> --%>
<%-- 			<b><i><form:errors path="adherent.rcsRm" /></i></b> --%>
<!-- 		</div> -->

        <div class="showDetail">
                <form:label path="adherent.rcsCommune" ><spring:message code="label.rcsCommune"/></form:label>
                <form:label class="valeur"  id="CommuneRcsLibelle" path="adherent.rcsCommune" >${adhToEdit.adherent.rcsCommune.codePostal} - ${adhToEdit.adherent.rcsCommune.libelle}</form:label>
                <form:input id="CommuneRcs" type="hidden" path="adherent.rcsCommune.id"/>
                <form:input type="hidden" path="adherent.rcsCommune.libelle"/>
                <form:input type="hidden" path="adherent.rcsCommune.codePostal"/>
                <span><a href="#" id="editRcsCommune"><svg><use xlink:href="../resources/images/icones.svg#edit"></use></svg></a></span>
        </div>

        <div class="showDetail">
                <form:label path="adherent.rmCommune" ><spring:message code="label.rmCommune"/></form:label>
                <form:label class="valeur"  id="CommuneRmLibelle" path="adherent.rmCommune" >${adhToEdit.adherent.rmCommune.codePostal} - ${adhToEdit.adherent.rmCommune.libelle}</form:label>
                <form:input id="CommuneRm" type="hidden" path="adherent.rmCommune.id"/>
                <form:input type="hidden" path="adherent.rmCommune.libelle"/>
                <form:input type="hidden" path="adherent.rmCommune.codePostal"/>
                <span><a href="#" id="editRmCommune"><svg><use xlink:href="../resources/images/icones.svg#edit"></use></svg></a></span>
        </div>

        <div class="showDetail">
                <form:label path="adherent.dateClotureExe"><spring:message code="label.dateClotureExe"/></form:label>
                <span>
                        <form:input class="valeur" type="date" name="adherent.dateClotureExe" path="adherent.dateClotureExe"/>
                        <form:errors class="errors" path="adherent.dateClotureExe" />
                </span>
        </div>
        
        <div class="showDetail">
                <form:label path="adherent.etat" ><spring:message code="label.etat"/></form:label>
                <form:select class="valeur" name="adherent.etat" path="adherent.etat.id">
                        <form:options items="${etatList}" itemValue="id" itemLabel="libelle" />
                </form:select>
        </div>

        <div class="showDetail">
            <form:label path="adherent.dateSortie"><spring:message code="label.dateSortie"/></form:label>
            <span>
                    <form:input class="valeur" type="date" name="adherent.dateSortie" path="adherent.dateSortie"/>
                    <form:errors class="errors" path="adherent.dateSortie" />
            </span>
        </div>

        <div  class="showDetail">
                <form:label path="adherent.cnxEolasAllow" ><spring:message code="label.cnxEolasAllow"/></form:label>
                <form:checkbox path="adherent.cnxEolasAllow"/>
        </div>

        <div class="showDetail">
                <form:label path="adherent.formationDirigeant" ><spring:message code="label.formationCommerce"/></form:label>
                <form:input class="valeur" name="adherent.formationDirigeant" path="adherent.formationDirigeant"/>
        </div>

    </fieldset>
	
    <fieldset>
        <legend class="legend"><spring:message code="label.commentaire"/></legend>
        <form:textarea id="summernote" name="editordata" path="commentaire"/>
    </fieldset>

    <div class="textAlignRight">
        <button class="action-button" type="submit">Enregistrer</button>
        <c:url value="/adherentAdministratif" var="url"><c:param name="idAdh" value="${adhToEdit.adherent.id}"/></c:url>
        <button class="action-button" type="reset" onClick="window.location='${url}'">Annuler</button>
    </div>

</form:form>

<div id="overlay"></div>
<div  id="dialogCommune" title="Selection de la commune" >

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
	var editRcs;  

	$(document).ready(function() {
		  $('#summernote').summernote({
		 		placeholder: '<spring:message code="label.commentaire"/>',
		 		tabsize: 2,
		 		height: 150
		  });
		});
	
	communeDialog = $('#dialogCommune').dialog({
		show: "fade",
        hide: "fade",
        resizable: false,
        autoOpen: false,
	    modal: true,
	    buttons: {
	    	"Selectionner" : function() {
	    		if (editRcs){
		        	$("#CommuneRcs").val($('#communeListe :selected').val());
		        	$("#CommuneRcsLibelle").text($('#communeListe :selected').text());
	    		}else{
	    			$("#CommuneRm").val($('#communeListe :selected').val());
		        	$("#CommuneRmLibelle").text($('#communeListe :selected').text());
	    		}
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
	  
	$('#editRcsCommune').click(function(e){ 
		editRcs = true;
		communeId = $("#rcsCommune");
		communeLib = $("#rcsCommuneLibelle");
		$("#overlay").show();
		communeDialog.dialog("open");
	});
	
	$('#editRmCommune').click(function(e){
		editRcs = false;
		communeId = $("#rmCommune");
		communeLib = $("#rmCommuneLibelle");
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
});

</script>
<!-- </head> -->
<!-- <body> -->
 
