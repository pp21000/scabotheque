<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<form:form id="myform" method="post" modelAttribute="criteria" action="listeAdherents">
    <form:input type="hidden" name="sender" path="sender"/>
    <form:input type="hidden" name="cc" path="cc"/>
    <form:input type="hidden" name="object" path="object"/>
    <form:input type="hidden" name="messageMail" path="messageMail"/>
    <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>
    <spring:message code="label.texteRecherche" var="recherchePH"/>
    <spring:message code="label.filtre.pole" var="poleLib"/>
    <spring:message code="label.filtre.secteur" var="secteurLib"/>
    <spring:message code="label.filtre.activite" var="activiteLib"/>
    <spring:message code="label.filtre.agence" var="agenceLib"/>

    
    
    <div class="listAdherent-recherche">
        <div class="listAdherent-recherche-criteres">
            <div style="display:inline-flex;">
                <c:url value="/initListeAdherents" var="urlInit"/>
                
                <form:input style="width:15em;" type="text" path="text" placeholder="${recherchePH}"  autofocus="true"/>
                
                <button class="action-button" type="submit">Rechercher</button>
                <span title="<spring:message code="label.rechercheAvance"/>" class="icon-button" id="advanceSearch"><svg><use xlink:href="resources/images/icones.svg#rechercheAvancee"></use></svg></span>
                <a title="<spring:message code="label.initRecherche"/>" class="icon-button" onclick="window.location.href='${urlInit}'"><svg><use xlink:href="resources/images/icones.svg#reset"></use></svg></a>
                
                <sec:authorize access="hasAnyRole('ROLE_MAILING','ROLE_EXPORT')">
                    <div class="scabotheque-dropdown">
                        <button id="btnMenu" type="button" class="scabotheque-dropdown-btn" onclick="openMenu()">
                            <svg class="scabotheque-dropdown-btn-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#menu"/>"></use></svg>
                        </button>
                        <div id="listAdhMenu" class="scabotheque-dropdown-container">
                            <sec:authorize access="hasRole('ROLE_EXPORT')">
                            <div class="scabotheque-dropdown-item">
                                <a href="#" id="exportExcelLink">
                                    <svg class="scabotheque-dropdown-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#excel"/>"></use></svg>
                                    <spring:message code="menu.exportExcel"/>
                                </a>
                            </div>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_MAILING')">
                              <div class="scabotheque-dropdown-item">
                                <a href="#" id="mailingLink">
                                  <svg class="scabotheque-dropdown-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#mail"/>"></use></svg>
                                  <spring:message code="menu.mailing"/>
                                </a>
                              </div>
                              <div class="scabotheque-dropdown-item">
                                <a href="#" id="exportContactLink">
                                  <svg class="scabotheque-dropdown-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#mail"/>"></use></svg>
                                  <spring:message code="menu.exportContact"/>
                                </a>
                              </div>
                            </sec:authorize>
                        </div>
                    </div>
                </sec:authorize>
            </div>
            <div>
                <spring:message code="count.adherent" arguments="${listeAdherents.size()}"/>
            </div>
            <div <c:if test = "${criteria.avertissement == ''}"> style="display: none;" </c:if> >
                ${criteria.avertissement}
            </div>
        </div>
    </div>
    <div id="advanceSearchForm" style="border: 1px solid #82aa37; border-radius: 0.4em; margin: 0.2em; padding: 0.4em;">
        <div style="display:grid; grid-template-columns: 1fr 1fr 1fr 1fr;" >
            <form:select style="height: 200px; padding:0.4em;" name="poleIds" path="poleIds" multiple="true">
                <form:option value="0" label="${poleLib}"/>
                <form:options items="${polesList}" itemValue="id" itemLabel="libelle" />
            </form:select>
            <form:select name="secteurIds" path="secteurIds" multiple="true">
                <form:option value="0" label="${secteurLib}"  />
                <form:options items="${secteursList}" itemValue="id" itemLabel="libelle" />
            </form:select>
            <form:select name="activiteIds" path="activiteIds" multiple="true">
                <form:option value="0" label="${activiteLib}"  />
                <form:options items="${activitesList}" itemValue="id" itemLabel="libelle" />
            </form:select>
            <form:select name="agenceIds" path="agenceIds" multiple="true">
                <form:option value="0" label="${agenceLib}"  />
                <form:options items="${agencesList}" itemValue="id" itemLabel="libelle" />
            </form:select> 
        </div>	
        <div style="display:grid; grid-template-columns: 1fr 1fr 1fr 1fr;" >
            <div>
                <form:checkbox id="showSousCompte" name="showSousCompte" path="showSousCompte"/> 
                <label style="float:none;" for="showSousCompte"><spring:message code="label.filtre.sousCompte"/></label>
            </div>
            <div>
                <form:checkbox id="showAll" name="showAll" path="showAll"/> 
                <label style="float:none;" for="showAll"><spring:message code="label.filtre.inactif"/></label>
            </div>
            <div>
                <form:checkbox id="showAdminOnly" name="showAdminOnly" path="showAdminOnly"/> 
                <label style="float:none;" for="showAdminOnly"><spring:message code="label.filtre.isAdministrateur"/></label>
            </div>
