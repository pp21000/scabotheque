<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
  </ul>
    
  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">
    <!--Messages Dropdown Menu--> 
    <li>
      <a class="nav-link" href="logout">Déconnexion</a>
    </li> 
    <li class="nav-item">
      <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
        <i class="fas fa-th-large"></i>
      </a>
    </li>
  </ul>
</nav>
    
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Profil Administratif</h1>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-3">
        <!-- Profile Image -->
        <div class="card card-success card-outline">
          <div class="card-body box-profile">
            <div class="text-center">
              <c:choose >
                <c:when test = "${adherent.photoImg == ''}"> 
                  <img class="profil-user-img img-fluid" src="<c:url value="/resources/images/noAdh.png" />" />
                </c:when>
                <c:otherwise> 						
                  <img class="profil-user-img img-fluid" src="${adherent.photoImg}">
                </c:otherwise>
              </c:choose>
            </div>

            <h3 class="profile-username text-center">${adherent.denomination}</h3>
            <p class="text-muted text-center"><spring:message code="label.codeAdh"/> : <b>${adherent.code}</b></p>

            <ul class="list-group list-group-unbordered mb-3">
              <li class="list-group-item">
                <b><spring:message code="label.adhArtipole"/></b>
                <a class="float-right">
                  <c:choose>
                    <c:when test="${adherent.isArtipole}"><spring:message code="yes"/></c:when> 
                    <c:otherwise><spring:message code="no"/></c:otherwise> 
                  </c:choose>
                </a>
              </li>
              <li class="list-group-item">
                <b><spring:message code="label.pole"/></b> <a class="float-right">${adherent.pole.libelle}</a>
              </li>
              <li class="list-group-item">
                <b><spring:message code="label.agenceRattachement"/></b> <a class="float-right">${adherent.agence.libelle}</a>
              </li>
            </ul>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->

        <!-- Identité -->
        <div class="card card-success">
          <div class="card-header">
            <h3 class="card-title"><spring:message code="label.identite"/></h3>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <strong><i class="fas fa-crosshairs mr-1"></i> <spring:message code="label.secteur"/></strong>
            <p class="text-muted">${adherent.secteur.libelle}</p>
            <hr>
            <strong><i class="fas fa-map-marker-alt mr-1"></i> <spring:message code="label.adresse"/></strong>
            <p class="text-muted">${adherent.adresse}<br> 
                <c:if test="${adherent.adresseComplement}!= ''" > ${adherent.adresseComplement}<br></c:if>
                <spring:message code="message.commune" arguments="${adherent.commune.codePostal}, ${adherent.commune.libelle}"/>
            </p>
            <hr>
            <strong><i class="fas fa-search mr-1"></i> <spring:message code="label.nomRecherche"/></strong>
            <p class="text-muted">${adherent.libelle}</p>
            <hr>
            <strong><i class="fas fa-id-badge mr-1"></i> <spring:message code="label.denomination"/></strong>
            <p class="text-muted">${adherent.denomination}</p>
            <hr>
            <strong><i class="far fa-file-alt mr-1"></i> Notes</strong>
            <p class="text-muted">${commentaire}</p>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
          
      <!-- /.col -->
      <div class="col-md-9">
        <div class="card card-success card-tabs">
          
          <!--Liste des onglets-->
          <div class="card-header p-0 pt-1">
            <ul class="nav nav-tabs">
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE')">
                <li class="nav-item"><a class="nav-link active" href="#commerce" data-toggle="tab"><spring:message code="label.activite"/></a></li>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE')">
                <li class="nav-item"><a class="nav-link" href="#administratif" data-toggle="tab"><spring:message code="label.administratif"/></a></li>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CAPITAL_SOCIAL')">
                <li class="nav-item"><a class="nav-link" href="#capitalSocial" data-toggle="tab"><spring:message code="label.capitalSocial"/></a></li>
              </sec:authorize>
            </ul>
          </div><!-- /.card-header -->

          <div class="card-body">
            <div class="tab-content">
              
              <!--Activités-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE')">
                <div class="active tab-pane" id="commerce">
                  <div class="card-body pt-0">
                    <div class="card">
                      <div class="card-header">
                        <h3 class="card-title">Achat de marchandise à la Coop</h3>
                      </div>
                      <!-- /.card-header -->
                      <div class="card-body p-0">
                        <table class="table table-sm table-striped">
                          <thead>
                            <tr>
                              <th></th>
                              <th class="text-center" style="width: 4em">%tage</th>
                              <th class="text-center" style="width: 6em">Achat N</th>
                              <th class="text-center" style="width: 6em">N-1</th>
                              <th class="text-center" style="width: 6em">N-2</th>
                              <th class="text-center" style="width: 6em">N-3</th>
                              <th>Commentaire</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach items="${adhActivites}" var="adhActivite" varStatus="idx">
                              <!--Affiche le tableau en entier sauf la derniere ligne qui contient les totaux-->
                              <c:if test="${fn:length(adhActivites) gt idx.index +1}">
                                <tr>
                                  <td> 
                                    ${adhActivite.activite.libelle}
                                  </td>
                                  <td class="text-right" >
                                    ${adhActivite.pourcentage} %
                                  </td>
                                  <td class="text-right">
                                    <fmt:formatNumber pattern="#,##0.00" value="${adhActivite.achatN}"/>
                                  </td>
                                  <td class="text-right">
                                    <fmt:formatNumber pattern="#,##0.00" value="${adhActivite.achatN1}"/>
                                  </td>
                                  <td class="text-right">
                                    <fmt:formatNumber pattern="#,##0.00" value="${adhActivite.achatN2}"/>
                                  </td>
                                  <td class="text-right">
                                    <fmt:formatNumber pattern="#,##0.00" value="${adhActivite.achatN3}"/>
                                  </td>
                                  <td>
                                    ${adhActivite.commentaire}
                                  </td>
                                </tr>
                              </c:if>
                            </c:forEach>	
                          </tbody>
                          <tfoot>
                            <tr>
                              <th> 
                                Total
                              </th>
                              <th class="text-right" >
                              </th>
                              <th class="text-right">
                                <fmt:formatNumber pattern="#,##0.00" value="${adhActivites[fn:length(adhActivites)-1].totalN}"/>
                              </th>
                              <th class="text-right">
                                <fmt:formatNumber pattern="#,##0.00" value="${adhActivites[fn:length(adhActivites)-1].totalN1}"/>
                              </th>
                              <th class="text-right">
                                <fmt:formatNumber pattern="#,##0.00" value="${adhActivites[fn:length(adhActivites)-1].totalN2}"/>
                              </th>
                              <th class="text-right">
                                <fmt:formatNumber pattern="#,##0.00" value="${adhActivites[fn:length(adhActivites)-1].totalN3}"/>
                              </th>
                              <th>
                              </th>
                            </tr>
                          </tfoot>
                        </table>
                      </div>
                    </div>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.tab-pane -->
              </sec:authorize>
              
              <!--Administratif-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE')">
                <div class="tab-pane" id="Administratif">
                  <div class="card-body pt-0">

                    <div class="post">
                      <div class="user-block">
                        <span class="username text-success">
                            <spring:message code="label.administratif"/>
                        </span>
                      </div>
                      <div class="form-group row">
                        <label for="dateEntree" class="col-sm-3 col-form-label"><spring:message code="label.dateEntree"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="adresseLiv"><fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateEntree}" /></span>
                        </div>

                        
                        <label for="nbSalarie" class="col-sm-3 col-form-label"><spring:message code="label.nbSalarie"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="nbSalarie">${adherent.nbSalaries}</span>
                        </div>
            
                        <label for="role" class="col-sm-3 col-form-label"><spring:message code="label.role"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="role">${adherent.role.libelle}</span>
                        </div>

                        <label for="adherentType" class="col-sm-3 col-form-label"><spring:message code="label.adherentType"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="adherentType">${adherent.adherentType.libelle}</span>
                        </div>
            
