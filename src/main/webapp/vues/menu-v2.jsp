<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="menuBar-background scroll-stop" id="navbar">
	<div class="menuBar-position">
		<div class="appMenu" >
		
			<!-- 	Menu Adherents -->
			<c:url value="/listeAdherents" var="urlListe" />
			<c:url value="/addAdherent" var="urlAdd" />
			<div class="menu-item <c:if test = "${pageType == 'LIST_ADHERENT' || pageType == 'CREATE_ADHERENT' || pageType == 'ADHERENT_DETAIL' || 
												pageType == 'ADHERENT_ACTIVITE' || pageType == 'ADHERENT_EXPLOITATION' || pageType == 'ADHERENT_ADMINISTRATIF' ||
												pageType == 'ADHERENT_INFORMATIQUE'}">
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
				<!-- 	Menu liste des adhernets sans menu déroulant -->
				<a class="menu-dropdown-complement <c:if test = "${pageType == 'LIST_ADHERENT' || pageType == 'CREATE_ADHERENT' || pageType == 'ADHERENT_DETAIL' || 
								pageType == 'ADHERENT_ACTIVITE' || pageType == 'ADHERENT_EXPLOITATION' || pageType == 'ADHERENT_ADMINISTRATIF' ||
								pageType == 'ADHERENT_INFORMATIQUE'}"> 
						appMenu-active
					</c:if>"  href="${urlListe}">
					<svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#card-v2"/>"></use></svg>
					<spring:message code="menu.listeadherent"/>
				</a>
			</div> 
			
			
			<!-- 	Menu Fournisseur sans menu déroulant -->
<%-- 			<c:url value="/enCours" var="url" /> --%>
<%-- 			<a class="menu-item <c:if test = "${pageType == 'GESTION_FOURNISSEUR'}"> menu-active</c:if>" href="${url}"> --%>
<%-- 				<svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#supply"/>"></use></svg> --%>
<%-- 				<spring:message code="menu.gestionFournisseur"/> --%>
<!-- 			</a> -->
			
			
			<!-- 	Fichiers partagés -->
<!-- 			<div class="menu-item"> -->
<!-- 				<div class="menu-dropdown"> -->
<!-- 				    <a href="#">  -->
<%-- 						<svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#arrow-dropdown"/>"></use></svg> --%>
<!-- 					</a> -->
<!-- 				    <div class="menu-dropdown-container scroll-stop"> -->
<!-- 						<a class="sub-menu-item" href=<c:url value="https://scabois-my.sharepoint.com/:x:/g/personal/dslowensky_scabois_onmicrosoft_com/Ea2sNJqVMptPhJSnvU_-UqoBqd2XJ9hZ7XXdXMGowEI_tA?e=6sCPV1"/> target="_blank"> -->
<%-- 							<svg class="menu-item-icon"><use xlink:href="<c:url value="/resources/images/icones.svg#excel"/>"></use></svg> --%>
<%-- 							<spring:message code="menu.testExcel"/> --%>
<!-- 						</a> -->
<!-- 				     </div> -->
<!-- 				</div>  -->
<!-- 			    	Menu liste des adhernets sans menu déroulant -->
<!-- 				<a class="menu-dropdown-complement"  href="#"> -->
<%-- 					<svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#excel"/>"></use></svg> --%>
<%-- 					<spring:message code="menu.shareFiles"/> --%>
<!-- 				</a> -->
<!-- 			</div> -->
			
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
						<a class="sub-menu-item" href=<c:url value="https://scabois-my.sharepoint.com/:x:/g/personal/dslowensky_scabois_onmicrosoft_com/Ea2sNJqVMptPhJSnvU_-UqoBqd2XJ9hZ7XXdXMGowEI_tA?e=6sCPV1"/> target="_blank">
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
					    <a class="sub-menu-item" href=<c:url value="http://srvoutils/ScaboisWiki/doku.php?id=start"/> target="_blank">
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
				      	<a class="sub-menu-item" href=<c:url value="https://scabois-my.sharepoint.com/:b:/g/personal/dslowensky_scabois_onmicrosoft_com/EUfSUBydaZVAhHedu3TbJIUBgKSbjKLliGL3rH8QX3n8cA?e=1dRHBv"/> target="_blank">
							<svg class="menu-item-icon" ><use xlink:href="<c:url value="/resources/images/icones.svg#holiday"/>"></use></svg>
							<spring:message code="menu.demandeAbsence"/>
						</a>
				   		<a class="sub-menu-item" href=<c:url value="https://scabois-my.sharepoint.com/:b:/g/personal/dslowensky_scabois_onmicrosoft_com/EWIM0mB4lLxHr3Mif63H4MABO7O6UDYdOSDTR04vc7iAmg?e=ceB1QR"/> target="_blank">
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
				<c:url value="/parametrage" var="urlParamMetier"><c:param name="type" value="Activite"/></c:url>
				<c:url value="/parametrage" var="urlParamPole"><c:param name="type" value="Pole"/></c:url>
				<c:url value="/parametrage" var="urlParamRole"><c:param name="type" value="Role"/></c:url>
				<c:url value="/parametrage" var="urlParamSecteur"><c:param name="type" value="Secteur"/></c:url>
				<c:url value="/parametrage" var="urlParamContactFonction"><c:param name="type" value="ContactFonction"/></c:url>
				<c:url value="/parametrage/listeCommunes" var="urlParamCommune"/>
				<c:url value="/parametrage/listeUtilisateurs" var="urlParamUtilisateur"/>
				<div class="menu-item">
					<div class="menu-dropdown">
					    <a class="appMenu 
					    		<c:if test = "${pageType == 'TABLES_BASE' || pageType == 'GESTION_USERS'}">
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
							<a class="sub-menu-item" href="${urlParamMetier}">
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
	