<!--            <div>
                <%--<form:checkbox id="showChoisey" name="showChoisey" path="showChoisey"/>--%> 
                <label style="float:none;" for="showChoisey">Adhernets CHOISEY</label>
            </div>
            <div>
                <%--<form:checkbox id="showBart" name="showBart" path="showBart"/>--%> 
                <label style="float:none;" for="showBart">Adhérents BART</label>
            </div>-->
            <div>
                <form:checkbox id="showArtipoleOnly" name="showArtipoleOnly" path="showArtipoleOnly"/> 
                <label style="float:none;" for="showArtipoleOnly"><spring:message code="label.filtre.isArtipole"/></label>
            </div>
        </div>
    </div>
</form:form>

<sec:authorize access="hasRole('ROLE_EXPORT')">
    <form:form id="exportListForm" method="post" modelAttribute="criteria" action="exportList">
        <form:input type="hidden" name="text" path="text"/>
        <form:input type="hidden" name="poleIds" path="poleIds"/>
        <form:input type="hidden" name="secteurIds" path="secteurIds"/>
        <form:input type="hidden" name="activiteIds" path="activiteIds"/>
        <form:input type="hidden" name="showAll" path="showAll"/>
        <form:input type="hidden" name="showSousCompte" path="showSousCompte"/>
        <form:input type="hidden" name="showAdminOnly" path="showAdminOnly"/>
        <form:input type="hidden" name="showArtipoleOnly" path="showArtipoleOnly"/>

        <div style="display: flex; align-items: center;">
            <div style="margin: 0 1.5em;">			
                <spring:message code="label.exportExcel" arguments="${listeAdherents.size()}"/> 
                <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPORT_INTERNE )">
                    <div style="margin: 0.5em 0;">
                    <form:checkbox id="exportAll" name="exportAll" path="exportAll"/> 
                    <label style="float:none;" for="exportAll"><spring:message code="label.exportAll"/></label>
                </div>
                </sec:authorize>
            </div>
            <div>
                <button id="buttonExport" class="action-button"  type="submit">Exporter</button>
            </div>
        </div>

    </form:form>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_MAILING')">
    <form:form id="mailingForm" method="post" modelAttribute="criteria" action="sendMail">
        <form:input type="hidden" name="text" path="text"/>
        <form:input type="hidden" name="poleIds" path="poleIds"/>
        <form:input type="hidden" name="secteurIds" path="secteurIds"/>
        <form:input type="hidden" name="activiteIds" path="activiteIds"/>
        <form:input type="hidden" name="showAll" path="showAll"/>
        <form:input type="hidden" name="showSousCompte" path="showSousCompte"/>
        <form:input type="hidden" name="showAdminOnly" path="showAdminOnly"/>
        <form:input type="hidden" name="showArtipoleOnly" path="showArtipoleOnly"/>

        <div id="editor" style="display:grid; border: 1px solid #82aa37; border-radius: 0.4em; margin: 0.2em; padding: 0.4em;">
            <spring:message code="label.mail.note"/>

            <span class="displayInline">
                Dirigeant : <form:checkbox path="mailingDirigeant" /> 
                Commercial : <form:checkbox path="mailingCommerce" /> 
                Administratif : <form:checkbox path="mailingAdministratif"/>  
                Compta : <form:checkbox path="mailingCompta"/> 

           </span>

            <spring:message code="label.mail.expediteur" var="expediteurPH"/>
            <form:input type="text" path="sender" placeHolder="${expediteurPH}"/>

            <spring:message code="label.mail.cc" var="ccPH"/>
            <form:input type="text" path="cc" placeHolder="${ccPH}"/>

            <spring:message code="label.mail.objet" var="objetPH"/>
            <form:input type="text" path="object" placeHolder="${objetPH}"/>

            <!-- Create the editor container -->
            <spring:message code="label.mail.message" var="messagePH"/>
            <form:textarea id="summernote" name="editordata" path="messageMail" placeholder="${messagePH }"/>

            <div>
                    <button class="action-button"  type="submit">Envoyer</button>
            </div>

        </div>
    </form:form>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_MAILING')">
    <form:form id="exportContactForm" method="post" modelAttribute="criteria" action="exportContacts">
        <form:input type="hidden" name="text" path="text"/>
        <form:input type="hidden" name="poleIds" path="poleIds"/>
        <form:input type="hidden" name="secteurIds" path="secteurIds"/>
        <form:input type="hidden" name="activiteIds" path="activiteIds"/>
        <form:input type="hidden" name="showAll" path="showAll"/>
        <form:input type="hidden" name="showSousCompte" path="showSousCompte"/>
        <form:input type="hidden" name="showAdminOnly" path="showAdminOnly"/>
        <form:input type="hidden" name="showArtipoleOnly" path="showArtipoleOnly"/>

        <div id="editor" style="display:grid; border: 1px solid #82aa37; border-radius: 0.4em; margin: 0.2em; padding: 0.4em;">
            
            <spring:message code="label.mail.note"/>

            <div class="displayInline">
                Dirigeant : <form:checkbox path="mailingDirigeant" /> 
                Commercial : <form:checkbox path="mailingCommerce" /> 
                Administratif : <form:checkbox path="mailingAdministratif"/>  
                Compta : <form:checkbox path="mailingCompta"/> 
            </div>

            <div>
                <button id="buttonExportContact" class="action-button"  type="submit">Exporter les contacts</button>
            </div>

        </div>
    </form:form>