<!--                        <label for="dateEntree" class="col-sm-3 col-form-label"><spring:message code="label.dateEntree"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="adresseLiv"><fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateEntree}" /></span>
                        </div>-->

                        <label for="formeJuridique" class="col-sm-3 col-form-label"><spring:message code="label.formeJuridique"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="formeJuridique">${adherent.formeJuridique.libelle}</span>
                        </div>

                        <label for="siren" class="col-sm-3 col-form-label"><spring:message code="label.siren"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="siren">${adherent.siren}</span>
                        </div>

                        <label for="siret" class="col-sm-3 col-form-label"><spring:message code="label.siret"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="siret">${adherent.siret}</span>
                        </div>

                        <label for="ape" class="col-sm-3 col-form-label"><spring:message code="label.ape"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="ape">${adherent.ape.libelle}</span>
                        </div>

                        <label for="numRepMetier" class="col-sm-3 col-form-label"><spring:message code="label.numRepMetier"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="numRepMetier">${adherent.numRepMetier}</span>
                        </div>

    <!-- 		<div  class="showDetailAdherent"> -->
    <%-- 	        <span class="adherentLabel"><spring:message code="label.rcsRm"/></span> --%>
    <%-- 			<span class="data">${adherent.rcsRm}</span> --%>
    <!-- 		</div> -->

                        <label for="rcsCommune" class="col-sm-3 col-form-label"><spring:message code="label.rcsCommune"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="rcsCommune"><spring:message code="message.commune" arguments="${adherent.rcsCommune.codePostal}, ${adherent.rcsCommune.libelle}"/></span>
                        </div>

                        <label for="rmCommune" class="col-sm-3 col-form-label"><spring:message code="label.rmCommune"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="rmCommune"><spring:message code="message.commune" arguments="${adherent.rmCommune.codePostal}, ${adherent.rmCommune.libelle}"/></span>
                        </div>
                
                        <label for="dateClotureExe" class="col-sm-3 col-form-label"><spring:message code="label.dateClotureExe"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="dateClotureExe"><fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateClotureExe}" /></label>
                        </div>

                        <label for="etat" class="col-sm-3 col-form-label"><spring:message code="label.etat"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="etat">${adherent.etat.libelle}</span>
                        </div>

                        <c:choose >
                            <c:when test = "${adherent.etat.id == 2}"> 
                              <label for="dateSortie" class="col-sm-3 col-form-label"><spring:message code="label.dateSortie"/></label>
                              <div class="col-sm-9 col-form-label">
                                <span id="dateSortie"><fmt:formatDate pattern="dd/MM/yyyy" value="${adherent.dateSortie}" /></span>
                              </div>
                            </c:when>
                        </c:choose>

                        <label for="cnxEolasAllow" class="col-sm-3 col-form-label"><spring:message code="label.cnxEolasAllow"/></label>
                        <div class="col-sm-9 col-form-label <c:if test="${!adherent.cnxEolasAllow}"> text-danger</c:if>">
                          <span id="cnxEolasAllow">
                            <c:choose>
                              <c:when test="${adherent.cnxEolasAllow}"><spring:message code="yes"/></c:when> 
                              <c:otherwise><spring:message code="no"/></c:otherwise> 
                            </c:choose>
                          </span>
                        </div>

                        <label for="formationCommerce" class="col-sm-3 col-form-label"><spring:message code="label.formationCommerce"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="formationCommerce">${adherent.formationDirigeant}</span>
                        </div>
                        
                      </div>
                    </div>

                        
                    <div class="post">
                      <div class="user-block">
                        <span class="username text-success">
                            <spring:message code="label.contactComptable"/>
                        </span>
                      </div>
                      <div class="form-group row">
                        
                        <label for="cabComptable" class="col-sm-3 col-form-label">Cabinet comptable</label>
                        <div class="col-sm-9 col-form-label">
                          <span id="cabComptable">${contactComptable.cabinet}</span>
                        </div> 
                        <label for="civilité" class="col-sm-3 col-form-label">Civilité comptable</label>
                        <div class="col-sm-9 col-form-label">
                          <span id="civilité">${contactComptable.civilite}</span>
                        </div> 
                        <label for="Nom" class="col-sm-3 col-form-label">Nom comptable</label>
                        <div class="col-sm-9 col-form-label">
                          <span id="Nom">${contactComptable.nom}</span>
                        </div> 
                        <label for="Prenom" class="col-sm-3 col-form-label">Prénom comptable</label>
                        <div class="col-sm-9 col-form-label">
                          <span id="Prenom">${contactComptable.prenom}</span>
                        </div> 
                        <label for="email" class="col-sm-3 col-form-label">E-mail comptable</label>
                        <div class="col-sm-9 col-form-label">
                          <span id="email">${contactComptable.mail}</span>
                        </div> 
                        <label for="fixe" class="col-sm-3 col-form-label">Tél fixe comptable</label>
                        <div class="col-sm-9 col-form-label">
                          <span id="fixe">${contactComptable.fixe}</span>
                        </div> 
                        <label for="mobile" class="col-sm-3 col-form-label">Tél mobile comptable</label>
                        <div class="col-sm-9 col-form-label">
                          <span id="mobile">${contactComptable.mobile}</span>
                        </div> 
                        
                      </div>
                    </div>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.tab-pane -->
              </sec:authorize>
              
              <!--Capitale social-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CAPITAL_SOCIAL')">
                <div class="tab-pane" id="capitalSocial">
                  <div class="card-body pt-0">
                    capital
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.tab-pane -->
              </sec:authorize>
              
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.nav-tabs-custom -->
      </div>
      <!-- /.col -->
    </div>
  </div>
</section>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
  <div class="p-3 control-sidebar-content">

    <h5> Options d'édition</h5>
    <hr class="mb-2"/>
        
    <!-- Control sidebar content goes here -->
    <div class="mb-1" >
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">    	
        <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="nav-link">
          <p>
            <i class="nav-icon fas fa-user-edit"></i>
            Infos adherent
          </p>
        </a>
      </sec:authorize>

      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">    	
        <c:url value="/edit/editAdministratifAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="nav-link">
          <p>
            <i class="fas fa-table"></i>
            Données administratives
          </p>
        </a>
      </sec:authorize>
      
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">    	
        <c:url value="/edit/editContactComptableAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="nav-link">
          <p>
            <i class="far fa-address-book"></i>
            Contact comptable
          </p>
        </a>
      </sec:authorize>
      
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE_EDIT')">    	
        <c:url value="/edit/editContactComptableAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="nav-link">
          <p>
            <i class="far fa-handshake"></i>
            Capital social
          </p>
        </a>
      </sec:authorize>
      
      
    </div>
  </div>
</aside>
<!-- /.control-sidebar -->   