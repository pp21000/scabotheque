<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<form:form class="editAdherent" method="post" modelAttribute="adhToAdd" action="addAdherent">
	<form:input type="hidden" path="adherent.id"/>

	<fieldset>
	   	<legend><spring:message code="label.identite"/></legend>
	   	
	   	<div class="showDetailAdherent">
			<form:label path="adherent.code" ><spring:message code="label.codeAdh"/></form:label>
			<form:input class="valeur" name="adherent.code" path="adherent.code" autofocus="true"/>
			<form:errors class="error" path="adherent.code" />
		</div>
		
	   	<div class="showDetailAdherent">
			<form:label path="adherent.codeERP" ><spring:message code="label.codeERP"/></form:label>
			<form:input class="valeur" name="adherent.codeERP" path="adherent.codeERP" autofocus="true"/>
			<form:errors class="error" path="adherent.codeERP" />
		</div>
		
		<div class="showDetailAdherent">
			<form:label path="adherent.libelle" ><spring:message code="label.nomRecherche"/></form:label>
			<form:input class="valeur" name="adherent.libelle" path="adherent.libelle"/>
			<form:errors class="error" path="adherent.libelle" />
		</div>
		
		<div class="showDetailAdherent">
			<form:label path="adherent.denomination" ><spring:message code="label.denomination"/> </form:label>
			<form:input class="valeur" name="adherent.denomination" path="adherent.denomination"/>
			<form:errors class="error" path="adherent.denomination" />
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.adresse" ><spring:message code="label.adresse"/></form:label>
			<form:input class="valeur" name="adherent.adresse" path="adherent.adresse"/>
			<form:errors class="error" path="adherent.adresse" />
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.adresseComplement" ><spring:message code="label.adresseComplement"/></form:label>
			<form:input class="valeur" name="adherent.adresseComplement" path="adherent.adresseComplement"/>
			<form:errors class="error" path="adherent.adresseComplement" />
		</div>
		
		<div class="showDetailAdherent">
			<form:label path="adherent.commune" ><spring:message code="label.commune"/></form:label>
			<div>
				<form:label class="valeur"  id="communeAdhLibelle" path="adherent.commune" >${adhToAdd.adherent.commune.codePostal} - ${adhToEdit.adherent.commune.libelle}</form:label>
				<form:input id="communeAdh" type="hidden" path="adherent.commune.id"/>
				<form:input type="hidden" path="adherent.commune.codePostal"/>
				<form:input type="hidden" path="adherent.commune.libelle"/>
				<span class="editButton"><a href="#" id="editCommune"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
			</div>
			<form:errors class="error" path="adherent.commune" />
		</div>
	</fieldset>


	<fieldset>
	   	<legend><spring:message code="label.activite"/></legend>
	
		<div class="showDetailAdherent">
			<form:label path="adherent.pole"><spring:message code="label.pole"/></form:label>
			<form:select class="valeur" name="adherent.pole" path="adherent.pole.id">
                          <%--<form:options items="${zonePrep}"/>--%>
                          <form:options items="${poleList}" itemValue="id" itemLabel="libelle" />
			</form:select>
			<form:errors class="error" path="adherent.pole" />
		</div>

		<div  class="showDetailAdherent">
			<form:label path="adherent.isArtipole" ><spring:message code="label.adhArtipole"/></form:label>
			<form:checkbox path="adherent.isArtipole"/>
		</div>

		<div  class="showDetailAdherent">
			<form:label path="adherent.isArtipole" ><spring:message code="label.charteArtipole"/></form:label>
			<form:checkbox path="adherent.isCharteArtipole"/>
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.isArtipole" ><spring:message code="label.flocageArtipole"/></form:label>
			<form:checkbox path="adherent.isFlocageArtipole"/>
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.isArtipole" ><spring:message code="label.siteArtipole"/></form:label>
			<form:checkbox path="adherent.isWebArtipole"/>
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.isArtipole" ><spring:message code="label.facebookArtipole"/></form:label>
			<form:checkbox path="adherent.isFacebookArtipole"/>
		</div>
	
	</fieldset>

	<fieldset>
	   	<legend><spring:message code="label.exploitation"/></legend>

		<div class="showDetailAdherent">
			<form:label path="adherent.agence"><spring:message code="label.agenceRattachement"/></form:label>
			<form:select class="valeur" name="adherent.agence" path="adherent.agence.id">
				<form:options items="${agenceList}" itemValue="id" itemLabel="libelle" />
			</form:select>					        
