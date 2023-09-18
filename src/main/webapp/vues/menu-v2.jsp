<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="menuBar-background scroll-stop" id="navbar">
    <div class="menuBar-position">
        <div class="appMenu" >
            <!-- 	Menu Adherents -->
            <c:url value="/listeAdherents" var="urlListeAdh" />
            <c:url value="/addAdherent" var="urlAdd" />
            <div class="menu-item <c:if test = "${pageType == 'LIST_ADHERENT' || pageType == 'ADHERENT_ACTIVITE' || 
                                    pageType == 'ADHERENT_ADMINISTRATIF' || pageType == 'ADHERENT_ARTIPOLE' || pageType == 'ADHERENT_DETAIL' || 
                                    pageType == 'ADHERENT_EXPLOITATION' || pageType == 'ADHERENT_INFORMATIQUE'|| pageType == 'CREATE_ADHERENT' ||
                                    pageType == 'ADHERENT_CRM' || pageType == 'ADHERENT_CAPITAL_SOCIAL' }">
                                        menu-active 
                                    </c:if>">
				
		<div class="menu-dropdown">
                    <a href="#"> 
                        <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#arrow-dropdown"/>"></use></svg>
                    </a>
                    <div  class="menu-dropdown-container scroll-stop-drop">
                        <a class="sub-menu-item" href="${urlAdd}">
                            <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#card-add"/>"></use></svg>
                            <spring:message code="menu.addadherent"/>
                        </a>
                    </div>
                </div> 
		<!-- 	Menu liste des adherents sans menu déroulant -->
		<a class="menu-dropdown-complement <c:if test = "${pageType == 'LIST_ADHERENT' || pageType == 'CREATE_ADHERENT' || pageType == 'ADHERENT_DETAIL' || 
                                                    pageType == 'ADHERENT_ACTIVITE' || pageType == 'ADHERENT_EXPLOITATION' || pageType == 'ADHERENT_ADMINISTRATIF' ||
                                                    pageType == 'ADHERENT_INFORMATIQUE'}"> 
                                                        appMenu-active
                                                    </c:if>"  href="${urlListeAdh}">
                    <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#card-v2"/>"></use></svg>
                    <spring:message code="menu.listeadherent"/>
		</a>
            </div> 

<!--/*************************************************************************************************/-->

            <c:url value="/analyse" var="urlAnalyse" />
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION')">
                <a class="menu-item <c:if test = "${pageType == 'ANALYSE'}"> menu-active</c:if>" href="${urlAnalyse}"> 
                    <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#euro"/>"></use></svg> 
                    <spring:message code="menu.analyse"/> 
                </a>
            </sec:authorize>
            
            <c:url value="/ordreTournee" var="urlOrdreTournee" />
            <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_EXPLOITATION')">
                <a class="menu-item" href="${urlOrdreTournee}"> 
                    <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg> 
                    <spring:message code="menu.gestionTournee"/> 
                </a>
            </sec:authorize>
<!--/*************************************************************************************************/-->
 			
            <!-- 	Menu Fournisseur menu déroulant -->
            <c:url value="/listeFournisseur" var="urlListeFour" />
            <c:url value="/addAdherent" var="urlAdd" />
            <c:url value="/enCours" var="url" /> 
            <div class="menu-item <c:if test = "${pageType == 'LIST_FOURNISSEUR'}">
                                        menu-active 
                                    </c:if>">
				
		<div class="menu-dropdown">
                    <a href="#"> 
                        <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#arrow-dropdown"/>"></use></svg>
                    </a>
                    <div  class="menu-dropdown-container scroll-stop-drop">
                        <a class="sub-menu-item" href="${urlAdd}">
                            <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                            <spring:message code="menu.addFournisseur"/>
                        </a>
                    </div>
                </div> 
		<!-- 	Menu liste des adhernets sans menu déroulant -->
		<a class="menu-dropdown-complement <c:if test = "${pageType == 'GESTION_FOURNISSEUR'}"> 
                                                        appMenu-active
                                                    </c:if>"  href="${urlListeFour}">
                    <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                    <spring:message code="menu.listefournisseur"/>
		</a>
            </div>
             