</sec:authorize>

<div class="listeData">
    <c:forEach items="${listeAdherents}" var="adherent">
        <div class="adherents-item">
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
            <div class="detail">
                <c:url value="/adherentDetail" var="urlShowAdh"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                <a href="${urlShowAdh}" class="scabotheque-h3">
                  <c:out value="${adherent.libelle}"/>
                </a>
                <div class="info">
                    <div class="code">
                        <span class="detailLabel"><spring:message code="label.codeAdh"/></span><span class="data"><c:out value="${adherent.code}"/></span>
                        <span class="detailLabel"><spring:message code="label.pole"/></span><span class="data"><c:out value="${adherent.pole.libelle}"/></span>
                        <span class="detailLabel"><spring:message code="label.role"/></span><span class="data"><c:out value="${adherent.role.libelle}"/></span>
                    </div>
                    <div class="statut">
                        <span class="detailLabel"><spring:message code="label.codeERP"/></span><span class="data"><c:out value="${adherent.codeERP}"/></span>
                        <span class="detailLabel"><spring:message code="label.agenceRattachement"/></span><span class="data"><c:out value="${adherent.agence.libelle}"/></span>
                        <div class="etatAdh">
                            <span class="detailLabel"><spring:message code="label.etat"/></span><span class="data"><c:out value="${adherent.etat.libelle}"/></span>
                            <c:choose >
                                    <c:when test = "${adherent.compteType.id != '1'}"> 
                                        <div class="cercleOrange"></div>
                                    </c:when>
                                    <c:when test = "${adherent.cnxEolasAllow == false}"> 
                                        <div class="cercleOrange"></div>
                                    </c:when>
                                    <c:when test = "${adherent.etat.id == '1'}"> 
                                        <div class="cercleVert"></div>
                                    </c:when>
                                    <c:when test = "${adherent.etat.id == '2'}"> 
                                        <div class="cercleRouge"></div>
                                    </c:when>
                            </c:choose>

                        </div>
                    </div>
                    <div class="raccourcis">
                        <span class="command"><a href="${urlShowAdh}">
                        <svg <c:if test = "${empty adherent.contacts}">style="fill:red"</c:if>><use xlink:href="resources/images/icones.svg#contact"></use></svg></a></span>
                        <span class="command"><a href="${urlShowAdh}"><svg><use xlink:href="resources/images/icones.svg#more"></use></svg></a></span>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
	 		placeholder: '<spring:message code="label.mail.message"/>',
	 		tabsize: 2,
	 		height: 150
		  
	  });
	  
	});
	
	$( function() {
		$('#btnMenu').click(function(e){ 
			$( "#listAdhMenu" ).toggle( 'slow' );
		});
		
		$('#exportExcelLink').click(function(e){ 
			$( "#listAdhMenu" ).toggle( 'slow' );
			$( "#exportListForm" ).toggle( 'slow' );
		});

		$('#mailingLink').click(function(e){ 
			$( "#listAdhMenu" ).toggle( 'slow' );
			$( "#mailingForm" ).toggle( 'slow' );
		});

                $('#exportContactLink').click(function(e){ 
			$( "#listAdhMenu" ).toggle( 'slow' );
			$( "#exportContactForm" ).toggle( 'slow' );
		});

		$('#buttonExport').click(function(e){ 
			$( "#exportListForm" ).toggle( 'slow' );
		});
	
                $('#buttonExportContact').click(function(e){ 
			$( "#exportContactForm" ).toggle( 'slow' );
		});
		
		$('#advanceSearch').click(function(e){ 
			$( "#advanceSearchForm" ).toggle( 'slow' );
		});
                
	
	});
</script>
