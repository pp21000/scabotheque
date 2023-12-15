<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


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
        <h1>Profil Adhérent</h1>
      </div>
      <!--          <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">User Profile</li>
              </ol>
            </div>-->
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
              <c:choose>
                <c:when test="${adherent.photoImg == ''}">
                  <img class="profil-user-img img-fluid"
                       src="<c:url value="/resources/images/noAdh.png"/>"/>
                </c:when>
                <c:otherwise>
                  <img class="profil-user-img img-fluid" src="${adherent.photoImg}">
                </c:otherwise>
              </c:choose>
            </div>

            <h3 class="profile-username text-center">${adherent.denomination}</h3>
            <p class="text-muted text-center"><spring:message code="label.codeAdh"/> :
              <b>${adherent.code}</b></p>

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
                <b><spring:message code="label.pole"/></b> <a
                  class="float-right">${adherent.pole.libelle}</a>
              </li>
              <li class="list-group-item">
                <b><spring:message code="label.agenceRattachement"/></b> <a
                  class="float-right">${adherent.agence.libelle}</a>
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
            <strong><i class="fas fa-map-marker-alt mr-1"></i> <spring:message
                code="label.adresse"/></strong>
            <p class="text-muted">${adherent.adresse}<br>
              <c:if test="${adherent.adresseComplement}!= ''"> ${adherent.adresseComplement}<br></c:if>
              <spring:message code="message.commune"
                              arguments="${adherent.commune.codePostal}, ${adherent.commune.libelle}"/>
            </p>
            <hr>
            <strong><i class="fas fa-search mr-1"></i> <spring:message code="label.nomRecherche"/></strong>
            <p class="text-muted">${adherent.libelle}</p>
            <hr>
            <strong><i class="fas fa-id-badge mr-1"></i> <spring:message
                code="label.denomination"/></strong>
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
              <li class="nav-item"><a class="nav-link active" href="#contact" data-toggle="tab"><spring:message code="label.contacts"/></a></li>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE')">
                <li class="nav-item"><a class="nav-link" href="#commerce" data-toggle="tab"><spring:message code="label.activite"/></a></li>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE')">
                <li class="nav-item"><a class="nav-link" href="#artipole" data-toggle="tab"><spring:message code="label.artipole"/></a></li>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION')">
                <li class="nav-item"><a class="nav-link" href="#logistique" data-toggle="tab"><spring:message code="label.exploitation"/></a></li>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM')">
                <li class="nav-item"><a class="nav-link" href="#CRM" data-toggle="tab"><spring:message code="label.crm"/></a></li>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE')">
                <li class="nav-item"><a class="nav-link" href="#administratif" data-toggle="tab"><spring:message code="label.administratif"/></a></li>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CAPITAL_SOCIAL')">
                <li class="nav-item"><a class="nav-link" href="#capitalSocial" data-toggle="tab"><spring:message code="label.capitalSocial"/></a></li>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE')">
                <li class="nav-item"><a class="nav-link" href="#informatique" data-toggle="tab"><spring:message code="label.informatique"/></a></li>
              </sec:authorize>
            </ul>
          </div><!-- /.card-header -->

          <div class="card-body">
            <div class="tab-content">

              <!--Contacts-->
              <div class="active tab-pane" id="contact">
                <div class="card-body pb-0">
                  <div class="row d-flex align-items-stretch">
                    <c:forEach items="${contacts}" var="contact">
                      <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                        <div class="card bg-light" style="width: 100%;">
                          <div class="card-body pt-0">
                            <div class="row">
                              <div class="col-7">
                                <h2 class="lead"><b><c:out
                                      value="${contact.civilite} ${contact.nom} ${contact.prenom}"/></b>
                                </h2>
                                <p class="text-muted text-sm"><b>Fonction: </b><c:out
                                    value="${contact.fonction.libelle}"/></p>
                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                  <li class="small">${contact.mail}</li>
                                  <li class="small">${contact.fixe}</li>
                                  <li class="small">${contact.mobile}</li>
                                  <li class="small"><fmt:formatDate
                                      pattern="dd/MM/yyyy"
                                      value="${contact.dateNaissance}"/>
                                    <spring:message code="Age"
                                                    arguments="${contact.age}"/></li>
                                </ul>
                              </div>
                              <div class="col-5 text-center">
                                <c:choose>
                                  <c:when test="${contact.photoImg == ''}">
                                    <img class="profil-user-img img-fluid"
                                         src="<c:url value="/resources/images/noAdh.png"/>"/>
                                  </c:when>
                                  <c:otherwise>
                                    <img class="profil-user-img img-fluid"
                                         src="${contact.photoImg}">
                                  </c:otherwise>
                                </c:choose>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>

              <!--Activités-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ACTIVITE')">
                <div class="tab-pane" id="commerce">
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
                            <c:forEach items="${adhActivites}" var="adhActivite"
                                       varStatus="idx">
                              <!--Affiche le tableau en entier sauf la derniere ligne qui contient les totaux-->
                              <c:if test="${fn:length(adhActivites) gt idx.index +1}">
                                <tr>
                                  <td>
                                    ${adhActivite.activite.libelle}
                                  </td>
                                  <td class="text-right">
                                    ${adhActivite.pourcentage} %
                                  </td>
                                  <td class="text-right">
                                    <fmt:formatNumber pattern="#,##0.00"
                                                      value="${adhActivite.achatN}"/>
                                  </td>
                                  <td class="text-right">
                                    <fmt:formatNumber pattern="#,##0.00"
                                                      value="${adhActivite.achatN1}"/>
                                  </td>
                                  <td class="text-right">
                                    <fmt:formatNumber pattern="#,##0.00"
                                                      value="${adhActivite.achatN2}"/>
                                  </td>
                                  <td class="text-right">
                                    <fmt:formatNumber pattern="#,##0.00"
                                                      value="${adhActivite.achatN3}"/>
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
                              <th class="text-right">
                              </th>
                              <th class="text-right">
                                <fmt:formatNumber pattern="#,##0.00"
                                                  value="${adhActivites[fn:length(adhActivites)-1].totalN}"/>
                              </th>
                              <th class="text-right">
                                <fmt:formatNumber pattern="#,##0.00"
                                                  value="${adhActivites[fn:length(adhActivites)-1].totalN1}"/>
                              </th>
                              <th class="text-right">
                                <fmt:formatNumber pattern="#,##0.00"
                                                  value="${adhActivites[fn:length(adhActivites)-1].totalN2}"/>
                              </th>
                              <th class="text-right">
                                <fmt:formatNumber pattern="#,##0.00"
                                                  value="${adhActivites[fn:length(adhActivites)-1].totalN3}"/>
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

              <!--Artipôle-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ARTIPOLE')">
                <div class="tab-pane" id="artipole">
                  <div class="card-body pt-0">
                    <dl class="row">
                      <dt class="col-sm-4"><spring:message code="label.adhArtipole"/></dt>
                      <dd class="col-sm-8">
                        <c:choose>
                          <c:when test="${adherent.isArtipole}"><spring:message
                              code="yes"/></c:when>
                          <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
                      </dd>
                      <dt class="col-sm-4"><spring:message code="label.charteArtipole"/></dt>
                      <dd class="col-sm-8">
                        <c:choose>
                          <c:when test="${adherent.isCharteArtipole}"><spring:message
                              code="yes"/></c:when>
                          <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
                      </dd>
                      <dt class="col-sm-4"><spring:message code="label.flocageArtipole"/></dt>
                      <dd class="col-sm-8">
                        <c:choose>
                          <c:when test="${adherent.isFlocageArtipole}"><spring:message
                              code="yes"/></c:when>
                          <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
                      </dd>
                      <dt class="col-sm-4"><spring:message code="label.siteArtipole"/></dt>
                      <dd class="col-sm-8">
                        <c:choose>
                          <c:when test="${adherent.isWebArtipole}"><spring:message
                              code="yes"/></c:when>
                          <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
                      </dd>
                      <dt class="col-sm-4"><spring:message code="label.facebookArtipole"/></dt>
                      <dd class="col-sm-8">
                        <c:choose>
                          <c:when test="${adherent.isFacebookArtipole}"><spring:message
                              code="yes"/></c:when>
                          <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
                      </dd>
                    </dl>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.tab-pane -->
              </sec:authorize>

              <!--Exploitation-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION')">
                <div class="tab-pane" id="logistique">
                  <div class="card-body pt-0">
                    <dl class="row">
                      <dt class="col-sm-4"><spring:message code="label.agenceRattachement"/></dt>
                      <dd class="col-sm-8">${adherent.agence.libelle}</dd>

                      <dt class="col-sm-4"><spring:message code="label.secteur"/></dt>
                      <dd class="col-sm-8">${adherent.secteur.libelle}</dd>
                      <dt class="col-sm-4"><spring:message code="label.tournee"/></dt>
                      <dd class="col-sm-8">${adherent.tournee.libelle}</dd>

                      <dt class="col-sm-4"><spring:message code="label.adresseLivraison"/></dt>
                      <dd class="col-sm-8">${infoExploitation.adresseLivraison}</dd>
                      <dt class="col-sm-4"><spring:message code="label.adresseComplement"/></dt>
                      <dd class="col-sm-8">${infoExploitation.adresseComplement}</dd>
                      <dt class="col-sm-4"><spring:message code="label.commune"/></dt>
                      <dd class="col-sm-8"><spring:message code="message.commune" arguments="${infoExploitation.commune.codePostal}, ${infoExploitation.commune.libelle}"/></dd>
                      <dt class="col-sm-4"><spring:message code="label.contactLogistique"/></dt>
                      <dd class="col-sm-8">${contactReception.getLibelle}</dd>
                      <dt class="col-sm-4"></dt>
                      <dd class="col-sm-8">${contactReception.getMobile}</dd>
                      <dt class="col-sm-4"></dt>
                      <dt class="col-sm-4"><spring:message code="label.accesSemi"/></dt>
                      <dd class="col-sm-8">
                        <c:choose>
                          <c:when test="${infoExploitation.isAccesSemi}"><spring:message
                              code="yes"/></c:when>
                          <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
                      </dd>
                      <dt class="col-sm-4"><spring:message code="label.outilDechargement"/></dt>
                      <dd class="col-sm-8">
                        <c:choose>
                          <c:when test="${infoExploitation.isMaterielDechargement}"><spring:message
                              code="yes"/></c:when>
                          <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
                      </dd>
                      <dt class="col-sm-4"><spring:message code="label.authorisationOutils"/></dt>
                      <dd class="col-sm-8">
                        <c:choose>
                          <c:when test="${infoExploitation.isAuthorise}"><spring:message
                              code="yes"/></c:when>
                          <c:otherwise><spring:message code="no"/></c:otherwise>
                        </c:choose>
                      </dd>
                      <dt class="col-sm-4"><spring:message code="label.commentaireMateriel"/></dt>
                      <dd class="col-sm-8">${infoExploitation.outillageCommentaire}</dd>
                      <dt class="col-sm-4"><spring:message
                          code="label.protocolDechargement"/></dt>
                      <dd class="col-sm-8">${infoExploitation.protocolDechargement}</dd>
                    </dl>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.tab-pane -->
              </sec:authorize>

              <!--CRM-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM')">
                <div class="tab-pane" id="CRM">
                  <div class="card-body pt-0">
                    <form:form class="form-inline ml-3" method="post"
                               action="adherentCRM?idAdh=${adherent.id}">
                      <input type="hidden" value="${adherent.id}" name="adhId">
                      <spring:message code="label.texteRecherche" var="recherchePH"/>

                      <div class="input-group input-group-sm">
                        <form:input style="form-control " type="text" path="text"
                                    placeholder="${recherchePH}" autofocus="true"/>
                        <div class="input-group-append">
                          <button id="actionButton" class="btn btn-info btn-flat"
                                  type="submit">
                            <span id="actionSpinner"
                                  class="spinner-border text-light spinner-border-sm d-none"
                                  role="status" aria-hidden="true"></span>
                            Rechercher
                          </button>
                        </div>
                      </div>
                    </form:form>
                    <c:forEach items="${infoSuiviVisite}" var="visite">
                      <div class="form-group">
                        <label>
                          <span class="detailLabel"><spring:message
                              code="label.dateSuivi"/></span>
                          <span class="data"><fmt:formatDate pattern="dd/MM/yyyy"
                                          value="${visite.dateCommentaire}"/></span>
                        </label>
                        <div class="callout callout-success">
                          <p>${visite.commentaireString}</p>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.tab-pane -->
              </sec:authorize>

              <!--Administratif-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADMIN_FINANCE')">
                <div class="tab-pane" id="Administratif">
                  <div class="card-body pt-0">
                    Admin
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

              <!--Informatique-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE')">
                <div class="tab-pane" id="Informatique">
                  <div class="card-body pt-0">
                    Info
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

    <h5> Options </h5>
    <hr class="mb-2"/>

    <!-- Control sidebar content goes here -->
    <div class="mb-1">
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
        <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="nav-link">
          <p>
            <i class="nav-icon fas fa-user-edit"></i>
            Editer les infos adherent
          </p>
        </a>
      </sec:authorize>

      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">
        <c:url value="/edit/editAdherentContact" var="url"><c:param name="idAdh"
                                                                    value="${adherent.id}"/></c:url>
        <a href="${url}" class="nav-link">
          <p>
            <i class="far fa-address-book"></i>
            Editer les contacts
          </p>
        </a>


      </sec:authorize>
    </div>
  </div>
</aside>
<!-- /.control-sidebar -->   