<%-- 			<form:errors class="error" path="adherent.pole" /> --%>
		</div>
	
		<div class="showDetailAdherent">
			<form:label path="adherent.secteur"><spring:message code="label.secteur"/></form:label>
			<form:select class="valeur" name="adherent.secteur" path="adherent.secteur.id">
				<form:option value="" ></form:option>
				<form:options items="${secteurList}" itemValue="id" itemLabel="libelle" />
			</form:select>
			<form:errors class="error" path="adherent.secteur" />
<%-- 			<form:label class="valeur" path="adherent.secteur.libelle" >${adhToEdit.adherent.secteur.libelle}</form:label> --%>
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.tournee"><spring:message code="label.tournee"/></form:label>
			<form:select class="valeur" name="adherent.tournee" path="adherent.tournee.id">
				<form:options items="${tourneeList}" itemValue="id" itemLabel="libelle" />
			</form:select>					        
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.isOutilDechargement"><spring:message code="label.outilDechargement"/></form:label>
			<form:checkbox path="adherent.isOutilDechargement"/>
		</div>
	</fieldset>

	<fieldset>
	   	<legend><spring:message code="label.administratif"/></legend>

		<div class="showDetailAdherent">
			<form:label path="adherent.dateEntree"><spring:message code="label.dateEntree"/></form:label>
			<div>
				<form:input class="valeur" type="date" name="adherent.dateEntree" path="adherent.dateEntree"/>
				<form:errors class="errors" path="adherent.dateEntree" />
			</div>
		</div>
	
		<div class="showDetailAdherent">
			<form:label path="adherent.role" ><spring:message code="label.role"/></form:label>
			<form:select class="valeur" name="adherent.role" path="adherent.role.id">
				<form:options items="${roleList}" itemValue="id" itemLabel="libelle" />
			</form:select>
			<form:errors class="error" path="adherent.role" />
		</div>
	
		<div class="showDetailAdherent"> 
			<form:label path="adherent.formeJuridique" ><spring:message code="label.formeJuridique"/></form:label>
			<form:select class="valeur" name="adherent.formeJuridique" path="adherent.formeJuridique.id">
				<form:options items="${formJuridList}" itemValue="id" itemLabel="libelle" />
			</form:select>
			<form:errors class="error" path="adherent.formeJuridique" />
		</div>
		
		<div class="showDetailAdherent">
			<form:label path="adherent.siren" ><spring:message code="label.siren"/></form:label>
			<form:input class="valeur" name="adherent.siren" path="adherent.siren"/>
			<form:errors class="error" path="adherent.siren" />
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.siret" ><spring:message code="label.siret"/></form:label>
			<form:input class="valeur" name="adherent.siret" path="adherent.siret"/>
			<form:errors class="error" path="adherent.siret" />
		</div>
	
		<div class="showDetailAdherent">
			<form:label path="adherent.ape" ><spring:message code="label.ape"/></form:label>
			<form:select class="valeur" name="adherent.ape" path="adherent.ape.id">
				<form:options items="${apeList}" itemValue="id" itemLabel="libelle" />
			</form:select>
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.numRepMetier" ><spring:message code="label.numRepMetier"/></form:label>
			<form:input class="valeur" name="adherent.numRepMetier" path="adherent.numRepMetier"/>
			<form:errors class="error" path="adherent.numRepMetier" />
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.rcsRm" ><spring:message code="label.rcsRm"/></form:label>
			
			<form:select class="valeur" name="adherent.rcsRm" path="adherent.rcsRm">
				<form:option value="" ></form:option>
				<form:option value="RCS" >RCS</form:option>
				<form:option value="RM" >RM</form:option>
			</form:select>