<!--/*************************************************************************************************/-->

            <!-- 	Gestion des produits -->
            <c:url value="/enCours" var="urlNewProduct" />	
            <div class="menu-item <c:if test = "${pageType == 'GESTION_PRODUIT'}"> menu-active</c:if>">
                <div class="menu-dropdown">
                    <a href="#"> 
                        <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#arrow-dropdown"/>"></use></svg>
                    </a>

                    <div  class="menu-dropdown-container scroll-stop-drop">
                        <a class="sub-menu-item" href="${urlNewProduct}">
                            <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#card-add"/>"></use></svg>
                            <spring:message code="menu.addProduit"/>
                        </a>
                        <a class="sub-menu-item" href=<c:url value="https://scabois-my.sharepoint.com/:f:/g/personal/damien_slowensky_scabois_fr/Eg6w4uQbtvxKlQfAeby5ydIBY_PtiOfwML3Hh4MyGhAB7w?e=UznJSE"/> target="_blank">
                            <svg class="menu-item-icon"><use xlink:href="<c:url value="/resources/images/icones.svg#excel"/>"></use></svg>
                            <spring:message code="menu.testExcel"/>
                        </a>
                    </div>
                </div> 
                <!-- 	Menu gestion des produits, partie sans menu déroulant -->
                <a class="menu-dropdown-complement <c:if test = "${pageType == 'GESTION_PRODUIT'}"> appMenu-active</c:if>"  > <%-- href="#"> --%>
                    <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#excel"/>"></use></svg>
                    <spring:message code="menu.produit"/>
                </a>
            </div>
			
			<!-- 	Liens Utiles -->
            <div class="menu-item">
                <div class="menu-dropdown">
                    <a href="#" class="appMenu"> 
                                <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#arrow-dropdown"/>"></use></svg>
                    </a>
                    <div class="menu-dropdown-container scroll-stop">
                        <a class="sub-menu-item" href=<c:url value="http://srvlinux/dokuwiki/doku.php?id=start"/> target="_blank">
                            <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#wiki"/>"></use></svg>
                            <spring:message code="menu.wiki"/>
                        </a>
                        <a class="sub-menu-item" href=<c:url value="http://macoop.scabois.fr"/> target="_blank">
                            <svg class="menu-item-icon"><use xlink:href="<c:url value="/resources/images/icones.svg#modus"/>"></use></svg>
                            <spring:message code="menu.extranet"/>
                        </a>
                        <a class="sub-menu-item" href=<c:url value="http://adherents.scabois.fr"/> target="_blank">
                            <svg class="menu-item-icon"><use xlink:href="<c:url value="/resources/images/icones.svg#book"/>"></use></svg>
                            <spring:message code="menu.openWeb"/>
                        </a>
                        <a class="sub-menu-item" href=<c:url value="https://questionnaire.dfiweb.net/"/> target="_blank">
                            <svg class="menu-item-icon"><use xlink:href="<c:url value="/resources/images/icones.svg#questionnaire"/>"></use></svg>
                            <spring:message code="menu.defiWeb"/>
                        </a>
                        <a class="sub-menu-item" href=<c:url value="http://orcab.net/"/> target="_blank">
                            <svg class="menu-item-icon"><use xlink:href="<c:url value="/resources/images/icones.svg#modus"/>"></use></svg>
                            <spring:message code="menu.electromenager"/>
                        </a>
                        <a class="sub-menu-item" href=<c:url value="https://www.facebook.com/ArtipoleDoleChoisey/"/> target="_blank">
                            <svg class="menu-item-icon"><use xlink:href="<c:url value="/resources/images/icones.svg#facebook"/>"></use></svg>
                            <spring:message code="menu.facebook"/>
                        </a>
                    </div>
                </div> 
                <a class="menu-dropdown-complement" > <%-- href="#"> --%>
                    <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#card-v2"/>"></use></svg>
                    <spring:message code="menu.gestionLiensUtils"/>
                </a>
            </div> 

            <!-- 	RH -->
            <div class="menu-item">
                <div class="menu-dropdown">
                    <a href="#" class="appMenu"> 
                        <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#arrow-dropdown"/>"></use></svg>
                    </a>
                    <div class="menu-dropdown-container scroll-stop">
                        <a class="sub-menu-item" href=<c:url value="https://scabois-my.sharepoint.com/:b:/g/personal/damien_slowensky_scabois_fr/EevREsoylwtGhD-zeaL7LjgBniEVhWTu7i22SdwSX20Sjg?e=qDpjBm"/> target="_blank">
                            <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#holiday"/>"></use></svg>
                            <spring:message code="menu.demandeAbsence"/>
                        </a>
                        <a class="sub-menu-item" href=<c:url value="https://scabois-my.sharepoint.com/:b:/g/personal/damien_slowensky_scabois_fr/EXLszvpZgltMkX9jQN5oBfQBTpptpNr7bgfsVWDA8qPHbg?e=QBeYAE"/> target="_blank">
                            <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#holiday"/>"></use></svg>
                            <spring:message code="menu.demandeConge"/>
                        </a>
                    </div>
                </div> 
                <a class="menu-dropdown-complement"  href="#">
                    <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#humanRessource"/>"></use></svg>
                    <spring:message code="menu.humanRessource"/>
                </a>
            </div> 

            <!-- 	Parametrage des tables de bases -->
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <c:url value="/parametrage" var="urlParamAgence"><c:param name="type" value="Agence"/></c:url>
                <c:url value="/parametrage/listActivites" var="urlParamActivites"/>
                <c:url value="/parametrage" var="urlParamPole"><c:param name="type" value="Pole"/></c:url>
                <c:url value="/parametrage" var="urlParamRole"><c:param name="type" value="Role"/></c:url>
                <c:url value="/parametrage" var="urlParamSecteur"><c:param name="type" value="Secteur"/></c:url>
                <c:url value="/parametrage" var="urlParamContactFonction"><c:param name="type" value="ContactFonction"/></c:url>
                <c:url value="/parametrage/listeCommunes" var="urlParamCommune"/>
                <c:url value="/parametrage/listeUtilisateurs" var="urlParamUtilisateur"/>
                <c:url value="/parametrage/listeRolesEOLAS" var="urlParamRoleEolas"/>
                <div class="menu-item">
                    <div class="menu-dropdown">
                        <a class="appMenu 
                            <c:if test = "${pageType == 'TABLES_BASE' || pageType == 'GESTION_USERS'|| pageType == 'GESTION_ROLES_EOLAS'}">
                                appMenu-active
                            </c:if>"> 
                            <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#arrow-dropdown"/>"></use></svg>
                        </a>
                        <div class="menu-dropdown-container scroll-stop">
                            <a class="sub-menu-item" href="${urlParamUtilisateur}">
                                <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                                <spring:message code="menu.paramUtilisateur"/>
                            </a>
                            <a class="sub-menu-item" href="${urlParamAgence}">
                                <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                                <spring:message code="menu.paramAgence"/>
                            </a>
                            <a class="sub-menu-item" href="${urlParamActivites}">
                                <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                                <spring:message code="menu.paramActivite"/>
                            </a>
                            <a class="sub-menu-item" href="${urlParamPole}">
                                <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                                <spring:message code="menu.paramPole"/>
                            </a>
                            <a class="sub-menu-item" href="${urlParamRole}">
                                <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                                <spring:message code="menu.paramRole"/>
                            </a>
                            <a class="sub-menu-item" href="${urlParamSecteur}">
                                <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                                <spring:message code="menu.paramSecteur"/>
                            </a>
                            <a class="sub-menu-item" href="${urlParamContactFonction}">
                                <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                                <spring:message code="menu.paramContactFonction"/>
                            </a>
                            <a class="sub-menu-item" href="${urlParamCommune}">
                                <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                                <spring:message code="menu.paramVille"/>
                            </a>
                            <a class="sub-menu-item" href="${urlParamRoleEolas}">
                                <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                                <spring:message code="menu.paramRoleEOLAS"/>
                            </a>
                        </div>
                    </div>
                    <a class="menu-dropdown-complement"  href="#">
                        <svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg>
                        <spring:message code="menu.parametrage"/>
                    </a>
                </div>
            </sec:authorize>

<!-- 			<a href="javascript:void(0);" class="menu-icon" onclick="myFunctionMenu()"> -->
<!-- 				<i class="fa fa-bars"></i> -->
<!-- 			</a> -->
        </div>
    </div>
</div>
                
<script>

window.onscroll = function() {onScrollFunction()};
var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

var elementList=document.getElementsByClassName('scroll-stop');
var nbElement=elementList.length;
var elementDropList=document.getElementsByClassName('scroll-stop-drop');
var nbElementDrop=elementDropList.length;

function onScrollFunction() {
	if (window.pageYOffset >= sticky) {
		for (var i=0 ; i<nbElementDrop ; i++){
			elementDropList[i].classList.add("sticky-dropdown")
		}
		for (var i=0 ; i<nbElement ; i++){
			elementList[i].classList.add("sticky")
		}
		navbar.classList.add("sticky")
	} else {
		for (var i=0 ; i<nbElementDrop ; i++){
			elementDropList[i].classList.remove("sticky-dropdown")
		}
		for (var i=0 ; i<nbElement ; i++){
			elementList[i].classList.remove("sticky")
		}
		navbar.classList.remove("sticky");
  }
}

</script>
	