<%-- 			<form:input class="valeur" name="adherent.rcsRm" path="adherent.rcsRm"/> --%>
			<form:errors class="error" path="adherent.rcsRm" />
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.rcsCommune" ><spring:message code="label.rcsCommune"/></form:label>
			<div>
				<form:label class="valeur"  id="rcsCommuneLibelle" path="adherent.rcsCommune" >${adhToAdd.adherent.rcsCommune.codePostal} - ${adhToEdit.adherent.rcsCommune.libelle}</form:label>
				<form:input id="rcsCommune" type="hidden" path="adherent.rcsCommune.id"/>
				<form:input type="hidden" path="adherent.rcsCommune.libelle"/>
				<form:input type="hidden" path="adherent.rcsCommune.codePostal"/>
				<span class="editButton"><a href="#" id="editRcsCommune"><svg><use xlink:href="resources/images/icones.svg#edit"></use></svg></a></span>
			</div>
			<form:errors class="error" path="adherent.rcsCommune" />
		</div>
		
		<div class="showDetailAdherent">
			<form:label path="adherent.dateClotureExe"><spring:message code="label.dateClotureExe"/></form:label>
			<form:input class="valeur" type="date" name="adherent.dateClotureExe" path="adherent.dateClotureExe"/>
			<form:errors class="errors" path="adherent.dateClotureExe" />
		</div>
		
                <div class="showDetailAdherent">
			<form:label path="adherent.FormationDirigeant" ><spring:message code="label.formationCommerce"/></form:label>
			<form:input class="valeur" name="adherent.FormationDirigeant" path="adherent.FormationDirigeant"/>
			<form:errors class="error" path="adherent.FormationDirigeant" />
		</div>

		<div class="showDetailAdherent">
			<form:label path="adherent.etat" ><spring:message code="label.etat"/></form:label>
			<form:select class="valeur" name="adherent.etat" path="adherent.etat.id">
				<form:options items="${etatList}" itemValue="id" itemLabel="libelle" />
			</form:select>
		</div>
                <div class="showDetailAdherent">
			<form:label path="adherent.adherentType" ><spring:message code="label.etat"/></form:label>
			<form:select class="valeur" name="adherent.adherentType" path="adherent.adherentType.id">
				<form:options items="${adherentTypeList}" itemValue="id" itemLabel="libelle" />
			</form:select>
		</div>
                <div class="showDetailAdherent">
			<form:label path="adherent.compteType" ><spring:message code="label.etat"/></form:label>
			<form:select class="valeur" name="adherent.compteType" path="adherent.compteType.id">
				<form:options items="${compteTypeList}" itemValue="id" itemLabel="libelle" />
			</form:select>
		</div>

		
	</fieldset>

	<div class="editButton">
		<button class="action-button" type="submit">Enregistrer</button>
		<c:url value="/showAdherent" var="url"><c:param name="idAdh" value="${adhToAdd.adherent.id}"/></c:url>
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
	var communeId;
	var communeLib;
	
	communeDialog = $('#dialogCommune').dialog({
        show: "fade",
        hide: "fade",
        resizable: false,
        autoOpen: false,
	    modal: true,
	    buttons: {
	    	"Selectionner" : function() {
	    		var commune = $('#communeListe :selected')
	    		console.log("selection : " + commune.val());
    			if( (commune.val() !== '')) {
		        	communeId.val($('#communeListe :selected').val());
		        	communeLib.text($('#communeListe :selected').text());
					$(this).dialog("close");
					$("#overlay").hide();
					return true;
	    		}
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
		communeId = $("#communeAdh");
		communeLib = $("#communeAdhLibelle");
		$("#overlay").show();
		communeDialog.dialog("open");
	});

	$('#editRcsCommune').click(function(e){ 
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
//                    alert(response);
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
</head>
<body>
 
